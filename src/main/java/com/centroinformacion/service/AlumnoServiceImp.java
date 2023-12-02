package com.centroinformacion.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
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
	public List<Alumno> listaPorNombreApellidoIgualReg(String nombres, String apellidos) {
		return repository.listaPorNombreApellidoIgualRegistra(nombres, apellidos);
	}

	@Override
	public List<Alumno> listaPorNombreApellidoIgualAct(String nombres, String apellidos, int id) {
		return repository.listaPorNombreApellidoIgualActualiza(nombres, apellidos, id);
	}

	@Override
	public Alumno actualizaAlumno(Alumno obj) {
		return repository.save(obj);
	}

	@Override
	public Optional<Alumno> buscaAlumno(int idAlumno) {
		return repository.findById(idAlumno);
	}

	@Override
	public List<Alumno> listaPorDniAlumnoExistenteActualiza(String dni, int id) {
		return repository.listaPorDniAlumnoExistenteActualiza(dni, id);
	}

	//----------------------------------------- CP3 ---------------------------------------
	@Override
	public List<Alumno> listaAlumnosPorFiltroConsulta(String nomApellido, int estado, String telefono,
			String dni, String correo, Date fechaNacDesde, Date fechaNacHasta, int idPais, int idModalidad) {
			return repository.listaConsultaAlumno(nomApellido, estado, telefono, dni, correo, fechaNacDesde, fechaNacHasta, idPais, idModalidad);
	}

	@Override
	public List<Alumno> listaAlumno(String filtro, Pageable pageable) {
		return repository.listaAlumno(filtro, pageable);
	}

	
	
}
