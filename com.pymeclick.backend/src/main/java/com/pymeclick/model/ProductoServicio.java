package com.pymeclick.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import lombok.Data;

@Data
@Entity
@Table(name = "producto_servicio")
public class ProductoServicio {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_prod_serv;

	@Column(name = "nombre_prod_serv", nullable = false, length = 70)
	private String nombre_prod_serv;

	@Column(name = "precio", nullable = false)
	private Double precio;

	@Column(name = "imagen", nullable = true)
	private String imagen;

	@Column(name = "descripcion_prod_serv", nullable = false, length = 150)
	private String descripcion_prod_serv;

	@ManyToOne
	@JoinColumn(name = "id_categoria", nullable = true, foreignKey = @ForeignKey(name = "FK_productoServicio_categoria"))
	private Categoria categoria;
	
	@ManyToOne
	@JoinColumn(name = "id_empresa", nullable = true, foreignKey = @ForeignKey(name = "FK_productoServicio_empresa"))
	private Empresa empresa;

}
