package com.spureb.willow;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@MapperScan({"com.spureb.willow.mapper"})
@SpringBootApplication
@EnableScheduling
public class WillowApplication {

    public static void main(String[] args) {
        SpringApplication.run(WillowApplication.class, args);
        System.out.println("http://127.0.0.1:8080/");
    }

    /**
     * 前端入口
     * @return
     */
    @GetMapping(value = "/")
    public ModelAndView login() {
        ModelAndView view = new ModelAndView();
        view.addObject("name", "xiaoming");
        view.setViewName("home/login");
        return view;
    }
    /**
     * 前端主页入口
     * @return
     */
    @GetMapping(value = "/login/verify")
    public ModelAndView loginVerify() {
        ModelAndView view = new ModelAndView();
        view.addObject("name", "xiaoming");
        view.setViewName("index");
        return view;
    }
}
