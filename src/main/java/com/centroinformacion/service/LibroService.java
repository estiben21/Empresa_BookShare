package com.centroinformacion.service;

import java.util.List;

import com.centroinformacion.entity.Libro;

public interface LibroService {
	public abstract Libro insertaActualizaLibro(Libro obj);
	public abstract boolean existeLibroConSerie(String serie);
	public abstract List<Libro> listaPorTituloLike(String filtro);
}
