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
import com.pymeclick.model.Categoria;
import com.pymeclick.services.ICategoriaService;

@RestController
@RequestMapping("/categoria")
public class CategoriaController {

	@Autowired
	private ICategoriaService service;
	
	@GetMapping
	public ResponseEntity<List<Categoria>> listar() {
		List<Categoria> lista = service.listar();
		return new ResponseEntity<List<Categoria>>(lista, HttpStatus.OK);
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Categoria> listarPorId(@PathVariable("id") Integer id) {
		Categoria objCatego = service.leerPorId(id);
		if(objCatego.getId_categoria()== null) {
			throw new ModelNotFoundException("ID NO ENCONTRADO" + id);
		}
		return new ResponseEntity<Categoria>(objCatego, HttpStatus.OK);
	}
	
	@PostMapping
	public ResponseEntity<Object> registrar(@Valid @RequestBody Categoria categoria) {
		Categoria objCatego = service.registrar(categoria);
		URI location = ServletUriComponentsBuilder.fromCurrentRequestUri().path("/{id}").buildAndExpand(categoria.getId_categoria()).toUri();
		return ResponseEntity.created(location).build();
	}
	
	@PutMapping
	public ResponseEntity<Categoria> modificar(@Valid @RequestBody Categoria categoria){
		Categoria objCatego = service.modificar(categoria);
		return new ResponseEntity<Categoria>(objCatego, HttpStatus.OK);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Object> eliminar(@PathVariable("id") Integer id) {
		Categoria objCatego = service.leerPorId(id);
		if(objCatego.getId_categoria()== null) {
			throw new ModelNotFoundException("ID NO ENCONTRADO" + id);
		}
		service.eliminar(id);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
}
