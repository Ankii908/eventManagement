package com.management.eventManagement;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptGenerator {

	public static void main(String[] args) {

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        String password = "admin@123";

        String encryptedPassword = encoder.encode(password);

        System.out.println("Original Password : " + password);
        System.out.println("BCrypt Password   : " + encryptedPassword);
        

    }
}
