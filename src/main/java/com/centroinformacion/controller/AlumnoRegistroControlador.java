package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
/*
 * @autor Zarela Eugenia Manrique Condori
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.entity.Usuario;
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
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());
		obj.setEstado(AppSettings.ACTIVO);
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		Alumno objSalida = alumnoService.insertaAlumno(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en el registro");
		}else {
			map.put("MENSAJE", "Registro exitoso");
		}
		return map;
	}
	
	
	@GetMapping("/buscaPorDni")
	@ResponseBody
	public String validaDni(String dni) {
		List<Alumno> listaPorDni = alumnoService.listaPorDni(dni);
		if (CollectionUtils.isEmpty(listaPorDni)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
	
	@GetMapping("/buscaPorTelefono")
	@ResponseBody
	public String validaTelefono(String telefono) {
		List<Alumno> listaPorTelefono = alumnoService.listaPorTelefono(telefono);
		if (CollectionUtils.isEmpty(listaPorTelefono)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
}
