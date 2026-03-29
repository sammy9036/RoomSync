package com.roomsync;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.roomsync.repository.RoleRepository;


@SpringBootApplication
public class RoomsyncApplication {
	
	@Autowired
	RoleRepository roleRepository;
	
	public static void main(String[] args) {
		SpringApplication.run(RoomsyncApplication.class, args);
	
		System.out.println(new BCryptPasswordEncoder().encode("Admin@123"));

	}

}
