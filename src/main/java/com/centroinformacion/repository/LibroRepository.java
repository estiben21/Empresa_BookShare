package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Libro;

public interface LibroRepository extends JpaRepository<Libro, Integer> {

	Libro findBySerie(String serie);
	public List<Libro> findByTituloIgnoreCase(String titulo);
	
	@Query("Select p from Libro p where p.titulo like ?1")
	public List<Libro> listPorTituloLike(String filtro);
	
}
