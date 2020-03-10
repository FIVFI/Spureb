package com.spureb.willow.mapper;

import com.spureb.willow.entity.UserMenuListVo;
import com.spureb.willow.entity.UserVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SysUserMapper {

    UserVo queryUserByVo(UserVo userVo);

    List<UserMenuListVo> listSysResourcesByVo(UserMenuListVo resourceVo);
}
