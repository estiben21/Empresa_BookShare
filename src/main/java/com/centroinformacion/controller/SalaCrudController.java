package com.centroinformacion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	}
