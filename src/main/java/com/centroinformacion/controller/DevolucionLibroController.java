package com.centroinformacion.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.entity.Devolucion;
import com.centroinformacion.entity.DevolucionHasLibro;
import com.centroinformacion.entity.DevolucionHasLibroPK;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.entity.Mensaje;
import com.centroinformacion.entity.SeleccionDevolucion;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.AlumnoService;
import com.centroinformacion.service.DevolucionService;
import com.centroinformacion.service.LibroService;

import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
public class DevolucionLibroController {

	@Autowired
	private AlumnoService alumnoService;

	@Autowired
	private LibroService libroService;

	@Autowired
	private DevolucionService devolucionService;
	
	// Los productos seleccionados
	private List<SeleccionDevolucion> devolucion = new ArrayList<SeleccionDevolucion>();
	
	@RequestMapping("/listaAlumnoDevolucion")
	@ResponseBody()
	public List<Alumno> listaAlumno(String filtro) {
		int page = 0;
		int size = 5;
		Pageable pageable = PageRequest.of(page, size);
		List<Alumno> lstSalida = alumnoService.listaAlumno("%" + filtro + "%", pageable);
		return lstSalida;
	}

	@RequestMapping("listaLibroDevolucion")
	@ResponseBody()
	public List<Libro> listaLibro(String filtro) {
		int page = 0;
		int size = 5;
		Pageable pageable = PageRequest.of(page, size);
		List<Libro> lstSalida = libroService.listaLibroPrestado("%" + filtro + "%", pageable);
		return lstSalida;
	}
	

	@RequestMapping("/listaSeleccionDevolucion")
	@ResponseBody()
	public List<SeleccionDevolucion> lista() {
		return devolucion;
	}

	@RequestMapping("/agregarSeleccionDevolucion")
	@ResponseBody()
	public List<SeleccionDevolucion> agregar(SeleccionDevolucion obj) {
		devolucion.add(obj);
		return devolucion;
	}

	@RequestMapping("/eliminaSeleccionDevolucion")
	@ResponseBody()
	public List<SeleccionDevolucion> eliminar(int idLibro) {
		devolucion.removeIf(x -> x.getIdLibro() == idLibro);
		return devolucion;
	}
	
	@RequestMapping("/registraDevolucion")
	@ResponseBody()
	public Mensaje Devolucion(Alumno alumno, 
							HttpSession session ,
							@DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaDevolucion) {
		
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		Mensaje objMensaje = new Mensaje();

		List<DevolucionHasLibro> detalles = new ArrayList<DevolucionHasLibro>();
		for (SeleccionDevolucion seleccion : devolucion) {

			DevolucionHasLibroPK pk = new DevolucionHasLibroPK();
			pk.setIdLibro(seleccion.getIdLibro());
			
			DevolucionHasLibro phl = new DevolucionHasLibro();
			phl.setDevolucionHasLibroPK(pk);

			detalles.add(phl);
		}

		Devolucion obj = new Devolucion();
		obj.setFechaRegistro(new Date());
		obj.setFechaPrestamo(new Date());
		obj.setFechaDevolucion(fechaDevolucion);
		obj.setAlumno(alumno);
		obj.setUsuario(objUsuario);
		obj.setDetallesDevolucion(detalles);
		
		Devolucion objDevolucion = devolucionService.insertaDevolucion(obj);
				
		String salida = "-1";
		// Creas un SimpleDateFormat con el formato de fecha que deseas
		SimpleDateFormat sdf = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy", new Locale("es", "ES"));
		String fechaFormateada = sdf.format(fechaDevolucion);
		
		
		if (objDevolucion != null) {
			salida = "Se generó la devolucion con el código N° : " + objDevolucion.getIdDevolucion() + "<br><br>";
			salida +=	"Alumno: " + objDevolucion.getAlumno().getIdAlumno()+"<br><br>";
			salida +=	"Fecha de devolución : " + fechaFormateada +"<br><br>";
			salida +=	"<table class=\"table\"><tr><td>Codigo</td><td>Titulo</td></tr>";
			for (SeleccionDevolucion x : devolucion) {
				salida += "<tr><td>"  + x.getIdLibro() 
						+ "</td><td>" + x.getTitulo();

						
			}

			devolucion.clear();
			objMensaje.setTexto(salida);	
	}
	
	return objMensaje;
}
	}