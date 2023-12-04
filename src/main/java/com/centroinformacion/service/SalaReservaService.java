package com.centroinformacion.service;

import java.util.List;

import com.centroinformacion.entity.ReservaSala;

public interface SalaReservaService {
	
	public abstract ReservaSala registraSalaReservado(ReservaSala obj);
	
	public abstract List<ReservaSala> listaReservaSala();
}
