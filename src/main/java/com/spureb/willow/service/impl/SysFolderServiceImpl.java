package com.spureb.willow.service.impl;

import com.spureb.willow.entity.UserMenuListVo;
import com.spureb.willow.mapper.SysFolderMapper;
import com.spureb.willow.service.SysFolderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SysFolderServiceImpl implements SysFolderService {

    @Resource
    SysFolderMapper sysFolderMapper;

    @Override
    public List<UserMenuListVo> getFolderList(Integer account) {
        try {
            return sysFolderMapper.getFolderList(account);
        }catch (Exception e){
           e.printStackTrace();
            return null;
        }
    }
}
