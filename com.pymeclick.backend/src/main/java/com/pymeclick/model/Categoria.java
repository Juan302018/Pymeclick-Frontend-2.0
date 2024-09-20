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
@Table(name="categoria")
public class Categoria {
	
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_categoria;
	 
	 @Column(name = "nombre_categoria",nullable=false, length=70)
	  private String nombre_categoria;

	 

}
