package com.centroinformacion.controller;

/**
 * @author Lionel Orihuela
 */
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AutorRegistroController {
	@GetMapping(value = "/RegistraAutor" )
	public String verActor() {return "intranetRegistroAutor";}
	
	
	
}
