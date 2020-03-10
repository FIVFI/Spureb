package com.spureb.willow.controller;

import com.spureb.willow.base.BaseUserInfo;
import com.spureb.willow.entity.NoteResourceVo;
import com.spureb.willow.entity.UserVo;
import com.spureb.willow.service.NoteResourceService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RestController
public class SysBaseViewController {
    @Autowired
    NoteResourceService noteResourceService;

    @GetMapping (value = "/login")
    public ModelAndView goToLoginView(){
        UserVo userVo = new UserVo();
        ModelAndView view = new ModelAndView();
        try{
             userVo = BaseUserInfo.getCurrentUser();
        }catch (Exception e){ userVo = null; }
        if(userVo==null){
            view.setViewName("/login");
        }else{
            view.setViewName("redirect:/"); }
        return view;
    }

    @PostMapping(value = "/login")
    public ModelAndView login(HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        view.setViewName("/login");
        // 登录失败从request中获取shiro错误信息
        String exception = (String) request.getAttribute("shiroLoginFailure");
        if (exception != null) {
            if (UnknownAccountException.class.getName().equals(exception)) {
                view.addObject("msg", "账号不正确！");
            } else if (IncorrectCredentialsException.class.getName().equals(exception)) {
                view.addObject("msg", "密码不正确！");
            } else if (LockedAccountException.class.getName().equals(exception)) {
                view.addObject("msg", "账号不可用！");
            } else if (AccountException.class.getName().equals(exception)) {
                view.addObject("msg", "发现多个重复账号！");
            } else {
                view.addObject("msg", "其他错误：" + exception);
            }
        }
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            view.setViewName("redirect:/");
        }
        return view;
    }
    /**
     * 前端主页入口
     * @return
     */
    @GetMapping(value = "/")
    public ModelAndView loginVerify() {
        ModelAndView view = new ModelAndView();
        UserVo userVo = BaseUserInfo.getCurrentUser();
        NoteResourceVo noteResourceVo = new NoteResourceVo();
        noteResourceVo.setByAuthor(userVo.getUserId());
        view.addObject("noteResourceList", noteResourceService.getNotePadMyNoteList(noteResourceVo).getData());
        view.addObject("user", userVo);
        view.setViewName("home/home");
        return view;
    }
    /**
     * 退出登录
     * @return
     */

    @GetMapping(value = "/logout")
    public ModelAndView logout() {
        System.out.println("退出登录");
        SecurityUtils.getSubject().logout();
        ModelAndView view = new ModelAndView();
        view.setViewName("redirect:/login");
        return view;
    }
}
