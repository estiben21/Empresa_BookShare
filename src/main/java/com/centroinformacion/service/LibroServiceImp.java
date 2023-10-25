package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Libro;
import com.centroinformacion.repository.LibroRepository;

@Service
public class LibroServiceImp implements LibroService {
	
	@Autowired	
	private LibroRepository repository;

	@Override
	public Libro insertaActualizaLibro(Libro obj) {
		return repository.save(obj);
	}
	 
	@Override
	public boolean existeLibroConSerie(String serie) {
		 Libro libro = repository.findBySerie(serie);
		    if (libro != null) {
		        return true;
		    }else {
			    return false;	
		    }
	}

	@Override
	public List<Libro> listaPorTituloLike(String filtro) {
		return repository.listPorTituloLike(filtro);
	}

	@Override
	public Libro actualizaLibro(Libro obj) {
		return repository.save(obj);
	}

	@Override
	public Libro insertaLibro(Libro obj) {
		return repository.save(obj);
	}

	@Override
	public Optional<Libro> buscaLibro(int idLibro) {
		return repository.findById(idLibro);
	}
}
