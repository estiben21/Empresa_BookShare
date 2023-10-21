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

import com.centroinformacion.entity.Autor;
import com.centroinformacion.service.AutorService;

import jakarta.servlet.http.HttpSession;

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
	
	
	
	@PostMapping("/registraCrudAutor")
	@ResponseBody
	public Map<?, ?> registra(Autor obj, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		obj.setEstado(1);
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date()); 
	
		//Para la PC2
		//Usuario objUsuario=(Usuario)session.getAttribute("objUsuario");
		//obj.setUsuarioRegistro(objUsuario);
		//obj.setUsuarioActualiza(objUsuario);
		
		//Validaciones por nombre y apellido
		List<Autor> lstSalida = autorService.listaPorNombreApellidoIgual(obj.getNombres(), obj.getApellidos());
		if (!CollectionUtils.isEmpty(lstSalida)) {
			map.put("mensaje", "El autor " + obj.getNombres()+ " " + obj.getApellidos() + " ya existe");
			List<Autor> lista = autorService.listPorNombreYApellidoLike("%");
			map.put("lista", lista);
			return map;
		} 
		
		Autor objSalida = autorService.registraAutor(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en el registro");
		} else {
			map.put("mensaje", "Registro exitoso");
			List<Autor> lista = autorService.listPorNombreYApellidoLike("%");
			map.put("lista", lista);
		}
	

		return map;
	}
}
