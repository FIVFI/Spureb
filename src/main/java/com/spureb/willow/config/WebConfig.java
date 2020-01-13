package com.spureb.willow.config;

import org.beetl.core.resource.ClasspathResourceLoader;
import org.beetl.ext.spring.BeetlGroupUtilConfiguration;
import org.beetl.ext.spring.BeetlSpringViewResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

@Configuration
public class WebConfig extends WebMvcConfigurationSupport {

    @Override
    protected void addResourceHandlers(ResourceHandlerRegistry registry) {
        super.addResourceHandlers(registry);
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
    }

    @Bean
    public BeetlGroupUtilConfiguration beetlGroupUtilConfiguration() {
        BeetlGroupUtilConfiguration configuration = new BeetlGroupUtilConfiguration();
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        if (classLoader == null) {
            classLoader = WebConfig.class.getClassLoader();
        }

        ClasspathResourceLoader classpathResourceLoader = new ClasspathResourceLoader(classLoader, "templates");
        configuration.setResourceLoader(classpathResourceLoader);
        configuration.init();
        configuration.getGroupTemplate().setClassLoader(classLoader);
        return configuration;
    }

    @Bean
    public BeetlSpringViewResolver beetlSpringViewResolver(BeetlGroupUtilConfiguration beetlGroupUtilConfiguration) {
        BeetlSpringViewResolver resolver = new BeetlSpringViewResolver();
        resolver.setSuffix(".btl");
        resolver.setContentType("text/html;charset=utf-8");
        resolver.setOrder(0);
        resolver.setConfig(beetlGroupUtilConfiguration);
        return resolver;
    }
}
