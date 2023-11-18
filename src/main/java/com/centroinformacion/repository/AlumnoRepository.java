package com.centroinformacion.repository;

import java.util.Date;
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
	//PASO2: Crear mètodo con paràmetro para el filtro ?1
	public List<Alumno> listaPorNombresOApellidos(String filtro);
	
	@Query("select a from Alumno a where a.nombres like ?1 and a.apellidos like ?2")
	public List<Alumno> listaPorNombreApellidoIgualRegistra(String nombre, String apellido);
	
	@Query("select a from Alumno a where a.nombres like ?1 and a.apellidos like ?2 and a.idAlumno !=?3")
	public List<Alumno> listaPorNombreApellidoIgualActualiza(String nombre, String apellido, int id);
	
	@Query("select a from Alumno a where a.dni like ?1 and a.idAlumno !=?2")
	//Para Validar que no se pueda registrar un Alumno con un DNI que ya exista en otro registro (btnActualizar)
	public abstract List<Alumno> listaPorDniAlumnoExistenteActualiza(String dni, int id);
	
	//------------------------------CONSULTAS USANDO QUERY _CP3-------------------------------------------
	@Query("select a from Alumno a where "
										+ "(a.nombres like ?1 or a.apellidos like ?1) and "
										+ "(a.estado = ?2) and "
										+ "(a.telefono like ?3) and "
										+ "(a.dni like ?4) and "
										+ "(a.correo like ?5) and "
										+ "(a.fechaNacimiento >= ?6) and "
										+ "(a.fechaNacimiento <= ?7) and "
										+ "( ?8 = -1  or a.pais.idPais = ?8) and "
										+ "( ?9 = -1 or a.modalidad.idDataCatalogo = ?9)")
	public abstract List<Alumno> listaConsultaAlumno(String nomApe, int estado, String telefono, String dni, 
													String correo, Date fechaNacDesde, Date fechaNacHasta, int idPais, int idModalidad);
}
