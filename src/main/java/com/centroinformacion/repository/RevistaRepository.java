package com.centroinformacion.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Revista;

public interface RevistaRepository extends JpaRepository<Revista, Integer>{
	public List<Revista> findByNombreIgnoreCase(String nombre);
	public List<Revista> findByNombreOrFrecuenciaIgnoreCase(String nombre,String frecuencia);
	
	@Query("select r from Revista r where r.nombre like ?1 or r.frecuencia like ?1")
	public List<Revista> listaPorNombreFrecuenciaLike(String filtro);
	
	//Consulta
		@Query("select r from Revista r where "
				+ "( r.estado = ?1)  and "
				+ "( ?2 = -1  or r.pais.idPais = ?2 ) and "
				+ "( ?3 = -1  or r.tipoRevista.idDataCatalogo = ?3 ) and "
				+ "( r.nombre like ?4 ) and"
				+ "( r.frecuencia like ?5 ) and"
				+ "( r.fechaCreacion >= ?6 ) and"
				+ "( r.fechaCreacion <= ?7 )") 
		public abstract List<Revista> listaConsultaRevista(int estado, int idPais,int idDataCatalogo,String frecuencia, String nombre, Date fecDesde, Date fecHasta);
}