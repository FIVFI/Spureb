package com.spureb.willow.base;

import lombok.Data;

/**
 * 通用返回对象
 */
@Data
public class BaseResponse<T> {

    /** 返回状态码 */
    private int code;

    /** 返回消息 */
    private String message;

    /** 返回数据 */
    private T data;

    /** 数据总条数 */
    private long total;

    public static BaseResponse create() {
        return new BaseResponse(BaseErrorEnum.SUCCESS.getCode(), BaseErrorEnum.SUCCESS.getMessage(), null);
    }

    public static BaseResponse<Object> create(Object data) {
        return new BaseResponse(BaseErrorEnum.SUCCESS.getCode(), BaseErrorEnum.SUCCESS.getMessage(), data);
    }

    public static BaseResponse create(Object data, String message) {
        return new BaseResponse(BaseErrorEnum.SUCCESS.getCode(), message, data);
    }

    public static BaseResponse create(Object data, long total) {
        return new BaseResponse(BaseErrorEnum.SUCCESS.getCode(), BaseErrorEnum.SUCCESS.getMessage(), data, total);
    }

    public static BaseResponse create(BaseErrorEnum baseErrorEnum) {
        return new BaseResponse(baseErrorEnum.getCode(), baseErrorEnum.getMessage());
    }

    public static BaseResponse create(BaseErrorEnum baseErrorEnum, String message) {
        return new BaseResponse(baseErrorEnum.getCode(), message);
    }

    public BaseResponse(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public BaseResponse(int code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public BaseResponse(int code, String message, T data, long total) {
        this.code = code;
        this.message = message;
        this.data = data;
        this.total = total;
    }

}
