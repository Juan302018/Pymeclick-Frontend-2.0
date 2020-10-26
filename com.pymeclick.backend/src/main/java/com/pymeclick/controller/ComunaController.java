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
import com.pymeclick.model.Comuna;
import com.pymeclick.services.IComunaService;

@RestController
@RequestMapping("/comuna")
public class ComunaController {
	
	@Autowired
	private IComunaService service;
	
	@GetMapping
	public ResponseEntity<List<Comuna>> listar() {
		List<Comuna> lista = service.listar();
		return new ResponseEntity<List<Comuna>>(lista, HttpStatus.OK);
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Comuna> leerPorId(@PathVariable("id") Integer id) {
		Comuna objComun = service.leerPorId(id);
		if(objComun.getId_comuna()== null) {
			throw new ModelNotFoundException("ID NO ENCONTRADO"+ id);
		}
		return new ResponseEntity<Comuna>(objComun, HttpStatus.OK);
	}
	
	@PostMapping
	public ResponseEntity<Object> registrar(@Valid @RequestBody Comuna comuna) {
		Comuna objComun = service.registrar(comuna);
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(comuna.getId_comuna()).toUri();
		return ResponseEntity.created(location).build();
	}
	
	@PutMapping
	public ResponseEntity<Comuna> modificar(@Valid @RequestBody Comuna comuna) {
		Comuna objComun = service.modificar(comuna);
		return new ResponseEntity<Comuna>(objComun, HttpStatus.OK);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Object> eliminar(@PathVariable("id") Integer id){
		Comuna objComun = service.leerPorId(id);
		if(objComun.getId_comuna()== null) {
			throw new ModelNotFoundException("ID NO ENCONTRADO" + id);
		}
		service.eliminar(id);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
}
