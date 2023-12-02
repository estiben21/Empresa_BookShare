package com.centroinformacion.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Autor;

public interface AutorService {
	
	public abstract List<Autor> listaPorTelefono(String telefono);
	public abstract Autor registraAutor(Autor obj);
	public abstract List<Autor> listPorNombreYApellidoLike(String filtro);
	public abstract Autor actualizaAutor(Autor obj);
	public abstract Optional<Autor> buscaAutor(int id);
	public abstract List<Autor> listaPorNombreApellidoIgualActualiza(String nombres, String apellidos,int id);
	public abstract List<Autor> listaPorNombreApellidoIgual(String nombres, String apellidos);
	public abstract List<Autor> listaPorTelefonoIgual(String telefono, int idAutor);

	//consultas
		public abstract List<Autor> listaConsultaAutor(int estado, int idPais,int idGrado, String nomApe,String telefono, Date fecDesde, Date fecHasta);
	
		//PC4
		public abstract List<Autor> listaAutor();

}
