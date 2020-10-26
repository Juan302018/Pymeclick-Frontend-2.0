package com.pymeclick.services.impl;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pymeclick.model.Ciudad;
import com.pymeclick.repo.ICiudadRepo;
import com.pymeclick.services.ICiudadService;

@Service
public class CiudadServiceImpl implements ICiudadService {

	@Autowired
	private ICiudadRepo repo;
	
	@Override
	public Ciudad registrar(Ciudad obj) {
		
		return repo.save(obj);
	}

	@Override
	public Ciudad modificar(Ciudad obj) {
		
		return repo.save(obj);
	}

	@Override
	public List<Ciudad> listar() {
		
		return repo.findAll();
	}

	@Override
	public Ciudad leerPorId(Integer id) {
		Optional<Ciudad> op = repo.findById(id);
		return op.isPresent()? op.get():new Ciudad();
	}

	@Override
	public boolean eliminar(Integer id) {
		repo.deleteById(id);
		return true;
	}

	
}
