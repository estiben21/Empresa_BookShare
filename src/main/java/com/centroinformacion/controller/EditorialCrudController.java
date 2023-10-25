package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Editorial;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.EditorialService;
import com.centroinformacion.util.AppSettings;


import jakarta.servlet.http.HttpSession;

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
	

	//pc2 - REGISTRAR
	@PostMapping("/registraEditorialCrud") 
	@ResponseBody
	public Map<?, ?> registraEditorial(Editorial obj, HttpSession session) {
	    Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
	    // Datos automáticos
	    obj.setEstado(1);
	    obj.setFechaActualizacion(new Date());
	    obj.setFechaRegistro(new Date());
	    obj.setEstado(AppSettings.ACTIVO);
	    obj.setUsuarioRegistro(objUsuario);
	    obj.setUsuarioActualiza(objUsuario);
	    
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    Editorial objSalida = editorialService.insertaActualizaEditorial(obj);
	    if (objSalida == null) {
	        map.put("MENSAJE", "Error en el registro");
	        
	    } else {
	    	
	    	List<Editorial> lista = editorialService.listaPorRazonSocialLike("%");
			map.put("lista", lista);
			 map.put("MENSAJE", "Registro exitoso");
	       
	    }
	    return map;
	}

	

	//ACTUALIZAR
	@PostMapping("/actualizaCrudEditorial")
	@ResponseBody
	public Map<?, ?> actualiza(Editorial obj, HttpSession session) {
		 Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		HashMap<String, Object> map = new HashMap<String, Object>();
		  
		Optional<Editorial> optEditorial= editorialService.buscaEditorial(obj.getIdEditorial());
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		obj.setFechaRegistro(optEditorial.get().getFechaRegistro());
		obj.setEstado(optEditorial.get().getEstado());
		obj.setFechaActualizacion(new Date());
		
		Editorial objSalida = editorialService.insertaActualizaEditorial(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en actualizar");
		} else {
			map.put("MENSAJE", "Actualización exitosa");
			List<Editorial> lista = editorialService.listaPorRazonSocialLike("%");
			map.put("lista", lista);
			
		}
		return map;
	}
	
	//========================================VALIDACIONES
//PARA EL REGISTRAR
	@GetMapping("/buscaEditorialPorRucRegistra")
	@ResponseBody
	public String validaRuc(String ruc) {
		List<Editorial> lst = editorialService.listaPorRucIgualRegistra(ruc);
		if(CollectionUtils.isEmpty(lst)) {
			return "{\"valid\":true}";
		}else {     
			return "{\"valid\":false}";
		}
	}
	
	//PARA EL ACTUALIZAR
	@GetMapping("/buscaEditorialPorRucActualiza")
	@ResponseBody
	public String validaRucActualiza(String ruc, int id) {
		List<Editorial> lst = editorialService.listaPorRucIgualActualiza(ruc, id);
		if(CollectionUtils.isEmpty(lst)) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}

}
