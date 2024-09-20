package com.pymeclick.model;

import java.sql.Blob;
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
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
@Entity
@Table(name = "empresa")
public class Empresa {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id_empresa;

	@Size(min = 3, max = 70, message = "El Nombre debe tener como minímo 3 caracteres")
	@Column(name = "nombre", nullable = false, length = 70)
	private String nombre;

	@Size(min = 3, max = 150, message = "La Dirección debe tener como minímo 3 caracteres")
	@Column(name = "direccion", nullable = false, length = 150)
	private String direccion;

	@Size(min = 3, max = 150, message = "La Descripción debe tener como minímo 3 caracteres")
	@Column(name = "descripcion", nullable = false, length = 150)
	private String descripcion;

	@Size(min = 3, max = 12, message = "El Teléfono debe tener como minímo 3 caracteres")
	@Column(name = "telefono", nullable = false, length = 12)
	private String telefono;

	@Column(name = "logo", nullable = true)
	private String logo;

	@Email
	@Column(name = "email", nullable = true, length = 100)
	private String email;

	@ManyToOne
	@JoinColumn(name = "id_comuna", nullable = true, foreignKey = @ForeignKey(name = "FK_empresa_comuna"))
	private Comuna comuna;

	@ManyToOne
	@JoinColumn(name = "id_calificacion", nullable = true, foreignKey = @ForeignKey(name = "FK_empresa_calificacion"))
	private Calificacion calificacion;

	@ManyToOne
	@JoinColumn(name = "id_ciudad", nullable = true, foreignKey = @ForeignKey(name = "FK_empresa_ciudad"))
	private Ciudad ciudad;
	
	@ManyToOne
	@JoinColumn(name = "id_categoria", nullable = true, foreignKey = @ForeignKey(name = "FK_categoria"))
	private Categoria categoria;
}
