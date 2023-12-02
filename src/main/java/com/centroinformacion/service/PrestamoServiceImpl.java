package com.centroinformacion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.centroinformacion.entity.Prestamo;
import com.centroinformacion.repository.PrestamoRepository;

@Service
public class PrestamoServiceImpl implements PrestamoService{

	@Autowired
	private PrestamoRepository prestamoRepository;
	
	@Override
	@Transactional
	public Prestamo insertaPrestamo(Prestamo obj) {
		Prestamo objCabecera = prestamoRepository.save(obj);
	    return objCabecera;
	}

}
