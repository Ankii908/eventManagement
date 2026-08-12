package com.management.eventManagement.security;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication)
            throws IOException, ServletException {

        Collection<? extends GrantedAuthority> authorities =
                authentication.getAuthorities();

        for (GrantedAuthority authority : authorities) {

            if (authority.getAuthority().equals("ADMIN")) {

                response.sendRedirect(request.getContextPath()
                        + "/admin/dashboard");

                return;
            }

            if (authority.getAuthority().equals("USER")) {

                response.sendRedirect(request.getContextPath()
                        + "/userdashboard");

                return;
            }

            // If you use ROLE_ADMIN / ROLE_USER instead
            if (authority.getAuthority().equals("ROLE_ADMIN")) {

                response.sendRedirect(request.getContextPath()
                        + "/admin/dashboard");

                return;
            }

            if (authority.getAuthority().equals("ROLE_USER")) {

                response.sendRedirect(request.getContextPath()
                        + "/userdashboard");

                return;
            }
        }

        response.sendRedirect(request.getContextPath() + "/login");
    }
}