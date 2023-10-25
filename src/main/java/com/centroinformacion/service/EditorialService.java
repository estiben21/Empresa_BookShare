package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Editorial;


public interface EditorialService {

	public abstract Editorial insertaActualizaEditorial(Editorial obj);
	
	public abstract Optional<Editorial> buscaEditorial(int idEditorial);
//Buscar RUC
	public abstract List<Editorial> listaPorRuc(String ruc);
	
	//CONSULTA
	public abstract List<Editorial> listaPorRazonSocialLike(String filtro);
	
	//PC2 -- VALIDACIONES



	//REGISTRAR
		public abstract List<Editorial> listaPorRucIgualRegistra(String ruc);
	//ACTUALIZAR
		public abstract List<Editorial> listaPorRucIgualActualiza(String ruc, int id);

}
