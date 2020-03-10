package com.spureb.willow.service;

import com.spureb.willow.entity.UserMenuListVo;

import java.util.List;

public interface SysFolderService {

    List<UserMenuListVo> getFolderList(Integer account);
}
