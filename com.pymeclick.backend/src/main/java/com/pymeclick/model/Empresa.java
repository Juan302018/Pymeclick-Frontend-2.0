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

	public Integer getId_empresa() {
		return id_empresa;
	}

	public void setId_empresa(Integer id_empresa) {
		this.id_empresa = id_empresa;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Ciudad getCiudad() {
		return ciudad;
	}

	public void setCiudad(Ciudad ciudad) {
		this.ciudad = ciudad;
	}

	

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Comuna getComuna() {
		return comuna;
	}

	public void setComuna(Comuna comuna) {
		this.comuna = comuna;
	}

	public Calificacion getCalificacion() {
		return calificacion;
	}

	public void setCalificacion(Calificacion calificacion) {
		this.calificacion = calificacion;
	}

}
