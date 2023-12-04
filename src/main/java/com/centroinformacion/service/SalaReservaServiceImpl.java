package com.centroinformacion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.ReservaSala;
import com.centroinformacion.repository.SalaReservaRepository;

@Service
public class SalaReservaServiceImpl implements SalaReservaService{

	@Autowired	
	private SalaReservaRepository repository;

	@Override
	public ReservaSala registraSalaReservado(ReservaSala obj) {
		return repository.save(obj);
	}

	@Override
	public List<ReservaSala> listaReservaSala() {
		return repository.findByOrderBySalaAsc();
	}

	
}
