package com.pymeclick;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import com.fasterxml.jackson.databind.ObjectMapper;

public class AuthException implements AuthenticationEntryPoint {

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException authException) throws IOException, ServletException {
		final Map<String, Object> mapExceptio = new HashMap<>();
		mapExceptio.put("error", "401");
		mapExceptio.put("message", "No estas autorizado para acceder a este recurso");
		mapExceptio.put("Exception", "No autorizado");
		mapExceptio.put("Path", request.getServletPath());
		mapExceptio.put("TimeStamp", LocalDateTime.now());
		
		response.setContentType("aplication/json");
		response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		
		final ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getOutputStream(), mapExceptio);
	}

}
