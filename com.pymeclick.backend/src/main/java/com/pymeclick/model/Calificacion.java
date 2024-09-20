package com.pymeclick.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "calificacion")
public class Calificacion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_calificacion;

	@Column(name = "puntaje", nullable = false)
	private Double puntaje;

	@Column(name = "imagen", nullable = true)
	private String imagen;

	@Column(name = "comentario", nullable = true, length = 50)
	private String comentario;

}
