package com.centroinformacion.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Revista;
import com.centroinformacion.repository.RevistaRepository;

@Service
public class RevistaServiceImp implements RevistaService{
	@Autowired	
	private RevistaRepository repository;

	@Override
	public Revista insertaRevista(Revista obj) {
		return repository.save(obj);
	}
	@Override
	public List<Revista> ListaPorNombre(String nombre) {
		return repository.findByNombreIgnoreCase(nombre);
	}
	@Override
	public List<Revista> listaPorNombreFrecuenciaLike(String filtro) {
		return repository.listaPorNombreFrecuenciaLike(filtro);
	}
	@Override
	public List<Revista> ListaPorNombreOrFrecuencia(String nombre, String frecuencia) {
		return repository.findByNombreOrFrecuenciaIgnoreCase(nombre,frecuencia);
	}
	@Override
	public Optional<Revista> buscaRevista(int idRevista) {
		return repository.findById(idRevista);
	}
	@Override
	public Revista actualizaRevista(Revista obj) {
		return repository.save(obj);
	}
	@Override
	public List<Revista> listaConsultaRevista(int estado, int idPais, int idDataCatalogo, String nombre,
			String frecuencia,
			 Date fecDesde, Date fecHasta) {
		return repository.listaConsultaRevista(estado, idPais,idDataCatalogo,nombre,frecuencia, fecDesde, fecHasta);
	}
}
