package com.centroinformacion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.service.AutorService;

@Controller
public class AutorCrudController {

	@Autowired
	private AutorService autorService;
	
	
	@ResponseBody
	@GetMapping("/consultaCrudAutor")
	public List<Autor> consulta(String filtro){
		 List<Autor> lstSalida = autorService.listPorNombreYApellidoLike("%"+filtro+"%");
		 return lstSalida;
	}
}
