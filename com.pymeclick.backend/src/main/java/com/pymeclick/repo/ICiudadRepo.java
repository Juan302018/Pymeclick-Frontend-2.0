package com.pymeclick.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import com.pymeclick.model.Ciudad;

public interface ICiudadRepo extends JpaRepository<Ciudad, Integer>{

}
