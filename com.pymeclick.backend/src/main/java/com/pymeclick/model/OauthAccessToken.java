package com.pymeclick.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "oauth_access_token")
public class OauthAccessToken {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "token_id", nullable = false, length = 256)
	private String token_id;
	
	@Column(name = "token", nullable = false)
	private byte[] token;
	
	@Column(name = "authentication", nullable = false)
	private byte[] authentication;
	
	@Column(name = "authentication_id", nullable = false, length = 256)
	private String authentication_id;
	
	@Column(name = "user_name", nullable = false, length = 256)
	private String user_name;
	
	@Column(name = "client_id", nullable = false, length = 256)
	private String client_id;
	
	@Column(name = "refresh_token", nullable = true, length = 256)
	private String refresh_token;

}
