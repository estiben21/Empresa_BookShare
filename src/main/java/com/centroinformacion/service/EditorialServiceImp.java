package com.centroinformacion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Editorial;
import com.centroinformacion.repository.EditorialRepository;


@Service
public class EditorialServiceImp implements EditorialService {

	@Autowired	
	private EditorialRepository repository;

	@Override
	public Editorial insertaActualizaEditorial(Editorial obj) {
		return repository.save(obj);
	}

	//listar RUC
	@Override
	public List<Editorial> listaPorRuc(String ruc){
		return repository.findByRucIgnoreCase(ruc);
	}

	@Override
	public List<Editorial> listaPorRazonSocialLike(String filtro) {
		return repository.listaPorRazonSocialLike(filtro);
	}

	@Override
	public List<Editorial> listaPorRucIgualRegistra(String ruc) {
		return repository.listaPorRucIgualRegistra(ruc);
	}

	@Override
	public List<Editorial> listaPorRucIgualActualiza(String ruc, int id) {
		return repository.listaPorRucIgualActualiza(ruc,id);
	}
	
}
