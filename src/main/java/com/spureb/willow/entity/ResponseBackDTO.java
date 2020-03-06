package com.spureb.willow.entity;

import lombok.Data;

/**
 * 用户参数
 */
@Data
public class ResponseBackDTO {

    private int errorCode; // 业务错误码 (returnState为0表示具体业务异常)

    private String errorMessage; // 提示信息(失败原因描述,若成功则值为"success")

    private String data;

    private Boolean success;
}
