package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Sala;

public interface SalaRepository extends JpaRepository<Sala, Integer>{

	public List<Sala> findByNumero(String numero);
	
	@Query("select n from Sala n where n.numero like ?1")
	public List<Sala> listPorNumerolike(String filtro);

	
	@Query("select x from Sala x where x.numero = ?1")
	public List<Sala> listaPorNumeroIgualRegistra(String numero);
	
	@Query("select x from Sala x where x.numero = ?1")
	public List<Sala> listaPorNumeroIgualActualiza(String numero);

	@Query("select x from Sala x where x.numero = ?1 and x.idSala != ?2 ")

	public List<Sala> listaPorNumeroIgualActualiza(String numero, int id);
	@Query("select e from Sala e where "
	        + "(e.estado = ?1) and "
	        + "(e.numero like ?2) and "
	        + "(e.piso like ?3) and "
	        + "(?4=-1 or e.numAlumnos= ?4) and "
	        + "(e.recursos like ?5) and "
	        + "(?6=-1 or e.sede.idDataCatalogo = ?6) and "
	        + "(?7=-1 or e.tipoSala.idDataCatalogo = ?7)")
	        
	public abstract List<Sala> listaConsultaSala(int estado, String numero,int piso,int numAlumnos,String recursos,int idSede, int idTipoSala
	);


}
