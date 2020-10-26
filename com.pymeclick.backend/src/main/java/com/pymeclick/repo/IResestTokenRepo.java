package com.pymeclick.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pymeclick.model.ResetToken;

public interface IResestTokenRepo extends JpaRepository<ResetToken, Integer> {

	ResetToken findByToken(String token);
}
