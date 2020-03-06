package com.spureb.willow.controller;

import com.spureb.willow.base.BaseErrorEnum;
import com.spureb.willow.base.BaseResponse;
import com.spureb.willow.entity.ResourceVo;
import com.spureb.willow.entity.ResponseBackDTO;
import com.spureb.willow.service.SysFolderService;
import com.spureb.willow.utils.JSONUtil;
import com.spureb.willow.utils.OkHttpUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@RestController
public class HttpController {

    @GetMapping( value = "/ClashOfClans/get/players",produces="text/html;charset=UTF-8" )
    public Object ClashOfClansGetPlayers(String account){
        try {
            return OkHttpUtil.get("https://api.clashofclans.com/v1/players/%23"+account,"authorization","Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImE3ZTc5YzRjLWRkNmItNDU5ZS04MmM1LTVhMjI2MTRiY2Q0MCIsImlhdCI6MTU4MTA3MzYyNywic3ViIjoiZGV2ZWxvcGVyL2VmNjM1YTE3LWFkNWMtZmNhZC02YTYxLWUzNTBiODgyN2RiMiIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjIxMC4yMi43NC4yMTYiXSwidHlwZSI6ImNsaWVudCJ9XX0.IkF20DnFw5_xHBEF6BFeJghzg6LhpZ0UhZ727RgsVru8-dHze-Lk5Li1ShWzt2oM-2_W0ajQL_CATpAiODIFBQ");//请求第二服务器接口
        }catch (Exception e){
            e.printStackTrace();
            return BaseResponse.create(BaseErrorEnum.ERROR);
        }
    }

    @GetMapping( value = "/ClashOfClans/get/clans",produces="text/html;charset=UTF-8" )
    public Object ClashOfClansGetClans(String cid){
        try {
            return OkHttpUtil.get("https://api.clashofclans.com/v1/clans/%23"+cid+"/members","authorization","Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImE3ZTc5YzRjLWRkNmItNDU5ZS04MmM1LTVhMjI2MTRiY2Q0MCIsImlhdCI6MTU4MTA3MzYyNywic3ViIjoiZGV2ZWxvcGVyL2VmNjM1YTE3LWFkNWMtZmNhZC02YTYxLWUzNTBiODgyN2RiMiIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjIxMC4yMi43NC4yMTYiXSwidHlwZSI6ImNsaWVudCJ9XX0.IkF20DnFw5_xHBEF6BFeJghzg6LhpZ0UhZ727RgsVru8-dHze-Lk5Li1ShWzt2oM-2_W0ajQL_CATpAiODIFBQ");//请求第二服务器接口
        }catch (Exception e){
            e.printStackTrace();
            return BaseResponse.create(BaseErrorEnum.ERROR);
        }
    }

}
