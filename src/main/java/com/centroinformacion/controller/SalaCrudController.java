
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

import com.centroinformacion.entity.Sala;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.SalaService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SalaCrudController {
	
	@Autowired
	private SalaService salaService;
	
	/*@ResponseBody
	@GetMapping("/consultaCrudSala")
	public List<Sala> consulta(String filtro){
	 List<Sala> lstSalida = salaService.listaPorNumeroLike("%"+filtro+"%");
	 return lstSalida;
	}
	
	
	@PostMapping("/registraCrudSala")
	@ResponseBody
	public Map<?, ?> registra(Sala obj , HttpSession session) {
		
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		obj.setEstado(1);
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
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
	
	@PostMapping("/actualizaCrudSala")
	@ResponseBody
	public Map<?, ?> actualiza(Sala obj) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Optional<Sala> optSala = salaService.buscarSala(obj.getIdSala());
		obj.setUsuarioRegistro(optSala.get().getUsuarioRegistro());
		obj.setUsuarioActualiza(optSala.get().getUsuarioActualiza());
		obj.setFechaRegistro(optSala.get().getFechaRegistro());
		obj.setEstado(optSala.get().getEstado());
		obj.setFechaActualizacion(new Date());

		Sala objSalida = salaService.insertaActualizaSala(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			
			List<Sala> lista = salaService.listPorNumerolike("%");
			map.put("lista", lista);
			map.put("mensaje", "Actualización exitosa");
		}
		return map;
	}
	
	
	@ResponseBody
	@PostMapping("/eliminaCrudSala")
	public Map<?, ?> elimina(int id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Sala objSala= salaService.buscarSala(id).get();  
		objSala.setEstado( objSala.getEstado() == 1 ? 0 : 1);
		Sala objSalida = salaService.insertaActualizaSala(objSala);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Sala> lista = salaService.listPorNumerolike("%");
			map.put("lista", lista);
		}
		return map;
	}
	
	@GetMapping("/buscaPorNumeroCrudSala")
	@ResponseBody
	public String validaNombre(String numero) {
		List<Sala> listaSala = salaService.listaPorNumero(numero);
		if (CollectionUtils.isEmpty(listaSala)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
	
	@GetMapping("/buscaSalaPorNumeroRegistra")
	@ResponseBody
	public String validaNumeroRegistra(String numero) {
		List<Sala> lst = salaService.listaPorNumeroIgualRegistra(numero);
		if(CollectionUtils.isEmpty(lst)) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}
	
	@GetMapping("/buscaPorNumeroSalaActualiza")
	@ResponseBody
	public String validaNumeroActualiza(String numero) {
	        List<Sala> lst = salaService.listaPorNumeroIgualActualiza(numero);
	        if(CollectionUtils.isEmpty(lst))  {
	            return "{\"valid\":true}";
	        } else {
	            return "{\"valid\":false}";
	        }
	    } 
	}*/

	

}