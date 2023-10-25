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
	
	@Query("select a from Autor a where a.nombres = ?1 and a.apellidos = ?2 and a.idAutor != ?3")
	public List<Autor> listaAutorNombreApellidoIgualActualiza(String nombres, String apellidos,int id);
	
	@Query("select a from Autor a where a.nombres = ?1 and a.apellidos = ?2")
	public List<Autor> listaAutorNombreApellidoIgual(String nombres, String apellidos);

	

}
