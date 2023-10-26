package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Editorial;


public interface EditorialService {
//REGISTRAR
	public abstract Editorial insertaEditorial(Editorial obj);
	//Para eliminar por ID
	public abstract Optional<Editorial> buscaEditorial(int editorial);
//Buscar RUC
	public abstract List<Editorial> listaPorRuc(String ruc);
	
	//CONSULTA
	public abstract List<Editorial> listaPorRazonSocialLike(String filtro);
	
	//ACTUALIZA
	public abstract Editorial actualizaEditorial(Editorial obj);
	
	//PC2 -- VALIDACIONES



	//REGISTRAR
		public abstract List<Editorial> listaPorRucIgualRegistra(String ruc);
	//ACTUALIZAR
	public abstract List<Editorial> listaPorRucIgualActualiza(String ruc, int id);

}
