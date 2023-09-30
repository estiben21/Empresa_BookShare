package com.centroinformacion.service;

import java.util.List;

import com.centroinformacion.entity.Autor;

public interface AutorService {
	
	public abstract List<Autor> listaTodos();
	public abstract List<Autor> listaPorTelefono(String telefono);
	public abstract Autor insertaActualizaAutor(Autor obj);
}
