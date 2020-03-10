package com.spureb.willow.config.shiro;


import com.spureb.willow.utils.JBCryptUtil;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 自定义密码验证规则
 */
public class MyHashedCredentialsMatcher extends HashedCredentialsMatcher {

    private static Logger logger = LoggerFactory.getLogger(MyHashedCredentialsMatcher.class);

    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        // 前端账号密码
        String account = (String) token.getPrincipal();
        String password = new String((char[]) token.getCredentials());

        // 数据库密码
        String dbPassword = (String) info.getCredentials();

        // 验证密码
        return JBCryptUtil.checkpw(password, dbPassword);
    }
}
