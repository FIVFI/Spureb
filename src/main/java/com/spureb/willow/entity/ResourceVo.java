package com.spureb.willow.entity;

import lombok.Data;

@Data
public class ResourceVo {

    private Integer resourceId;
    private String resourceName;
    private String resourceType;
    private String resourceUrl ;
    private String resourceFont;
    private Integer seq;
    private Integer parentId;
}
