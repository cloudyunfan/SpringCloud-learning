package com.example.cloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.feign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class ConsumerMovieApplication {
	public static void main(String[] args){
		SpringApplication.run(ConsumerMovieApplication.class, args);
	}

}
