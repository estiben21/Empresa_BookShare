package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Sala;

public interface SalaService {
	public abstract Sala insertaActualizaSala(Sala obj);
	public abstract Sala insertaRegistraSala(Sala obj);
	
	
	public abstract List<Sala> listaPorNumero(String numero);
	public abstract List<Sala> listPorNumerolike(String filtro);
	
	
	public abstract Optional<Sala> buscarSala(int idSala);
	
	
	public abstract List<Sala> listaPorNumeroIgualRegistra(String numero);
	public abstract List<Sala> listaPorNumeroIgualActualiza(String numero);
}
