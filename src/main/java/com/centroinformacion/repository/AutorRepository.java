package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Autor;

public interface AutorRepository extends JpaRepository<Autor, Integer>{
	
	public List<Autor> findByTelefonoIgnoreCase(String telef);
	
	//JPQL--->Clases y atributos
	@Query("select a from Autor a where a.nombres like ?1 or a.apellidos like ?1")
	public List<Autor> listPorNombreYApellidoLike(String filtro);
	
	/*
	@Query("select e from Autor e where e.nombres = ?1 and e.apellidos = ?2")
	public List<Autor> listaAutorNombreApellidoIgual(String nombre, String apellido);

	
	@Query("select e from Autor e where e.nombres = ?1 and e.apellidos = ?2 and e.idAutor != ?3")
	public List<Autor> listaAutorNombreApellidoIgualActualiza(String nombre, String apellido, int idAutor);
	*/

}
