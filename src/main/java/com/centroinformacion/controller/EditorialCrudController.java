package com.centroinformacion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Editorial;
import com.centroinformacion.service.EditorialService;

//1.agregar el controller
@Controller
public class EditorialCrudController {
	//2.agregar el service, no olvidar vel AUTOWIRED
	@Autowired
	private EditorialService editorialService;
	
	
	//CONSULTA
	@ResponseBody
	@GetMapping("/consultaCrudEditorial")
	public List<Editorial> consulta(String filtro){
		List<Editorial> lstSalida =editorialService.listaPorRazonSocialLike("%"+filtro+"%");
		return lstSalida;
	}
}
