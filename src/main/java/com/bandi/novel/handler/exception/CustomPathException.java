package com.bandi.novel.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class CustomPathException extends RuntimeException {

	private HttpStatus status;
	private String path;
	
	public CustomPathException(String message, HttpStatus status, String path) {
		super(message);
		this.status = status;
		this.path = path;
	}
	
}
