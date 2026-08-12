package com.management.eventManagement.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.management.eventManagement.security.CustomUserDetailsService;

@Configuration
public class SecurityConfig {

	@Autowired
	private LoginSuccessHandler loginSuccessHandler;
	
	@Autowired
	private CustomUserDetailsService userDetailsService;
	
	
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
		auth.setUserDetailsService(userDetailsService);
		auth.setPasswordEncoder(passwordEncoder());
		return auth;
	}

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception { 
    	http.authenticationProvider(authenticationProvider())
		.csrf().disable()
		.authorizeRequests()
		.antMatchers("/register", "/saveUser", "/css/**", "/js/**", "/test").permitAll()
		.antMatchers("/admin/**").hasAuthority("ADMIN")
		.antMatchers("/feedback","/saveFeedback").hasAuthority("USER")
		.anyRequest().authenticated()
		.and()
		.formLogin()
		.loginPage("/login")
		.loginProcessingUrl("/login")
		.successHandler(loginSuccessHandler)
		.permitAll()
		.and()
		.logout()
		.logoutSuccessUrl("/login?logout")
		.permitAll();

    return http.build();}
}


