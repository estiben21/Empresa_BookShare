package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Revista;

public interface RevistaRepository extends JpaRepository<Revista, Integer>{
	public List<Revista> findByNombreIgnoreCase(String nombre);
	public List<Revista> findByNombreOrFrecuenciaIgnoreCase(String nombre,String frecuencia);
	
	@Query("select r from Revista r where r.nombre like ?1 or r.frecuencia like ?1")
	public List<Revista> listPorNombreLike(String filtro);
	
}