package com.centroinformacion.repository;
/**
 * 
 * @author Leslie Marlo
 */

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Editorial;




public interface EditorialRepository extends JpaRepository<Editorial, Integer>{
	//ignorar mayusculas/minusculas
	public List<Editorial> findByRucIgnoreCase(String ruc);
	
	//consultar ------------------ ?1 = UN PARAMETRO 
	@Query("select p from Editorial p where p.razonSocial LIKE %?1%") //JPQL, se hace con tablas/clases/atributos
	public List<Editorial> listaPorRazonSocialLike(String filtro);
	
	
	//PC2 --VALIDACION RUC
	//VALIDACION REGISTRAR
		@Query("select x from Editorial x where x.ruc = ?1")
		public List<Editorial> listaPorRucIgualRegistra(String ruc);
		
		// VALIDACION ACTUALIZAR
		@Query("select x from Editorial x where x.ruc like ?1 and x.idEditorial !=?2")
		public List<Editorial> listaPorRucIgualActualiza(String ruc,int id);
		
		//Consulta--PC3
		@Query("select e from Editorial e where "
		        + "(e.estado = ?1) and "
		        + "(?2 = -1 or e.pais.idPais = ?2) and "
		        + "(e.razonSocial like ?3) and "
		        + "(e.direccion like ?4) and "
		        + "(e.ruc like ?5) and "
		        + "(e.fechaCreacion >= ?6) and "
		        + "(e.fechaCreacion <= ?7)")
		public abstract List<Editorial> listaConsultaEditorial(int estado, int idPais, String razonSocial, String direccion, String ruc, Date fecDesde, Date fecHasta);


}
