package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Revista;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.RevistaService;

import jakarta.servlet.http.HttpSession;

@Controller
public class RevistaCrudController {
	@Autowired
	private RevistaService revistaService;
	
	@ResponseBody
	@GetMapping("/consultaCrudRevista")
	public List<Revista> Consulta(String filtro){
		List<Revista> lstSalida = revistaService.listaPorNombreFrecuenciaLike("%"+filtro+"%");
		return lstSalida;
	}
	
	@PostMapping("/registraCrudRevista")
	@ResponseBody
	public Map<?, ?> registra(Revista obj , HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		obj.setEstado(1);
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		
		Revista objSalida = revistaService.insertaRevista(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en el registro");
		} else {
			List<Revista> lista = revistaService.listaPorNombreFrecuenciaLike("%");
			map.put("lista", lista);
			map.put("mensaje", "Registro exitoso");
		}
		return map;
	}
	
	@PostMapping("/actualizaCrudRevista")
	@ResponseBody
	public Map<?, ?> actualiza(Revista obj) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		  
		Optional<Revista> optRevista= revistaService.buscaRevista(obj.getIdRevista());
		obj.setFechaRegistro(optRevista.get().getFechaRegistro());
		obj.setFechaActualizacion(new Date());
		obj.setEstado(optRevista.get().getEstado());
		obj.setUsuarioRegistro(optRevista.get().getUsuarioRegistro());
		obj.setUsuarioActualiza(optRevista.get().getUsuarioActualiza());
		Revista objSalida = revistaService.actualizaRevista(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Revista> lista = revistaService.listaPorNombreFrecuenciaLike("%");
			map.put("lista", lista);
			map.put("mensaje", "Actualización exitosa");
		}
		return map;
	}
	
	@ResponseBody
	@PostMapping("/eliminaCrudRevista")
	public Map<?, ?> elimina(Revista obj , HttpSession session, int id) {
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Revista objRevista= revistaService.buscaRevista(id).get();  
		
		objRevista.setEstado( objRevista.getEstado() == 1 ? 0 : 1);
		objRevista.setFechaActualizacion(new Date());
		
		obj.setFechaActualizacion(new Date());
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		Revista objSalida = revistaService.actualizaRevista(objRevista);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Revista> lista = revistaService.listaPorNombreFrecuenciaLike("%");
			map.put("lista", lista);
		}
		return map;
	}
	
	@GetMapping("/buscaPorNombreCrudRevista")
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
