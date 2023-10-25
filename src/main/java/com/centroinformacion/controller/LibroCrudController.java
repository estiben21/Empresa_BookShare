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

import com.centroinformacion.entity.Libro;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.LibroService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LibroCrudController {
	@Autowired
	private LibroService libroService;
	
	@ResponseBody
	@GetMapping("/consultaCrudLibro")
	private List<Libro> consulta(String filtro){
		List<Libro> lstSalida = libroService.listaPorTituloLike("%"+filtro+"%");
		return lstSalida;
	}
	
	@PostMapping("/registraCrudLibro")
	@ResponseBody
	public Map<?, ?> registra(Libro obj , HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		obj.setEstado(1);
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		
		Libro objSalida = libroService.insertaLibro(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en el registro");
		} else {
			List<Libro> lista = libroService.listaPorTituloLike("%");
			map.put("lista", lista);
			map.put("mensaje", "Registro exitoso");
		}
		return map;
	}
	
	@PostMapping("/actualizaCrudLibro")
	@ResponseBody
	public Map<?, ?> actualiza(Libro obj) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		  
		Optional<Libro> optLibro= libroService.buscaLibro(obj.getIdLibro());
		obj.setFechaRegistro(optLibro.get().getFechaRegistro());
		obj.setFechaActualizacion(optLibro.get().getFechaActualizacion());
		obj.setEstado(optLibro.get().getEstado());
		obj.setUsuarioRegistro(optLibro.get().getUsuarioRegistro());
		obj.setUsuarioActualiza(optLibro.get().getUsuarioActualiza());
		Libro objSalida = libroService.actualizaLibro(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Libro> lista = libroService.listaPorTituloLike("%");
			map.put("lista", lista);
			map.put("mensaje", "Actualización exitosa");
		}
		return map;
	}
	
	@ResponseBody
	@PostMapping("/eliminaCrudLibro")
	public Map<?, ?> elimina(int id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Libro objLibro= libroService.buscaLibro(id).get();  
		objLibro.setEstado( objLibro.getEstado() == 1 ? 0 : 1);
		Libro objSalida = libroService.actualizaLibro(objLibro);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Libro> lista = libroService.listaPorTituloLike("%");
			map.put("lista", lista);
		}
		return map;
	}
	
	@GetMapping("/buscaPorTituloCrudLibro")
	@ResponseBody
	public String validaTitulo(String titulo) {
		List<Libro> listaLibro = libroService.listaPorTituloLike(titulo);
		if (CollectionUtils.isEmpty(listaLibro)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
}
