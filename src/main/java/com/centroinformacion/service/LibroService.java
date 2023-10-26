package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Libro;

public interface LibroService {
	public abstract Libro insertaActualizaLibro(Libro obj);
	public abstract Libro insertaRegistraLibro(Libro obj);
	public abstract List<Libro> listaPorTitulo(String titulo);
	public abstract List<Libro> listaPorTituloLike(String filtro);
	public abstract boolean existeLibroConSerie(String serie);
	public abstract Optional<Libro>buscaLibro(int idLibro);
}
