package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.AlumnoService;
import com.centroinformacion.util.FunctionUtil;

import jakarta.servlet.http.HttpSession;


@Controller //PASO 1: para decirle al sistema que esta clase la usaremos como Controller
public class AlumnoCrudController {
	//PASO 2:
	@Autowired
	//PASO 3: Llamar al Service
	private AlumnoService alumnoService;
	
	/** -------------- Traer lista según FILTRO ingresado -------------- **/
	//PASO4: Despuès de haber programado en el Repository, Service y ServiceImpl
	@ResponseBody
	@GetMapping(value = "/consultaCrudAlumno")
	public List<Alumno> consulta(String filtro){
		return alumnoService.listarPorNombresOrApellidosLike("%" + filtro + "%");
	}
			
		
	/** -------------- Método REGISTRA -------------- **/
	@PostMapping("/registraCrudAlumno")
	@ResponseBody
	public Map<?, ?> registra(Alumno obj, HttpSession session) {
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		HashMap<String, Object> map = new HashMap<String, Object>(); //Permite colocar los mensajes
		//Datos que se llenarán por defecto, automáticamente
		obj.setFechaRegistro(new Date()); //Toma la fecha del sistema
		obj.setFechaActualizacion(new Date()); //Toma la fecha del sistema
		obj.setEstado(1); //obj.setEstado(AppSettings.ACTIVO);
		
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		/*List<Alumno> lstSalida = alumnoService.listaPorNombreApellidoIgualReg(obj.getNombres(), obj.getApellidos());
		if (!CollectionUtils.isEmpty(lstSalida)) { //Si la lista no es vacía, está trayendo datos coincidentes, 
			map.put("mensaje", "El alumno " + obj.getNombres() + " " + obj.getApellidos() + " ya existe");
			return map;
		}*/	
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
	
	/** -------------- Método ACTUALIZA / del btn EDITAR -------------- **/
	@PostMapping("/actualizaCrudAlumno")
	@ResponseBody
	public Map<?, ?> actualiza(Alumno obj, HttpSession session) {
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		HashMap<String, Object> map = new HashMap<String, Object>(); //Permite colocar los mensajes
		  
		Optional<Alumno> optAlumno = alumnoService.buscaAlumno(obj.getIdAlumno());
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		obj.setFechaRegistro(optAlumno.get().getFechaRegistro());
		obj.setEstado(optAlumno.get().getEstado());
		obj.setFechaActualizacion(new Date());
		
		Alumno objSalida = alumnoService.actualizaAlumno(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			map.put("mensaje", "Actualización exitosa");
			List<Alumno> lista = alumnoService.listarPorNombresOrApellidosLike("%");
			map.put("listaAct", lista);
		}
		return map;
	}

	

	@GetMapping("/buscaAlumnoPorNombreApellidoId_btnActualizar")
	@ResponseBody
	public String buscaAlumno(String nombres, String apellidos, int id) {
		List<Alumno> listaPorNombreApellidoId = alumnoService.listaPorNombreApellidoIgualAct(nombres, apellidos, id);
		if (CollectionUtils.isEmpty(listaPorNombreApellidoId)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
	
	
	@GetMapping("/buscaAlumnoPorDniId_Actualizar")
	@ResponseBody
	public String buscaAlumno(String dni, int id) {
		List<Alumno> listaPorDni = alumnoService.listaPorDniAlumnoExistenteActualiza(dni, id);
		if (CollectionUtils.isEmpty(listaPorDni)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
	
	
	/** -------------- Método ELIMINAR / del btn Elimina (estado)-------------- **/
	@ResponseBody
	@PostMapping("/eliminaCrudAlumno")
	public Map<?, ?> elimina(Alumno obj, HttpSession session, int id) {
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Alumno objAlumno = alumnoService.buscaAlumno(id).get();
		objAlumno.setFechaActualizacion(new Date());  
		objAlumno.setEstado( objAlumno.getEstado() == 1 ? 0 : 1);
		
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		obj.setFechaActualizacion(new Date());
		
		Alumno objSalida = alumnoService.actualizaAlumno(objAlumno);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Alumno> lista = alumnoService.listarPorNombresOrApellidosLike("%");
			map.put("lista", lista);
		}
		return map;
	}
	
	
	//-------------------- VALIDAR EDAD ESTUDIANTIL ------------------------------------
	@GetMapping("/buscaAlumnoEdadEstudiantil")
	@ResponseBody
	public String validaFecha(String fechaNacimiento) {
		if(FunctionUtil.isEdadEstudiantil(fechaNacimiento)) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}
}
