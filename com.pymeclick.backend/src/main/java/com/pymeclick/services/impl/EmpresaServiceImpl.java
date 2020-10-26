package com.pymeclick.services.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pymeclick.model.Empresa;
import com.pymeclick.repo.IEmpresaRepo;
import com.pymeclick.services.IEmpresaService;

@Service
public class EmpresaServiceImpl implements IEmpresaService{
    @Autowired
    private IEmpresaRepo repo;
	@Override
	public Empresa registrar(Empresa obj) {
		
		return repo.save(obj);
	}

	@Override
	public Empresa modificar(Empresa obj) {
		return repo.save(obj);
	}

	@Override
	public List<Empresa> listar() {
		return repo.findAll();
	}

	@Override
	public Empresa leerPorId(Integer id) {
		Optional<Empresa>op = repo.findById(id);
		return op.isPresent()?op.get(): new Empresa();
	}

	@Override
	public boolean eliminar(Integer id) {
	repo.deleteById(id);
		return true;
	}
	
	

}
