	package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Pageable;

import com.centroinformacion.entity.Libro;

public interface LibroService {
	public abstract Libro insertaActualizaLibro(Libro obj);
	public abstract Libro insertaRegistraLibro(Libro obj);
	public abstract List<Libro> listaPorTitulo(String titulo);
	public abstract List<Libro> listaPorTituloLike(String filtro);
	public abstract boolean existeLibroConSerie(String serie);
	public abstract Optional<Libro>buscaLibro(int idLibro);
	
	//consultas
	
	public abstract List<Libro> listaConsultaLibro(int estado, int idCategoria, int idTipo, String titulo, String serie, int anio);

	public abstract List<Libro> listaLibro(String filtro, Pageable pageable);

}
