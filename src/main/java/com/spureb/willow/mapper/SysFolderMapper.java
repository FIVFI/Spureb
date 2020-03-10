package com.spureb.willow.mapper;

import com.spureb.willow.entity.UserMenuListVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysFolderMapper {
    List<UserMenuListVo> getFolderList(Integer account);
}
