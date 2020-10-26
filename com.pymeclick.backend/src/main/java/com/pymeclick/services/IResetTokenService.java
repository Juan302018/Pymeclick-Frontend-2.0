package com.pymeclick.services;

import com.pymeclick.model.ResetToken;

public interface IResetTokenService {

    ResetToken findByToken(String token);
	
	void guardar(ResetToken token);
	
	void eliminar(ResetToken token);
}
