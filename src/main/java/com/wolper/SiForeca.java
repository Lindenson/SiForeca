package com.wolper;

import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class SiForeca {
	public static void main(String[] args) {
		SpringApplication application = new SpringApplication(SiForeca.class);
		application.setBannerMode(Banner.Mode.OFF);
		application.run(args);
	}
}
