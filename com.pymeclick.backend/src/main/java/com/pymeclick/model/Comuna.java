package com.pymeclick.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "comuna")
public class Comuna {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_comuna;

	@Column(name = "nombre_comuna", nullable = false, length = 70)
	private String nombre_comuna;
	
	@ManyToOne
	@JoinColumn(name = "id_ciudad", nullable = true, foreignKey = @ForeignKey(name = "FK_ciudad"))
	private Ciudad ciudad;

	public Integer getId_comuna() {
		return id_comuna;
	}

	public void setId_comuna(Integer id_comuna) {
		this.id_comuna = id_comuna;
	}

	public String getNombre_comuna() {
		return nombre_comuna;
	}

	public void setNombre_comuna(String nombre_comuna) {
		this.nombre_comuna = nombre_comuna;
	}

}
