package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Autor;

public interface AutorService {
	
	public abstract List<Autor> listaPorTelefono(String telefono);
	public abstract Autor registraAutor(Autor obj);
	public abstract List<Autor> listPorNombreYApellidoLike(String filtro);
	public abstract Autor actualizaAutor(Autor obj);
	public abstract Optional<Autor> buscaAutor(int idAutor);
	public abstract List<Autor> listaAutorNombreIgualActualiza(String nombres, int id);

}
