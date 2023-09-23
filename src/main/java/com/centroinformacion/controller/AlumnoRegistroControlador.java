package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
/*
 * @autor Zarela Eugenia Manrique Condori
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.service.AlumnoService;
import com.centroinformacion.util.AppSettings;

import jakarta.servlet.http.HttpSession;

@Controller
public class AlumnoRegistroControlador {
	@Autowired
	private AlumnoService alumnoService;

	@PostMapping("/registraAlumno")
	@ResponseBody
	public Map<?, ?> registra(Alumno obj, HttpSession session){
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
}
