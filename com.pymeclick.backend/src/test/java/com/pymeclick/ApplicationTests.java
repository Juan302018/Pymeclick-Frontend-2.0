package com.pymeclick;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import com.pymeclick.model.Usuario;
import com.pymeclick.repo.IUsuarioRepo;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ApplicationTests {

	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Autowired
	private IUsuarioRepo repo;
	
	@Test
	public void crearUsuario() {
		Usuario us = new Usuario();
//		us.setId_usuario(1);
//		us.setUsername("jfernandez816@hotmail.com");
//		us.setPassword(bcrypt.encode("Jjfv8824"));
//		us.setEnabled(true);
		us.setId_usuario(2);
		us.setUsername("cmendez1705@hotmail.com");
		us.setPassword(bcrypt.encode("awkward5"));
		us.setEnabled(true);
		
		Usuario retorno = repo.save(us);
		
		assertTrue(retorno.getPassword().equalsIgnoreCase(us.getPassword()));
	}
}
