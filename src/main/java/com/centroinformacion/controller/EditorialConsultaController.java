package com.centroinformacion.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Editorial;
import com.centroinformacion.service.EditorialService;

@Controller
public class EditorialConsultaController {
	
	@Autowired
	private EditorialService editorialService;

	/* Mapea la solicitud GET para mostrar la vista de consulta editorial
	@GetMapping("/verConsultaEditorial")
	public String verInicio() {
		return "consultaEditorial";
	}*/

	// Mapea la solicitud GET para realizar la consulta editorial y devuelve los resultados como JSON
	@GetMapping("/consultaEditorial")
	@ResponseBody
	public List<Editorial> consulta(int estado, int idPais, String razonSocial, String direccion, String ruc,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date desde, @DateTimeFormat(pattern = "yyyy-MM-dd") Date hasta) {

		// Realiza la consulta usando el servicio editorial y devuelve los resultados
		List<Editorial> lstSalida = editorialService.listaConsultaEditorial(estado, idPais, "%"+  razonSocial+"%" ,
				 "%"+direccion+ "%",  "%"+ruc + "%", desde, hasta);
		return lstSalida;
	}
}
