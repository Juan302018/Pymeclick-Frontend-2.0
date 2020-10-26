package com.pymeclick.services.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pymeclick.model.Calificacion;
import com.pymeclick.repo.ICalificacionRepo;
import com.pymeclick.services.ICalificacionService;

@Service
public class CalificacionServiceImpl implements ICalificacionService{
     @Autowired
     private ICalificacionRepo repo;
	
	@Override
	public Calificacion registrar(Calificacion obj) {
		return repo.save(obj);
	}

	@Override
	public Calificacion modificar(Calificacion obj) {
		return repo.save(obj);
	}

	@Override
	public List<Calificacion> listar() {
		return repo.findAll();
	}

	@Override
	public Calificacion leerPorId(Integer id) {
		Optional<Calificacion>op = repo.findById(id);
		return op.isPresent()?op.get(): new Calificacion();
	}

	@Override
	public boolean eliminar(Integer id) {
		repo.deleteById(id);
		return true;
	}

}
