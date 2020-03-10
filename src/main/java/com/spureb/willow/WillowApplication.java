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
     * 前端主页入口
     * @return
     */
    @GetMapping(value = "/test/show")
    public ModelAndView testShow() {
        ModelAndView view = new ModelAndView();
        view.setViewName("home/testShow");
        return view;
    }
    /**
     * 前端主页入口
     * @return
     */
    @GetMapping(value = "/hint/show")
    public ModelAndView hintShow() {
        ModelAndView view = new ModelAndView();
        view.setViewName("home/hintShow");
        return view;
    }
}
