package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.AlumnoService;
import com.centroinformacion.util.AppSettings;

import jakarta.servlet.http.HttpSession;

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
		List<Alumno> lstaSalida = alumnoService.listarPorNombresOrApellidosLike("%" + filtro + "%");
		return lstaSalida;
	}
	/*
	@ResponseBody
	@GetMapping("/buscaAlumnoMayorEdad")
	public String busca(String fechaNacimiento){
		if(FunctionsUtil.isMayorEdad(fechaNacimiento)) { 
			return "{\"valid\":true}";
		} else {  
			return "{\"valid\":false}";
		}
	}*/
	
	@PostMapping("/registraCrudAlumno")
	@ResponseBody
	public Map<?, ?> registra(Alumno obj, HttpSession session) {
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());
		obj.setEstado(AppSettings.ACTIVO);
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		HashMap<String, Object> map = new HashMap<String, Object>(); /*Permite colocar los mensajes*/
		obj.setEstado(1);
		//Datos que se llenarán por defecto, automáticamente
		obj.setFechaRegistro(new Date()); //Toma la fecha del sistema
		obj.setFechaActualizacion(new Date()); //Toma la fecha del sistema
		
		List<Alumno> lstSalida = alumnoService.
						listaPorNombreApellidoIgual(obj.getNombres(), obj.getApellidos());
		if (!CollectionUtils.isEmpty(lstSalida)) { //Si la lista no es vacía, está trayendo datos coincidentes, 
			map.put("mensaje", "El empleado " + obj.getNombres() + " " + obj.getApellidos() + " ya existe");
			return map;
		}
		
		Alumno objSalida = alumnoService.insertaAlumno(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en el registro");
		} else {
			//Actualizar la Grilla en el navegador al hacer un registro
			List<Alumno> lista = alumnoService.listarPorNombresOrApellidosLike("%");
			map.put("lista", lista);
			//Mostrar mensaje de confirmación
			map.put("mensaje", "Registro exitoso");
		}
		return map;
	}
	
	/*@GetMapping("/buscaPorDni")
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
	}*/
}
