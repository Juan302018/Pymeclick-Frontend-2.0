package com.pymeclick.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pymeclick.model.Usuario;

public interface IUsuarioRepo extends JpaRepository<Usuario, Integer>{
	
	Usuario findOneByUsername(String username);

}
