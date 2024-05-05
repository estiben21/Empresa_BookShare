package com.centroinformacion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.entity.DataCatalogo;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.entity.Pais;
import com.centroinformacion.service.AlumnoService;
import com.centroinformacion.service.DataCatalogoService;
import com.centroinformacion.service.LibroService;
import com.centroinformacion.service.PaisService;
import com.centroinformacion.util.AppSettings;
@Controller
public class UtilController {
	

	@Autowired
	private PaisService paisService;

	@Autowired
	private DataCatalogoService dataCatalogoService;
	
	@Autowired
	private AlumnoService alumnoService;
	

		
	@Autowired
	private LibroService libroService;

	@GetMapping("/listaPais")
	@ResponseBody
	public List<Pais> listaPais() {
		return paisService.listaTodos();
	}
	
	@GetMapping("/listaAlumno")
	@ResponseBody
	public List<Alumno> listaAlumno() {
		return alumnoService.listaTodos();
	}
	
	

	@GetMapping("/listaCategoriaDeLibro")
	@ResponseBody
	public List<DataCatalogo> listaCategoriaDeLibro() {
		return dataCatalogoService.listaDataCatalogo(AppSettings.CATALOGO_01_CATEGORIA_DE_LIBRO);
	}
	
	@GetMapping("/listaModalidadAlumno")
	@ResponseBody
	public List<DataCatalogo> listaModalidadAlumno() {
		return dataCatalogoService.listaDataCatalogo(AppSettings.CATALOGO_02_MODALIDAD_DE_ALUMNO);
	}
	
	@GetMapping("/listaTipoLibroRevista")
	@ResponseBody
	public List<DataCatalogo> listaTipoLibroRevista() {
		return dataCatalogoService.listaDataCatalogo(AppSettings.CATALOGO_03_TIPO_DE_LIBRO_Y_REVISTA);
	}	
	
	@GetMapping("/listaEstadoLibro")
	@ResponseBody
	public List<DataCatalogo> listaEstadoLibro() {
		return dataCatalogoService.listaDataCatalogo(AppSettings.CATALOGO_04_ESTADO_DE_LIBRO);
	}	
	
	@GetMapping("/listaLibro")
	@ResponseBody
	public List<Libro> listaLibro() {
		return libroService.listaLibro();
	}
	
	
}
