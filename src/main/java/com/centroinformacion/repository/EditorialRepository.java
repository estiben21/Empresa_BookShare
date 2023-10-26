package com.centroinformacion.repository;
/**
 * 
 * @author Leslie Marlo
 */

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
		@Query("select x from Editorial x where x.ruc = ?1 and x.idEditorial !=?2")
		public List<Editorial> listaPorRucIgualActualiza(String ruc,int id);

}
