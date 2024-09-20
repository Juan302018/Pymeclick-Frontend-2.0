package com.pymeclick.exception;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ExceptionResponse {

	private LocalDateTime timestamp;
	private String mensaje;
	private String detalle;
	
	
}
