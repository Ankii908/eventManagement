package com.management.eventManagement.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.management.eventManagement.entity.Role;
import com.management.eventManagement.entity.User;
import com.management.eventManagement.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository repository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public User saveUser(User user) {
    	
    	if (repository.existsByUsername(user.getUsername())) {
    		 user.setUsername(null);
    	}else if (repository.existsByEmail(user.getEmail())) {
    		user.setEmail(null);
    	}else {
    		user.setPassword(passwordEncoder.encode(user.getPassword()));
            user.setRole(Role.USER);
            return repository.save(user);
    	}

        return user;
    }

}
