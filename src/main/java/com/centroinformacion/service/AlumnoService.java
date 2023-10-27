package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Alumno;

public interface AlumnoService { 
  
	public abstract List<Alumno> listaTodos();
	public abstract Alumno insertaAlumno(Alumno obj);
	
	public abstract List<Alumno> findByOrderByApellidosAsc();
	public abstract List<Alumno> listaPorDni(String dni);
	public abstract List<Alumno> listaPorTelefono(String telefono);
	
	//------------------------------_CP2-------------------------------------------
	//PASO1:
	//CRUD - Traer registros que coincidan con el FILTRO ingresado
	public abstract List<Alumno> listarPorNombresOrApellidosLike(String filtro);
	
	//Validación Modal Registrar
	public abstract List<Alumno> listaPorNombreApellidoIgualReg(String nombres, String apellidos);
	
	//Validación Modal Actualizar
	public abstract List<Alumno> listaPorNombreApellidoIgualAct(String nombres, String apellidos, int id);
	
	
	//Para actualizar datos del Alumno, su ESTADO (btn Eliminar)  y en el btn Atualizar
	public abstract Alumno actualizaAlumno(Alumno obj);
	
	//Para eliminar por ID o actualizar por ID
	public abstract Optional<Alumno> buscaAlumno(int idAlumno);
	
	
	//Validar que en el Actualizar no se pueda agregar un Alumno con un DNI que ya existe
	public abstract List<Alumno> listaPorDniAlumnoExistenteActualiza(String dni, int id);
}
