package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.entity.LibroHasAutor;
import com.centroinformacion.entity.LibroHasAutorPK;
import com.centroinformacion.repository.LibroHasAutorRepository;
import com.centroinformacion.repository.LibroRepository;


@Service
public class LibroServiceImp implements LibroService {
	@Autowired	
	private LibroRepository repository;
	//sem 14
		@Autowired
		private LibroHasAutorRepository libroHasAutorRepository;
		//--

	@Override
	public Libro insertaActualizaLibro(Libro obj) {
		return repository.save(obj);
	}
	@Override
	public Libro insertaRegistraLibro(Libro obj) {
		return repository.save(obj);
	}

	@Override
	public List<Libro> listaPorTitulo(String titulo) {
		return repository.findByTituloIgnoreCase(titulo);
	}
	
	@Override
	public List<Libro> listaPorTituloLike(String filtro) {
		return repository.listPorTituloLike(filtro);
	}

	@Override
	public Optional<Libro> buscaLibro(int idLibro) {
		return repository.findById(idLibro);
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
	public List<Libro> listaConsultaLibro(int estado, int idCategoria, int idTipo, String titulo, String serie, int anio) {
		return repository.listaConsultaLibro(estado,  idCategoria, idTipo, titulo, serie, anio);
	}
	
	//pc4
	@Override
	public List<Libro> listaLibro() {
		return repository.findAll();
	}

		//inserta
		@Override
		public LibroHasAutor insertaAutor(LibroHasAutor obj) {
			return libroHasAutorRepository.save(obj);
		}

		@Override
		public void eliminaAutor( LibroHasAutor obj) {
			libroHasAutorRepository.delete(obj);
			
		}

		@Override
		public Optional<LibroHasAutor> buscaAutor( LibroHasAutorPK obj) {
			return libroHasAutorRepository.findById(obj);
		}

		@Override
		public List<Autor> traerAutorDeLibro(int idLibro) {
			return repository.traerAutorDeLibro(idLibro);
		}
		
		//---
}
