package com.bandi.novel.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class CustomRestfulException extends RuntimeException {

	private HttpStatus status;
	
	public CustomRestfulException(String message, HttpStatus status) {
		super(message);
		this.status = status;
	}
	
}
