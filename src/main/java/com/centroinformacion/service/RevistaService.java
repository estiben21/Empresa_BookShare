package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Revista;

public interface RevistaService {
	
	public abstract Revista actualizaRevista(Revista obj);
	public abstract Revista insertaRevista(Revista obj);
	public abstract List<Revista> ListaPorNombre(String nombre);
	public abstract Optional<Revista>buscaRevista(int idRevista);
	public abstract List<Revista> ListaPorNombreOrFrecuencia(String nombre,String frecuencia);
	public abstract List<Revista> listaPorNombreFrecuenciaLike(String filtro);
	
}
