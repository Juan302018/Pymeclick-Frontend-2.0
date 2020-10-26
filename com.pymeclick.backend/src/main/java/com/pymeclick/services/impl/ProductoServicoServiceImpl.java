package com.pymeclick.services.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pymeclick.model.ProductoServicio;
import com.pymeclick.repo.IProductoServicio;
import com.pymeclick.services.IProductoServicioService;

@Service
public class ProductoServicoServiceImpl implements IProductoServicioService{
    @Autowired
    private IProductoServicio repo;
	
	
	@Override
	public ProductoServicio registrar(ProductoServicio obj) {
		
		return repo.save(obj);
	}

	@Override
	public ProductoServicio modificar(ProductoServicio obj) {
		return repo.save(obj);
	}

	@Override
	public List<ProductoServicio> listar() {
		return repo.findAll();
	}

	@Override
	public ProductoServicio leerPorId(Integer id) {
		Optional<ProductoServicio> op = repo.findById(id);
		return op.isPresent()?op.get(): new ProductoServicio();
	}

	@Override
	public boolean eliminar(Integer id) {
		repo.deleteById(id);
		return true;
	}

}
