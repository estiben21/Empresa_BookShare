package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Sala;
import com.centroinformacion.service.SalaService;

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
	public Map<?, ?> registra(Sala obj) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		obj.setEstado(1);
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());
		
		List<Sala> lstSalida = salaService.listaPorNumero(obj.getNumero());
		if (!CollectionUtils.isEmpty(lstSalida)) {
			map.put("mensaje", "La Sala " + obj.getNumero() + " ya existe");
			return map;
		}
		
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
	
	
	
	
	}
