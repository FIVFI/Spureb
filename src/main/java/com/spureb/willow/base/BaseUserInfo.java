package com.spureb.willow.base;

import com.spureb.willow.entity.UserMenuListVo;
import com.spureb.willow.entity.UserVo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import java.util.List;

public class BaseUserInfo {

    public static UserVo getCurrentUser(){
        Subject subject =SecurityUtils.getSubject();
        if(subject.isAuthenticated()){
            UserVo userVo = (UserVo) subject.getPrincipal();
            return userVo;
        }
        return null;
    }

    public static List<UserMenuListVo> queryCurrentUserResources() {
        List<UserMenuListVo> resourceVos = (List<UserMenuListVo>) SecurityUtils.getSubject().getSession().getAttribute("currUserResources");
        return resourceVos;
    }
}
