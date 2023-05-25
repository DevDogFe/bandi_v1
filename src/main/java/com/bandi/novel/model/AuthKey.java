package com.bandi.novel.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthKey {
	
	private String email;
	private String authKey;
	
	// TODO email 맵핑


}
