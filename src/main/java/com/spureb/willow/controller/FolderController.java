package com.spureb.willow.controller;

import com.spureb.willow.base.BaseErrorEnum;
import com.spureb.willow.base.BaseResponse;
import com.spureb.willow.entity.CloudFileVo;
import com.spureb.willow.entity.DownloadRecord;
import com.spureb.willow.entity.ResourceVo;
import com.spureb.willow.service.SysFolderService;
import com.sun.jmx.snmp.Timestamp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
public class FolderController {

    @Resource
    SysFolderService sysFolderService;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpServletResponse response;

    @PostMapping( value = "/upload/file" )
    public BaseResponse getFolderList(Integer account){
        try {
            List<ResourceVo> resourceVo = new ArrayList<>();
            resourceVo = sysFolderService.getFolderList(account);
            return BaseResponse.create(resourceVo);
        }catch (Exception e){
            e.printStackTrace();
            return BaseResponse.create(BaseErrorEnum.ERROR);
        }
    }

    @PostMapping( value = "/cloud/file/upload" )
    public BaseResponse cloudFileUpload(MultipartFile[] files){
        try {
            for(MultipartFile file:files){
                //原始文件名称
                String sourceName = file.getOriginalFilename();
                //文件类型
                String fileType = sourceName.substring(sourceName.lastIndexOf("."));

                if(file.isEmpty() || fileType == null || "".equals(fileType)){}

                // 存放文件临时路径
                String base = request.getSession().getServletContext().getRealPath("/upload");
                //获取文件临时路径
                File fileDir = new File(base);
                if(!fileDir.exists()){
                    fileDir.mkdirs();
                }

                //将文件上传至临时目录
                String path = base + File.separator + sourceName;

                File upload = new File(path);

                System.out.println(path);
                try{
                    file.transferTo(upload);
                }catch (IOException e){
                    return BaseResponse.create(BaseErrorEnum.SUCCESS,"IO流异常");
                }
            }
            return BaseResponse.create(BaseErrorEnum.SUCCESS,"文件上传成功");
        }catch (Exception e){
            e.printStackTrace();
            return BaseResponse.create(BaseErrorEnum.ERROR,"后台处理失败");
        }
    }

    @GetMapping ( value = "/cloud/file/query" )
    public BaseResponse cloudFileQuery() {
        List<CloudFileVo> cloudFileVos = new ArrayList<>();
        try {
            String base = request.getSession().getServletContext().getRealPath("/upload/");
            File uploadDest = new File(base);
            if(uploadDest.isDirectory()){
                File[] files = uploadDest.listFiles();
                for (File file:files) {
                    CloudFileVo cloudFileVo = new CloudFileVo();

                    //文件名称
                    cloudFileVo.setFileName(file.getName());
                    //获取文件最后更改时间
                    SimpleDateFormat df = new java.text.SimpleDateFormat("MM-dd HH:mm:ss");
                    String dateTime=df.format(new Date(file.lastModified()));
                    cloudFileVo.setLastModifiedTime(dateTime);
                    cloudFileVo.setFilePath(file.getPath());
                    cloudFileVo.setFileSize(file.length()/1024+"kb");
                    cloudFileVos.add(cloudFileVo);
                }
            }else if(uploadDest.isFile()){

            }
            return BaseResponse.create(cloudFileVos);
        }catch (Exception e){
            return BaseResponse.create(BaseErrorEnum.ERROR);
        }

    }

    @GetMapping(value = "/cloud/file/download")
    public String fileDownLoad(String fileName,String filePath) throws Exception{

            DownloadRecord downloadRecord = new DownloadRecord(fileName,filePath,request);
            //设置响应头和客户端保存文件名
            response.setCharacterEncoding("utf-8");
            response.setContentType("multipart/form-data");
            response.setHeader("Content-Disposition","attachment;fileName="+fileName);
            //用于记录以完成的下载的数据量，单位是byte
            long downloadLength = 0L;
        try {
           //打开本地文件流
           InputStream inputStream = new FileInputStream(filePath);
           //激活下载操作
           OutputStream outputStream = response.getOutputStream();
           //循环写入输出流
            byte[] bytes = new byte[2048];
            int length;
            while((length = inputStream.read(bytes))>0){
                outputStream.write(bytes,0,length);
                downloadLength+=bytes.length;
            }
            outputStream.close();
            inputStream.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        downloadRecord.setStatus(DownloadRecord.STATUS_SUCCESS);
        downloadRecord.setEndTime(new Timestamp(System.currentTimeMillis()));
        downloadRecord.setLength(downloadLength);
        return null;
    }


    @GetMapping(value="/downloadEntity")
    public ResponseEntity<byte[]> downloadsEntity(String fileName,String filePath) throws Exception{
        System.out.println(fileName);
        System.out.println(filePath);
        String	path = "C:/";
        String  pathName = "default.png";
        File file=new File(filePath);
        if(!file.isFile()){
            return null;
        }
        @SuppressWarnings("resource")
        InputStream input=new FileInputStream(file);
        byte[] buff=new byte[input.available()]; // 获取文件大小
        input.read(buff) ;
        HttpHeaders headers=new HttpHeaders();
        headers.add("Content-Disposition", "attachment;filename="+fileName);
        HttpStatus status=HttpStatus.OK;
        ResponseEntity<byte[]> entity=new ResponseEntity<byte[]>(buff,headers,status);
        return  entity;
    }
}
