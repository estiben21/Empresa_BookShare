package com.centroinformacion.service;

import java.util.List;

import com.centroinformacion.entity.Autor;

public interface AutorService {
	
	public abstract List<Autor> listaPorTelefono(String telefono);
	public abstract Autor registraAutor(Autor obj);
	public abstract List<Autor> listPorNombreYApellidoLike(String filtro);
	//_______________________________________________________________________
	
	//Crud
	
		
		//Validaciones
		/*
		public abstract List<Autor> listaPorNombreApellidoIgual(String nombre, String apellido); 
		public abstract List<Autor> listaPorNombreApellidoIgualActualiza(String nombre, String apellido, int idAutor);
	public abstract Autor actualizaAutor(Autor obj);
	public abstract Optional<Autor> buscaAutor(int idAutor);
	*/
}
