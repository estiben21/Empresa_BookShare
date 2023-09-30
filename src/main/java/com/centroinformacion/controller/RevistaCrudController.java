package com.centroinformacion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Revista;
import com.centroinformacion.service.RevistaService;

@Controller
public class RevistaCrudController {
	@Autowired
	private RevistaService revistaService;
	
	@ResponseBody
	@GetMapping("/consultaCrudRevista")
	public List<Revista> Consulta(String filtro){
		List<Revista> lstSalida = revistaService.listPorNombreLike("%"+filtro+"%");
		return lstSalida;
	}
	
}
