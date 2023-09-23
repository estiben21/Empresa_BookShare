package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.centroinformacion.entity.Revista;

public interface RevistaRepository extends JpaRepository<Revista, Integer>{
	public List<Revista> findByNombreIgnoreCase(String nombre);
}