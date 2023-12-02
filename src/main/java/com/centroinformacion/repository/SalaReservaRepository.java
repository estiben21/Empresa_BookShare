package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.centroinformacion.entity.ReservaSala;

public interface SalaReservaRepository extends JpaRepository<ReservaSala, Integer>{
	public abstract List<ReservaSala> findByOrderBySalaAsc();
}
