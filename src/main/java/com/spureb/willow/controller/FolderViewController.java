package com.spureb.willow.controller;

import com.spureb.willow.base.BaseErrorEnum;
import com.spureb.willow.base.BaseResponse;
import com.spureb.willow.entity.UserMenuListVo;
import com.spureb.willow.service.SysFolderService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@RestController
public class FolderViewController {

    @Resource
    SysFolderService sysFolderService;

    @GetMapping( value = "/get/folder/list" )
    public BaseResponse getFolderList(Integer account){
        try {
            List<UserMenuListVo> resourceVo = new ArrayList<>();
            resourceVo = sysFolderService.getFolderList(account);
            return BaseResponse.create(resourceVo);
        }catch (Exception e){
            e.printStackTrace();
            return BaseResponse.create(BaseErrorEnum.ERROR);
        }
    }
}
