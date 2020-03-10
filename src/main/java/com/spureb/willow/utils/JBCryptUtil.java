package com.spureb.willow.utils;

import org.mindrot.jbcrypt.BCrypt;

/**
 * 加密工具
 */
public class JBCryptUtil {

    /**
     * 加密
     * @param password 加密前的密码
     * @return
     */
    public static String hashpw(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    /**
     * 验证密码
     * @param password 原密码
     * @param hashed 加密后的密文
     * @return
     */
    public static boolean checkpw(String password, String hashed) {
        return BCrypt.checkpw(password, hashed);
    }
}
