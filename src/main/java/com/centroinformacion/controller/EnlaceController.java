package com.centroinformacion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class EnlaceController {

	//Login
	@GetMapping("/")
	public String verLogin() {	return "intranetLogin";  }
	
	@GetMapping("/verIntranetHome")
	public String verIntranetHome() {	return "intranetHome";  }

	//Registro
	@GetMapping("/verRegistroAlumno")
	public String verRegistroAlumno() {	return "intranetRegistroAlumno";	}

	@GetMapping("/verRegistroLibro")
	public String verRegistroLibro() {	return "intranetRegistroLibro";	}

	
	//Crud
	@GetMapping("/verCrudAlumno")
	public String verCrudAlumno() {	return "intranetCrudAlumno";	}

	@GetMapping("/verCrudLibro")
	public String verCrudLibro() {	return "intranetCrudLibro";	}
	
	
	//Consulta
	@GetMapping("/verConsultaAlumno")
	public String verConsultaAlumno() {	return "intranetConsultaAlumno";	}

	@GetMapping("/verConsultaLibro")
	public String verConsultaLibro() {	return "intranetConsultaLibro";	}

	
	//Transaccion
	@GetMapping("/verPrestamoLibro")
	public String verPrestamoLibro() {	return "intranetTransaccionPrestamoLibro";	}

	@GetMapping("/verDevolucionLibro")
	public String verDevolucionLibro() {	return "intranetTransaccionDevolucionLibro";	}

}
