package com.example.cloud.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.netflix.ribbon.RibbonClients;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.example.cloud.ExcludeFromComponentScan;
import com.netflix.client.config.IClientConfig;
import com.netflix.loadbalancer.BestAvailableRule;
import com.netflix.loadbalancer.ConfigurationBasedServerList;
import com.netflix.loadbalancer.IPing;
import com.netflix.loadbalancer.IRule;
import com.netflix.loadbalancer.PingUrl;
import com.netflix.loadbalancer.Server;
import com.netflix.loadbalancer.ServerList;
import com.netflix.loadbalancer.ServerListSubsetFilter;

@ExcludeFromComponentScan
@RibbonClients(defaultConfiguration = DefaultRibbonConfig.class)
public class RibbonClientDefaultConfigurationTestsConfig {
	public static class BazServiceList extends ConfigurationBasedServerList {
		public BazServiceList(IClientConfig config) {
			super.initWithNiwsConfig(config);
		}
	}
}

@Configuration
@ExcludeFromComponentScan
class DefaultRibbonConfig {
	
	private static final Logger Logger = LoggerFactory.getLogger(DefaultRibbonConfig.class);
	@Autowired
	IClientConfig config;
	
	@Bean
	public IRule ribbonRule() {
		Logger.info("just a test");
		return new BestAvailableRule();
	}
	@Bean
	public IPing ribbonPing() {
		return new PingUrl();
	}
	@Bean
	public ServerList<Server> ribbonServerList(IClientConfig config) {
		return new RibbonClientDefaultConfigurationTestsConfig.BazServiceList(config);
	}
	@Bean
	public ServerListSubsetFilter serverListFilter() {
		ServerListSubsetFilter filter = new ServerListSubsetFilter();
		return filter;
	}
}
