package com.spureb.willow.config.shiro;

import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;
import java.util.HashMap;
import java.util.Map;

/**
 * shiro配置
 * 通过URL规则来进行过滤和权限校验
 */
@Configuration
public class ShiroConfig {

    /**
     * 安全管理器
     * @return
     */
    @Bean
    public SecurityManager securityManager() {
        DefaultWebSecurityManager defaultWebSecurityManager = new DefaultWebSecurityManager();
        // 设置身份验证
        defaultWebSecurityManager.setRealm(shiroRealm());
        // 缓存管理
        defaultWebSecurityManager.setCacheManager(ehCacheManager());
        return defaultWebSecurityManager;
    }

    /**
     * 资源拦截
     * @param securityManager
     * @return
     */
    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager) {
        ShiroFilterFactoryBean factoryBean = new ShiroFilterFactoryBean();

        // 必须设置SecurityManager
        factoryBean.setSecurityManager(securityManager);

        Map<String, Filter> filterMap = factoryBean.getFilters();
        filterMap.put("authc", new ShiroUserFilter());

        // 拦截器
        Map<String, String> filterChainDefinitionMap = new HashMap<>();

        // 配置退出过滤器
        filterChainDefinitionMap.put("/logout", "logout");
        filterChainDefinitionMap.put("/static/**", "anon");
        filterChainDefinitionMap.put("/share/**", "anon");
        filterChainDefinitionMap.put("/favicon.ico", "anon");
        // 过滤定义 从上向下顺序执行
        // authc: 所有URL都通过验证才可以通过 ，anon:所有URL都可以匿名访问
        filterChainDefinitionMap.put("/**", "authc");

        // 登录路径
        factoryBean.setLoginUrl("/login");
        factoryBean.setSuccessUrl("/");
        factoryBean.setUnauthorizedUrl("/403");
        factoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);

        return factoryBean;
    }

    /** 身份校验 */
    @Bean
    public MyShiroRealm shiroRealm() {
        MyShiroRealm myShiroRealm = new MyShiroRealm();
        myShiroRealm.setCredentialsMatcher(myHashedCredentialsMatcher());
        return myShiroRealm;
    }

    /** 密码验证器 */
    @Bean
    public MyHashedCredentialsMatcher myHashedCredentialsMatcher() {
        MyHashedCredentialsMatcher myHashedCredentialsMatcher = new MyHashedCredentialsMatcher();
        return myHashedCredentialsMatcher;
    }

    /** 开启shiro aop注解支持 */
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }

    /** 实现spring自动代理，解决权限不生效 */
    @Bean
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        defaultAdvisorAutoProxyCreator.setProxyTargetClass(true);
        return defaultAdvisorAutoProxyCreator;
    }

    /** shiro缓存管理器 */
    @Bean
    public EhCacheManager ehCacheManager() {
        EhCacheManager ehCacheManager = new EhCacheManager();
        ehCacheManager.setCacheManagerConfigFile("classpath:ehcache-shiro.xml");
        return ehCacheManager;
    }
}
