package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Sala;

public interface SalaRepository extends JpaRepository<Sala, Integer>{

	public List<Sala> findByNumero(String numero);
	
	@Query("select n from Sala n where n.numero like ?1")
	public List<Sala> listPorNumerolike(String filtro);

}
