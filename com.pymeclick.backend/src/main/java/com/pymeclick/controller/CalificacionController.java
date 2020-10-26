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
import com.pymeclick.model.Calificacion;
import com.pymeclick.services.ICalificacionService;

@RestController
@RequestMapping("/calificacion")
public class CalificacionController {

	@Autowired
	private ICalificacionService service;
	
	@GetMapping
	public ResponseEntity<List<Calificacion>> listar() {
		List<Calificacion> lista = service.listar();
		return new ResponseEntity<List<Calificacion>>(lista, HttpStatus.OK);
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Calificacion> listarPorId(@PathVariable("id") Integer id){
		Calificacion objCalifi = service.leerPorId(id);
		if(objCalifi.getId_calificacion() == null) {
			throw new ModelNotFoundException("ID NO ENCONTRADO" + id);
		}
		return new ResponseEntity<Calificacion>(objCalifi, HttpStatus.OK);
	}
	
	@PostMapping
	public ResponseEntity<Object> registrar(@Valid @RequestBody Calificacion calificacion) {
		Calificacion objCalifi = service.registrar(calificacion);
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(calificacion.getId_calificacion()).toUri();
		return ResponseEntity.created(location).build();
	}
	
	@PutMapping
	public ResponseEntity<Calificacion> modificar(@Valid @RequestBody Calificacion calificacion) {
		Calificacion objCalifi = service.modificar(calificacion);
		return new ResponseEntity<Calificacion>(objCalifi, HttpStatus.OK);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Object> eliminar(@PathVariable("id") Integer id){
		Calificacion objCalifi = service.leerPorId(id);
		if(objCalifi.getId_calificacion()== null) {
			throw new ModelNotFoundException("ID NO ENCONTRADO" + id);
		}
		service.eliminar(id);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
}
