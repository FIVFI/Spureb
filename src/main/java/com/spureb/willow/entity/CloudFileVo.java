package com.spureb.willow.entity;

import lombok.Data;

@Data
public class CloudFileVo {
    private String fileName;
    private String filePath;
    private String lastModifiedTime;
    private String fileSize;
}
