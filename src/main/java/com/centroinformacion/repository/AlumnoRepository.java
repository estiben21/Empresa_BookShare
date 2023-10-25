package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Alumno;

public interface AlumnoRepository extends JpaRepository<Alumno, Integer>{
	  
	public abstract List<Alumno> findByOrderByApellidosAsc();
	public List<Alumno> findByDniIgnoreCase(String dni);
	public List<Alumno> findByTelefonoIgnoreCase(String telef);
	
	//------------------------------CONSULTAS USANDO QUERY _CP2-------------------------------------------
	//PASO1: ?1 => primer paràmetro
	@Query("select a from Alumno a where a.nombres like ?1 or a.apellidos like ?1")
	//PASO2:
	public List<Alumno> listaPorNombresOApellidos(String filtro);
	
	@Query("select a from Alumno a where a.nombres like ?1 and a.apellidos like ?2")
	//PASO2:
	public List<Alumno> listaPorNombreApellidoIgualRegistra(String nombre, String apellido);
	
	@Query("select a from Alumno a where a.nombres like ?1 and a.apellidos like ?2 and a.idAlumno !=?3")
	//PASO2:
	public List<Alumno> listaPorNombreApellidoIgualActualiza(String nombre, String apellido, int id);
}
