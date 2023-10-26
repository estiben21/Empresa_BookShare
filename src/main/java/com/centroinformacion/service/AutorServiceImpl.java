package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.repository.AutorRepository;

@Service
public class AutorServiceImpl implements AutorService{
	@Autowired	
	private AutorRepository repository;
 
	
	@Override
	public Autor registraAutor (Autor obj) {
		return repository.save(obj);
	}
	@Override
	public List<Autor> listaPorTelefono(String telefono) {
		return repository.findByTelefonoIgnoreCase(telefono);
	}
	@Override
	public List<Autor> listPorNombreYApellidoLike(String filtro) {
		return repository.listPorNombreYApellidoLike(filtro);
	}
	@Override
	public Autor actualizaAutor(Autor obj) {
		return  repository.save(obj);
	}
	@Override
	public Optional<Autor> buscaAutor(int id) {
		return repository.findById(id);
	}
	@Override
	public List<Autor> listaPorNombreApellidoIgualActualiza(String nombres,String apellidos, int id) {
		return repository.listaAutorNombreApellidoIgualActualiza(nombres, apellidos, id);
	}
	@Override
	public List<Autor> listaPorNombreApellidoIgual(String nombres, String apellidos) {
		return repository.listaAutorNombreApellidoIgual(nombres, apellidos);
	}
	@Override
	public List<Autor> listaPorTelefonoIgual(String telefono, int idAutor) {
		return repository.listaAutorTelefonoIgualActualiza(telefono, idAutor);
	}

	
	
}
