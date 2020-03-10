package com.spureb.willow.entity;

import lombok.Data;

@Data
public class UserMenuListVo {

    private Integer menuId;
    private String menuName;
    private String menuCode;
    private String menuFont;
    private String menuType;
    private String menuUrl ;
    private Integer menuSeq;
    private Integer parentId;
    private String userAccount;
}
