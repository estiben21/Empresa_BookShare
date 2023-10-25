
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

import com.centroinformacion.entity.Sala;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.SalaService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SalaCrudController {
	
	@Autowired
	private SalaService salaService;
	
	@ResponseBody
	@GetMapping("/consultaCrudSala")
	public List<Sala> consulta(String filtro){
	 List<Sala> lstSalida = salaService.listPorNumerolike("%"+filtro+"%");
	 return lstSalida;
	}
	
	
	@PostMapping("/registraCrudSala")
	@ResponseBody
	public Map<?, ?> registra(Sala obj , HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		obj.setEstado(1);
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		
		Sala objSalida = salaService.insertaRegistraSala(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en el registro");
		} else {
			List<Sala> lista = salaService.listPorNumerolike("%");
			map.put("lista", lista);
			map.put("mensaje", "Registro exitoso");
		}
		return map;
	}
	
	@PostMapping("/actualizaCrudSala")
	@ResponseBody
	public Map<?, ?> actualiza(Sala obj) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		  
		Optional<Sala> optSala= salaService.buscarSala(obj.getIdSala());
		obj.setFechaRegistro(optSala.get().getFechaRegistro());
		obj.setFechaActualizacion(optSala.get().getFechaActualizacion());
		obj.setEstado(optSala.get().getEstado());
		obj.setUsuarioRegistro(optSala.get().getUsuarioRegistro());
		obj.setUsuarioActualiza(optSala.get().getUsuarioActualiza());
		Sala objSalida = salaService.insertaActualizaSala(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Sala> lista = salaService.listPorNumerolike("%");
			map.put("lista", lista);
			map.put("mensaje", "Actualización exitosa");
		}
		return map;
	}
	
	
	@ResponseBody
	@PostMapping("/eliminaCrudSala")
	public Map<?, ?> elimina(int id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Sala objSala= salaService.buscarSala(id).get();  
		objSala.setEstado( objSala.getEstado() == 1 ? 0 : 1);
		Sala objSalida = salaService.insertaActualizaSala(objSala);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Sala> lista = salaService.listPorNumerolike("%");
			map.put("lista", lista);
		}
		return map;
	}
	
	@GetMapping("/buscaPorNumeroCrudSala")
	@ResponseBody
	public String validaNombre(String nombre) {
		List<Sala> listaSala = salaService.listaPorNumero(nombre);
		if (CollectionUtils.isEmpty(listaSala)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
	
	@GetMapping("/buscaSalaPorNumeroRegistra")
	@ResponseBody
	public String validaNumeroRegistra(String nombre) {
		List<Sala> lst = salaService.listaPorNumeroIgualRegistra(nombre);
		if(CollectionUtils.isEmpty(lst)) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}
	
	
}
