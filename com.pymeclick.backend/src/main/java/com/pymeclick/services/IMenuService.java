package com.pymeclick.services;

import java.util.List;

import com.pymeclick.model.Menu;

public interface IMenuService extends ICRUD<Menu>{
	
	List<Menu> listarMenuPorUsuario(String username);

}
