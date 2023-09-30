package com.centroinformacion.service;

import java.util.List;

import com.centroinformacion.entity.Revista;

public interface RevistaService {
	
	public abstract Revista insertaActualizaRevista(Revista obj);
	public abstract List<Revista> ListaPorNombre(String nombre);
	
	public abstract List<Revista> ListaPorNombreOrFrecuencia(String nombre,String frecuencia);
	public abstract List<Revista> listPorNombreLike(String filtro);
	
}
