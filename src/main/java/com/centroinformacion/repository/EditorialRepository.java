package com.centroinformacion.repository;
/**
 * 
 * @author Leslie Marlo
 */

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.centroinformacion.entity.Editorial;




public interface EditorialRepository extends JpaRepository<Editorial, Integer>{
	//ignorar mayusculas/minusculas
	public List<Editorial> findByRucIgnoreCase(String ruc);
	

}
