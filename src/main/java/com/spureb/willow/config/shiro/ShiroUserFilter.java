package com.spureb.willow.config.shiro;

import com.spureb.willow.base.BaseErrorEnum;
import com.spureb.willow.base.BaseResponse;
import com.spureb.willow.utils.JSONUtil;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.util.StringUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class ShiroUserFilter extends FormAuthenticationFilter {

    @Override
    protected void redirectToLogin(ServletRequest request, ServletResponse response) throws IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        // 判断接口请求时未登录状态返回json格式
        if (request.getContentType() != null && request.getContentType().indexOf("application/json") > -1) {
            response.setContentType("application/json; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            String json = JSONUtil.toJSONString(new BaseResponse<>(BaseErrorEnum.ERROR.getCode(),"请登录后尝试！"));
            System.out.println("json: " + json);
            response.getWriter().write(json);
        } else {
            super.redirectToLogin(request, response);
        }
    }

    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request, ServletResponse response) throws Exception {
        if (!StringUtils.isEmpty(getSuccessUrl())) {
            /** 解决登录成功没有跳转到 setSuccessUrl */
            Session session = subject.getSession(false);
            if (session != null) {
                session.removeAttribute("shiroSavedRequest");
            }
        }
        return super.onLoginSuccess(token, subject, request, response);
    }
}
