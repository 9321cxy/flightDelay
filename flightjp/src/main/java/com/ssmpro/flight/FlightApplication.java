package com.ssmpro.flight;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;

@SpringBootApplication
public class FlightApplication {

    public static void main(String[] args) {
        SpringApplication.run(FlightApplication.class, args);

    }

}
