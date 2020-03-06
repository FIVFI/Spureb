package com.spureb.willow.utils;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.List;

/**
 * json格式转化
 */
public class JSONUtil {

    private static ObjectMapper objectMapper;

    public static void init() {
        if (objectMapper == null) {
            objectMapper = new ObjectMapper();
            objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);

        }
    }

    /** 将对象转为json字符串 */
    public static String toJSONString(Object object) {
        try {
            init();
            return objectMapper.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return "";
    }

    /** 将json字符串转为对象 */
    public static <T> T parseObject(String text, Class<T> clazz) {
        try {
            init();
            return objectMapper.readValue(text, clazz);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /** 将json字符串转为集合对象 */
    public static <T> List<T> parseArray(String text, Class<T> clazz) {
        try {
            init();
            JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, clazz);
            return objectMapper.readValue(text, javaType);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
