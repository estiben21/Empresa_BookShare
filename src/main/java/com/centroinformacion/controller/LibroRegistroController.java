package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
/**
 *  @author Fernando Manrique Solano
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.DataCatalogo;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.LibroService;
import com.centroinformacion.util.AppSettings;

import jakarta.servlet.http.HttpSession;

@Controller
public class LibroRegistroController {
	
	@Autowired
	private LibroService libroService;
	
	@PostMapping("/registraLibro")
	@ResponseBody
	public Map<?, ?> registra(Libro obj, HttpSession session){
		Usuario objUsuario = (Usuario)session.getAttribute("objUsuario");
		obj.setFechaActualizacion(new Date());
		obj.setFechaRegistro(new Date());
		obj.setEstado(AppSettings.ACTIVO);
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		DataCatalogo objData = new DataCatalogo();
		objData.setIdDataCatalogo(27);
		obj.setEstadoPrestamo(objData);
		
		HashMap<String, String> map = new HashMap<String, String>();
		Libro objSalida = libroService.insertaActualizaLibro(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en el registro");
		}else {
			map.put("MENSAJE", "Registro exitoso");
		}
		return map;
	}
	
	
	@GetMapping("/buscaPorSerieLibro")
    @ResponseBody
    public Map<String, Boolean> buscaPorSerieLibro(@RequestParam("serie") String serie) {
        Map<String, Boolean> response = new HashMap<>();

        // Llama al servicio para verificar si la serie ya existe en la base de datos
        boolean serieExiste = libroService.existeLibroConSerie(serie);

        response.put("valid", !serieExiste);

        return response;
    }
}
