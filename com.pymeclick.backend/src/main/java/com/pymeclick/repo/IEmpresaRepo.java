package com.pymeclick.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import com.pymeclick.model.Empresa;

public interface IEmpresaRepo extends JpaRepository<Empresa, Integer>{

}
