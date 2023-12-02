	package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.entity.LibroHasAutor;
import com.centroinformacion.entity.LibroHasAutorPK;


public interface LibroService {
	public abstract Libro insertaActualizaLibro(Libro obj);
	public abstract Libro insertaRegistraLibro(Libro obj);
	public abstract List<Libro> listaPorTitulo(String titulo);
	public abstract List<Libro> listaPorTituloLike(String filtro);
	public abstract boolean existeLibroConSerie(String serie);
	public abstract Optional<Libro>buscaLibro(int idLibro);
	
	//consultas
	
	public abstract List<Libro> listaConsultaLibro(int estado, int idCategoria, int idTipo, String titulo, String serie, int anio);
//PC4
	//sem 14
	public abstract List<Libro> listaLibro();
	
		public abstract LibroHasAutor insertaAutor(LibroHasAutor obj);
		public abstract void eliminaAutor(LibroHasAutor obj);
		public abstract Optional<LibroHasAutor> buscaAutor(LibroHasAutorPK obj);
		public abstract List<Autor> traerAutorDeLibro(int idLibro);
}
