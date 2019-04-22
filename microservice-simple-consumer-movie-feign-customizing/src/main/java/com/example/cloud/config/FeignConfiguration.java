package com.example.cloud.config;

import org.springframework.context.annotation.Bean;

import feign.Contract;

/**
 * 该类为Feign的配置类
 * 注意：该类可以不写@Configuration注解，如果加了@Configuration注解，
 * 那么该类不能放在主应用程序上下文@ComponentScan所扫描的包中。
 * @author yunfa
 *
 */
public class FeignConfiguration {
	/**
	 * 将契约改为feign原生的默认契约，这样就可以使用feign自带的注解了。
	 * @return 默认的feign契约
	 */
	@Bean
	public Contract feignContract() {
		return new feign.Contract.Default();
	}
}
