package com.pymeclick.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import lombok.Data;

@Data
@Entity
public class ResetToken {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(nullable = false, unique = true)
	private String token;
	
	@OneToOne(targetEntity = Usuario.class, fetch = FetchType.EAGER)
	@JoinColumn(nullable = false, name = "id_usuario")
	private Usuario user;
	
	@Column(nullable = false)
	private LocalDateTime expiracion;
	
	public void setExpiracion(int minutos) {
		LocalDateTime hoy = LocalDateTime.now();
		LocalDateTime exp = hoy.plusMinutes(minutos);
		this.expiracion = exp;
	}
	
	public boolean estaExpirado() {
		return LocalDateTime.now().isAfter(this.expiracion);
	}
}
