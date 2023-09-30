package com.centroinformacion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.service.AlumnoService;

@Controller //PASO 1: para decirle al sistema que esta clase la usaremos como Controller
public class AlumnoCrudController {
	//PASO 2:
	@Autowired
	//PASO 3: Llamar al Service
	private AlumnoService alumnoService;
	
	//PASO4: Despuès de haber programado en el Repository, Service y ServiceImpl
	@ResponseBody
	@GetMapping("/consultaCrudAlumno")
	public List<Alumno> consulta(String filtro){
		List<Alumno> lstaSalida = alumnoService.listarPorTituloLikeNombresOrApellidosLike("%" + filtro + "%");
		return lstaSalida;
	}
}
