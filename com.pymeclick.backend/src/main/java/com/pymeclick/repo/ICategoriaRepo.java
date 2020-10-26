package com.pymeclick.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pymeclick.model.Categoria;


public interface ICategoriaRepo extends JpaRepository<Categoria, Integer>{

}
