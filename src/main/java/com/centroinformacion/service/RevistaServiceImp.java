package com.centroinformacion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Revista;
import com.centroinformacion.repository.RevistaRepository;

@Service
public class RevistaServiceImp implements RevistaService{
	@Autowired	
	private RevistaRepository repository;

	@Override
	public Revista insertaActualizaRevista(Revista obj) {
		return repository.save(obj);
	}
	@Override
	public List<Revista> ListaPorNombre(String nombre) {
		return repository.findByNombreIgnoreCase(nombre);
	}
	@Override
	public List<Revista> listPorNombreLike(String filtro) {
		return repository.listPorNombreLike(filtro);
	}
	@Override
	public List<Revista> ListaPorNombreOrFrecuencia(String nombre, String frecuencia) {
		return repository.findByNombreOrFrecuenciaIgnoreCase(nombre,frecuencia);
	}
}
