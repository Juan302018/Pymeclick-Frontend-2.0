package com.pymeclick.controller;

import java.net.URI;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import com.pymeclick.exception.ModelNotFoundException;
import com.pymeclick.model.ProductoServicio;
import com.pymeclick.services.IProductoServicioService;

@RestController
@RequestMapping("/productoservicio")
public class ProductoServicioController {

	@Autowired
	private IProductoServicioService service;
	
	@GetMapping
	public ResponseEntity<List<ProductoServicio>> listar() {
		List<ProductoServicio> lista = service.listar();
		return new ResponseEntity<List<ProductoServicio>>(lista, HttpStatus.OK);
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<ProductoServicio> leerPorId(@PathVariable("id") Integer id) {
		ProductoServicio objProductoSer = service.leerPorId(id);
		if(objProductoSer.getId_prod_serv()== null) {
			throw new ModelNotFoundException("ID NO ENCONTRADOs" + id);
		}
		return new ResponseEntity<ProductoServicio>(objProductoSer, HttpStatus.OK);
	}
	
	@PostMapping
	public ResponseEntity<Object> registrar(@Valid @RequestBody ProductoServicio productoservicio) {
		ProductoServicio objProductoSer = service.registrar(productoservicio);
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(productoservicio.getId_prod_serv()).toUri();
		return ResponseEntity.created(location).build();
	}
	
	@PutMapping
	public ResponseEntity<ProductoServicio> modificar(@Valid @RequestBody ProductoServicio productoservicio) {
		ProductoServicio objProductoSer = service.modificar(productoservicio);
		return new ResponseEntity<ProductoServicio>(objProductoSer, HttpStatus.OK);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Object> eliminar(@PathVariable("id") Integer id) {
		ProductoServicio objProductoSer = service.leerPorId(id);
		if(objProductoSer.getId_prod_serv()== null) {
			throw new ModelNotFoundException("ID NO ENCONTRADO" + id);
		}
		service.eliminar(id);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
}
