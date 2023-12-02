package com.centroinformacion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Devolucion;
import com.centroinformacion.repository.DevolucionRepository;

@Service
public class DevolucionServiceImp implements DevolucionService{
	
	@Autowired
	private DevolucionRepository repository;

	@Override
	public Devolucion insertaBoleta(Devolucion obj) {
		return repository.save(obj);
	}
}
