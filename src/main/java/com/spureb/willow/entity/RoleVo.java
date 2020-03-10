package com.spureb.willow.entity;

import lombok.Data;

import java.util.List;

@Data
public class RoleVo {

    private Integer roleId         ;
    private String roleName  ;
    private String roleCode  ;
    private Integer seq;
    private Integer available  ;
    private String canDelete ;
    private String createDate;

    /**
     * 角色拥有的菜单集合
     */
    private List<UserMenuListVo> menuList;
}
