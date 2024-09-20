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

import lombok.Data;

@Data
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


}
