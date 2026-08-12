package com.management.eventManagement.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

	@Entity
	@Table(name = "users")
	@Data
	public class User {

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    @Column(nullable = false)
	    private String username;

	    @Column(nullable = false, unique = true)
	    private String email;

	    @Column(nullable = false)
	    private String password;

	    @Enumerated(EnumType.STRING)
	    private Role role;

				 
}
