package com.spureb.willow.service;

import com.spureb.willow.entity.ResourceVo;

import java.util.List;

public interface SysFolderService {

    List<ResourceVo> getFolderList(Integer account);
}
