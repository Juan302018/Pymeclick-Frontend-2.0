package com.pymeclick.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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

	public Integer getId_calificacion() {
		return id_calificacion;
	}

	public void setId_calificacion(Integer id_calificacion) {
		this.id_calificacion = id_calificacion;
	}

	public Double getPuntaje() {
		return puntaje;
	}

	public void setPuntaje(Double puntaje) {
		this.puntaje = puntaje;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

}
