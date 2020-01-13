package com.spureb.willow.mapper;

import com.spureb.willow.entity.ResourceVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysFolderMapper {
    List<ResourceVo> getFolderList(Integer account);
}
