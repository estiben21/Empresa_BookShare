package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
/**
 * @author ESTIBEN YEROVI MENDOZA TORRES
 */
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Revista;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.RevistaService;
import com.centroinformacion.util.AppSettings;

import jakarta.servlet.http.HttpSession;

@Controller
public class RevistaRegistroController {
	@Autowired
	private RevistaService revistaService;
	
	@PostMapping("/registraRevista")
	@ResponseBody
	public Map<?, ?> registra(Revista obj, HttpSession session){
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());
		obj.setEstado(AppSettings.ACTIVO);
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		HashMap<String, String> map = new HashMap<String, String>();
		Revista objSalida = revistaService.insertaActualizaRevista(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en el registro");
		}else {
			map.put("MENSAJE", "Registro exitoso");
		}
		return map;
	}

	@GetMapping("/buscaPorNombreRevista")
	@ResponseBody
	public String validaNombre(String nombre) {
		List<Revista> listaRevista = revistaService.ListaPorNombre(nombre);
		if (CollectionUtils.isEmpty(listaRevista)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
}
