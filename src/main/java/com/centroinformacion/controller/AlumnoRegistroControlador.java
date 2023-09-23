package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
/*
 * @autor Zarela Eugenia Manrique Condori
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.entity.Pais;
import com.centroinformacion.service.AlumnoService;
import com.centroinformacion.service.PaisService;
import com.centroinformacion.util.AppSettings;

import jakarta.servlet.http.HttpSession;

@Controller
public class AlumnoRegistroControlador {
	@Autowired
	private AlumnoService alumnoService;
	
	@Autowired
	private PaisService paisService;
	
	/*@Autowired
	private ModalidadService modalidadService;*/
	
	@PostMapping("/registraAlumno")
	@ResponseBody
	public Map<?, ?> registra(Alumno obj, HttpSession session){
		Alumno objAlumno = (Alumno)session.getAttribute("objAlumno");/************/  
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());
		obj.setEstado(AppSettings.ACTIVO);
		
		HashMap<String, String> map = new HashMap<String, String>();
		Alumno objSalida = alumnoService.insertaAlumno(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en el registro");
		}else {
			map.put("MENSAJE", "Registro exitoso");
		}
		return map;
	}
	
	@ResponseBody 
	@GetMapping(value = "/listaPais" )
	public List<Pais> listaPais(){
		return paisService.listaTodos();
	}
	
	/*@ResponseBody 
	@GetMapping(value = "/listaModalidad" )
	public List<Modalidad> listaModalidad(){
		return paisService.listaTodos();
	}*/
}
