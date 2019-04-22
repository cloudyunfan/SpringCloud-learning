package com.example.cloud.controller;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.cloud.config.FeignConfiguration;
import com.example.cloud.entity.User;

import feign.Param;
import feign.RequestLine;

/**
 * 使用@FeignClient的configuration属性，指定feign的配置类
 * @author yunfa
 *
 */
@FeignClient(name = "microservice-simple-provider-user", configuration = FeignConfiguration.class)
public interface UserFeignClient {
	/**
	 * 使用feign自带的注解@RequestLine
	 * @see https://github.com/OpenFeign/feign
	 * @param id
	 * @return
	 */
	@RequestLine("GET /{id}")
	User findById(@Param("id") Long id);
}
