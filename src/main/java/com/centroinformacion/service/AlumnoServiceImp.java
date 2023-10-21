package com.centroinformacion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.repository.AlumnoRepository;

@Service
public class AlumnoServiceImp implements AlumnoService {

	@Autowired
	private AlumnoRepository repository;

	@Override
	public List<Alumno> listaTodos() {
		return repository.findByOrderByApellidosAsc();
	}
	
	@Override
	public Alumno insertaAlumno(Alumno obj) {
		return repository.save(obj);
	}
	
	@Override
	public List<Alumno> findByOrderByApellidosAsc(){
		return repository.findByOrderByApellidosAsc();
	}

	@Override
	public List<Alumno> listaPorDni(String dni){
		return repository.findByDniIgnoreCase(dni);
	}

	@Override
	public List<Alumno> listaPorTelefono(String telefono) {
		return repository.findByTelefonoIgnoreCase(telefono);
	}

	
	//----------------------------------------- CP2 ---------------------------------------
	@Override //PASO1:
	public List<Alumno> listarPorNombresOrApellidosLike(String filtro) {
		return repository.listaPorNombresOApellidos(filtro);
	}

	@Override
	public List<Alumno> listaPorNombreApellidoIgual(String nombre, String apellido) {
		return repository.listaPorNombreApellidoIgual(nombre, apellido);
	}
	
}
