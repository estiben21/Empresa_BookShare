package com.centroinformacion.service;

import java.util.List;

import com.centroinformacion.entity.Autor;

public interface AutorService {
	
	public abstract List<Autor> listaTodos();
	
	public abstract Autor insertaActualizaAutor(Autor obj);
}
