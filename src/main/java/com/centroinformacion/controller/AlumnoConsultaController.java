package com.centroinformacion.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.service.AlumnoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.apachecommons.CommonsLog;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

@Controller
@CommonsLog
public class AlumnoConsultaController {
	@Autowired
	private AlumnoService alumnoService;
	
	@ResponseBody
	@GetMapping(value = "/consultaAlumno")
	public List<Alumno> consultaAlumno (String nomApellido, 
										int estado, 
										String telefono, 
										String dni, 
										String correo, 
										@DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaNacDesde, 
										@DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaNacHasta,  
										int idModalidad)
	{
		List<Alumno> lstSalida = alumnoService.listaAlumnosPorFiltroConsulta("%"+nomApellido+"%", estado, "%"+telefono+"%", "%"+dni+"%", "%"+correo+"%", 
															fechaNacDesde, fechaNacHasta, idModalidad);
		return lstSalida;
		
	}
	
	@GetMapping("/reporteAlumnosPdf")
	//request - variable para enviar paràmetros
	//response - variable para recibir paràmetros
	public void reportes(HttpServletRequest request,
						HttpServletResponse response,
						String paramNomApe,
						boolean paramEstado,
						String paramTelefono,
						String paramDni,
						String paramCorreo,
						int paramModalidad,
						@DateTimeFormat(pattern = "yyyy-MM-dd") Date paramFechaNacDesde,
						@DateTimeFormat(pattern = "yyyy-MM-dd") Date paramFechaNacHasta
						){
							
		try  {
		//PASO 1: Obtener el dataSource que va generar el reporte
		List<Alumno> lstSalida = alumnoService.listaAlumnosPorFiltroConsulta("%"+paramNomApe+"%", paramEstado ?1:0, "%"+paramTelefono+"%", 
																			"%"+paramDni+"%", "%"+paramCorreo+"%", paramFechaNacDesde, 
																			paramFechaNacHasta, paramModalidad);
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(lstSalida);
		
		//PASO 2: Obtener el archivo que contiene el diseño del reporte
			String fileDirectory = request.getServletContext().getRealPath("/WEB-INF/reportes/ReporteAlumnos.jasper"); 
			log.info(">>> File >> " + fileDirectory);
			
			//enmascarar para convertirlo en bits
			FileInputStream stream = new FileInputStream(new File(fileDirectory));
				
		//PASO 3: Parametros adicionales
			String fileLogo = request.getServletContext().getRealPath("/WEB-INF/img/alumno.jpeg");
			log.info(">>> File Logo >> " + fileLogo);
				
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("RUTA_LOGO", fileLogo);
			
		//PASO 4: Enviamos dataSource, diseño y parámetros para generar el PDF
			JasperReport jasperReport = (JasperReport) JRLoader.loadObject(stream);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
			
		//PASO 5: Enviar el PDF generado
	  		response.setContentType("application/x-pdf");
	  	    response.addHeader("Content-disposition", "attachment; filename=ReporteAlumnos.pdf");

	  		OutputStream outStream = response.getOutputStream();
	  		JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
	  		
	  		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
