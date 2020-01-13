package com.spureb.willow.base;

/**
 * 通用返回状态、消息
 */
public enum BaseErrorEnum {
    SUCCESS(200, "处理成功！"),
    ERROR(500, "处理失败！"),
    ERROR_AUTH(500, "没有权限！"),
    ERROR_NODATA(500, "解析失败，无正确数据"),
    ERROR_TYPE(500, "解析失败，请检查正确的产品状态");


    private int code;
    private String message;
    BaseErrorEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
