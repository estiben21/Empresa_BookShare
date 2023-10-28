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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.DataCatalogo;
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
		
		DataCatalogo objData = new DataCatalogo();
		objData.setIdDataCatalogo(27);
		obj.setEstadoPrestamo(objData);
		
		
		Libro objSalida = libroService.insertaRegistraLibro(obj);
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
	public Map<?, ?> actualiza(Libro obj , HttpSession session) {
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		obj.setEstado(1);
		obj.setFechaRegistro(new Date());
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		Optional<Libro> optLibro= libroService.buscaLibro(obj.getIdLibro());
		obj.setFechaRegistro(optLibro.get().getFechaRegistro());
		obj.setFechaActualizacion(new Date());
		obj.setEstado(optLibro.get().getEstado());
		obj.setUsuarioRegistro(optLibro.get().getUsuarioRegistro());
		obj.setUsuarioActualiza(optLibro.get().getUsuarioActualiza());
		
		DataCatalogo objData = new DataCatalogo();
		objData.setIdDataCatalogo(27);
		obj.setEstadoPrestamo(objData);
		
		Libro objSalida = libroService.insertaActualizaLibro(obj);
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
	public Map<?, ?> elimina(int id, HttpSession session) {
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		Optional<Libro> optLibro= libroService.buscaLibro(id);
		
		
		if(optLibro.isPresent()) {
			Libro objL = optLibro.get();
			objL.setFechaActualizacion(new Date());
			objL.setUsuarioActualiza(objUsuario);
			objL.setEstado(objL.getEstado() == 1 ? 0 : 1);
			Libro objSalida = libroService.insertaActualizaLibro(objL);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Libro> lista = libroService.listaPorTituloLike("%");
			map.put("lista", lista);
		}
		}else {
			map.put("mensaje", "El Libro con ID" +id + "no se encontró");
		}
		return map;
	}
	
	@GetMapping("/buscaPorTituloCrudLibro")
	@ResponseBody
	public String validaTitulo(String titulo) {
		List<Libro> listaLibro = libroService.listaPorTitulo(titulo);
		if (CollectionUtils.isEmpty(listaLibro)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
	@GetMapping("/buscarPorSerieLibro")
    @ResponseBody
    public Map<String, Boolean> buscaPorSerieLibro(@RequestParam("serie") String serie) {
        Map<String, Boolean> response = new HashMap<>();

        // Llama al servicio para verificar si la serie ya existe en la base de datos
        boolean serieExiste = libroService.existeLibroConSerie(serie);

        response.put("valid", !serieExiste);

        return response;
    }
}
