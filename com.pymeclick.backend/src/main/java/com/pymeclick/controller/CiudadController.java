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
import com.pymeclick.model.Ciudad;
import com.pymeclick.services.ICiudadService;

@RestController
@RequestMapping("/ciudad")
public class CiudadController {

	@Autowired
	private ICiudadService service;

	@GetMapping
	public ResponseEntity<List<Ciudad>> listar() {
		List<Ciudad> lista = service.listar();
		return new ResponseEntity<List<Ciudad>>(lista, HttpStatus.OK);
	}

	@GetMapping("/{id}")
	public ResponseEntity<Ciudad> leerPorId(@PathVariable("id") Integer id) {
		Ciudad objCiud = service.leerPorId(id);
		if (objCiud.getId_ciudad() == null) {
			throw new ModelNotFoundException("ID NO ENCONTRAD" + id);
		}
		return new ResponseEntity<Ciudad>(objCiud, HttpStatus.OK);
	}

	@PostMapping
	public ResponseEntity<Object> registrar(@Valid @RequestBody Ciudad ciudad) {
		Ciudad objCiud = service.registrar(ciudad);
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
				.buildAndExpand(ciudad.getId_ciudad()).toUri();
		return ResponseEntity.created(location).build();
	}

	@PutMapping
	public ResponseEntity<Ciudad> modificar(@Valid @RequestBody Ciudad ciudad) {
		Ciudad objCiud = service.modificar(ciudad);
		return new ResponseEntity<Ciudad>(objCiud, HttpStatus.OK);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Object> eliminar(@PathVariable("id") Integer id) {
		Ciudad objCiud = service.leerPorId(id);
		if (objCiud.getId_ciudad() == null) {
			throw new ModelNotFoundException("ID NO ENCONTRADO" + id);
		}
		service.eliminar(id);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
}
