//package com.example.ASM.configuration;
//
//
//import com.example.ASM.entity.user;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.CommandLineRunner;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import com.example.ASM.service.userService;
//@Configuration
//public class SecurityConfiguration {
//    @Autowired
//    userService service;
//    @Bean
//    public CommandLineRunner commandLineRunner() {
//        return args -> {
//            user u = new user();
//            u.setUsername("adminbooklist");
//            u.setPassword("thuan123");
//            u.setAdmin(true);
//            service.insert(u);
//        };
//
//    }
//}
