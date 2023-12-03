package com.centroinformacion.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.centroinformacion.entity.LibroHasAutor;
import com.centroinformacion.entity.LibroHasAutorPK;

//1. AÑADIR LA EXPTENSION DE LAS ENTIDADES AL REPOSITORY
public interface LibroHasAutorRepository extends JpaRepository<LibroHasAutor, LibroHasAutorPK> {

}
