package com.spureb.willow.entity;

import lombok.Data;

import java.util.List;

@Data
public class UserVo {
    private Integer userId;
    private String userAccount;
    private String userPassword;
    private String userName;
    private String userPhone;

    private Integer companyId;
    private String companyName;

    private Integer available;

    /**
     * 用户拥有的菜单集合
     */
    private List<UserMenuListVo> menuList;
}
