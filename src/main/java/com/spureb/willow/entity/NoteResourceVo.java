package com.spureb.willow.entity;

import lombok.Data;

@Data
public class NoteResourceVo {

    private Integer noteResourceId;
    private String noteTitle;
    private Integer byAuthor;
    private String authorName;
    private String htmlContent;
    private String supportQty;
    private String createDate;
    private String updateDate;
    private Integer editType;
    private Integer resourceType;

}
