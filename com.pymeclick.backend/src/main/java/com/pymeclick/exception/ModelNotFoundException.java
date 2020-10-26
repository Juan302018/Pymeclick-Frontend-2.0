package com.pymeclick.exception;

public class ModelNotFoundException extends RuntimeException{
	
	public ModelNotFoundException(String mensaje) {
		super(mensaje);
	}
}
