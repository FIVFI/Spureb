package com.spureb.willow.config.shiro;

import com.spureb.willow.entity.UserMenuListVo;
import com.spureb.willow.entity.UserVo;
import com.spureb.willow.mapper.SysUserMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.util.List;

/**
 * 身份校验核心类
 */
public class MyShiroRealm extends AuthorizingRealm {

    private static Logger logger = LoggerFactory.getLogger(MyShiroRealm.class);

    @Resource
    SysUserMapper sysUserMapper;

    /**
     * 授权
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        logger.info("授权");

//        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
//        List<ResourceVo> sysResources =  BaseUserInfo.queryCurrentUserResources();
//        for (ResourceVo resourceVo : sysResources) {
//            if (resourceVo.getResourceId() != null && !sysResource.getCode().equals("")) {
//                authorizationInfo.addStringPermission(sysResource.getCode());
//            }
//        }
        return null;
    }

    /**
     * 身份验证
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        logger.info("身份验证");

        // 获取用户的账号、密码
        String account = (String) authenticationToken.getPrincipal();
        String password = new String((char[]) authenticationToken.getCredentials());

        // 通过账号或手机号码登录
        UserVo userVo = new UserVo();
        UserMenuListVo resourceVo = new UserMenuListVo();
        userVo.setUserAccount(account);
        resourceVo.setUserAccount(account);
        UserVo loginBackDTO = sysUserMapper.queryUserByVo(userVo);

        if (loginBackDTO == null) {
            throw new UnknownAccountException("此用户不存在！");
        }
        List<UserMenuListVo> sysResources = sysUserMapper.listSysResourcesByVo(resourceVo);
        SecurityUtils.getSubject().getSession().setAttribute("currUserResources", sysResources);
        SecurityUtils.getSubject().getSession().setTimeout(31536000L);

        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(loginBackDTO, loginBackDTO.getUserPassword(), getName());
        return authenticationInfo;
    }
}
