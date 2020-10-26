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
import com.pymeclick.model.Empresa;
import com.pymeclick.services.IEmpresaService;

@RestController
@RequestMapping("/empresa")
public class EmpresaController {

	@Autowired
	private IEmpresaService service;
	
	@GetMapping
	public ResponseEntity<List<Empresa>> listar() {
		List<Empresa> lista = service.listar();
		return new ResponseEntity<List<Empresa>>(lista, HttpStatus.OK);
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Empresa> leerPorId(@PathVariable("id") Integer id) {
		Empresa objEmp = service.leerPorId(id);
		if(objEmp.getId_empresa()== null) {
			throw new ModelNotFoundException("ID NO ENCONTRADO"+ id);
		}
		return new ResponseEntity<Empresa>(objEmp, HttpStatus.OK);
	}
	
	@PostMapping
	public ResponseEntity<Object> registrar(@Valid @RequestBody Empresa empresa) {
		Empresa objEmp = service.registrar(empresa);
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(empresa.getId_empresa()).toUri();
		return ResponseEntity.created(location).build();
	}
	
	@PutMapping
	public ResponseEntity<Empresa> modificar(@Valid @RequestBody Empresa empresa) {
		Empresa objEmp = service.modificar(empresa);
		return new ResponseEntity<Empresa>(objEmp, HttpStatus.OK);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Object> eliminar(@PathVariable("id") Integer id) {
		Empresa objEmp = service.leerPorId(id);
		if(objEmp.getId_empresa()== null) {
			throw new ModelNotFoundException("ID NO ENCONTRADO" + id);
		}
		service.eliminar(id);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
}
