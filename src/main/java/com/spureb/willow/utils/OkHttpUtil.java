package com.spureb.willow.utils;

import okhttp3.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 网络请求
 */
public class OkHttpUtil {

    private static OkHttpClient client;
    public static final MediaType JSON = MediaType.get("application/json;charset=utf-8");
    public static String message = "请求失败！";

    private static void init() {
        if (client == null) {
            client = new OkHttpClient();
        }
    }

    /**
     * get请求
     * @param url 请求地址
     * @return
     */
    public static String get(String url) {
        return get(url, "Content-Type", JSON.toString());
    }

    /**
     * get请求
     * @param url 请求地址
     * @param paramMap 请求参数
     * @return
     */
    public static String get(String url, Map<String, Object> paramMap) {
        return get(url, paramMap, "Content-Type", JSON.toString());
    }

    /**
     * get请求
     * @param url 请求地址
     * @param header 请求header 示例 “ "Content-Type", "application/json;charset-utf-8" ”
     * @return
     */
    public static String get(String url, String... header) {
        return get(url, null, header);
    }

    /**
     * get请求
     * @param url 请求地址
     * @param paramMap 请求参数
     * @param header 请求header 示例 “ "Content-Type", "application/json;charset-utf-8" ”
     * @return
     */
    public static String get(String url, Map<String, Object> paramMap, String... header) {
        try {
            init();

            HttpUrl.Builder urlBuilder = HttpUrl.get(url).newBuilder();
            if (paramMap != null) {
                for (Map.Entry<String, Object> entry : paramMap.entrySet()) {
                    urlBuilder.addQueryParameter(entry.getKey(), entry.getValue()+"");
                }
            }

            Headers headers = Headers.of(header);
            Request request = new Request.Builder()
                    .url(urlBuilder.build())
                    .headers(headers)
                    .build();

            return response(request);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * post请求
     * @param url 请求地址
     * @param json JSON格式参数
     * @return
     */
    public static String post(String url, String json) {
        return post(url, json, new HashMap<>());
    }

    /**
     * post请求
     * @param url 请求地址
     * @param json JSON格式参数
     * @param header 请求header 示例 “ "Content-Type", "application/json;charset-utf-8" ”
     * @return
     */
    public static String post(String url, String json, Map<String, String> header) {
        try {
            init();

            RequestBody body = RequestBody.create(json, JSON);
            Headers headers = Headers.of(header);
            Request request = new Request.Builder()
                    .url(url)
                    .headers(headers)
                    .post(body)
                    .build();
            return response(request);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 执行请求
     * @param request 请求对象
     * @return
     */
    private static String response(Request request) {
        try {
            Response response = client.newCall(request).execute();
            return response.body().string();
        } catch (IOException e) {
            message = e.getMessage();
            e.printStackTrace();
        }
        return null;
    }
}
