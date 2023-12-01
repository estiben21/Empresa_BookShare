package com.centroinformacion.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Rol;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.entity.UsuarioHasRol;
import com.centroinformacion.entity.UsuarioHasRolPK;
import com.centroinformacion.service.RolService;
import com.centroinformacion.service.UsuarioService;

@Controller
public class UsuarioTransaccionController {
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private RolService rolService;
	
	@RequestMapping("/listaUser")
	@ResponseBody()
	public List<Usuario> listarUsuarios(){
		return usuarioService.listaUsuario();
	}
	
	@RequestMapping("/listaRol")
	@ResponseBody()
	public List<Rol> listarRoles(){
		return rolService.listaRol();
	}
	
	@ResponseBody()
	@RequestMapping("/listaRolPorUsuario")
	public List<Rol> listaRolXUsuario(int idUsuario){
		return usuarioService.traerRolesDeUsuario(idUsuario); 
	}
	
	@ResponseBody()
	@PostMapping("/registraRol")
	public  HashMap<String, Object> registro(int idUsuario, int idRol){ //HashMap<?, ?> -- ? significa que retornarà cualquier tipo de dato
		HashMap<String, Object> maps = new HashMap<>();
		//------------> recibe todos los datos enviados como "data" desde el formulario del .jsp
		
		//CREA EL OBJETO
		UsuarioHasRolPK pk = new UsuarioHasRolPK();
		pk.setIdRol(idRol);
		pk.setIdUsuario(idUsuario);
		
		//VALIDAR PARA REGISTRAR
		UsuarioHasRol usp = new UsuarioHasRol();
		usp.setUsuarioHasRolPk(pk);
		
		if (usuarioService.buscaRol(pk).isPresent()) {
			maps.put("mensaje", "El usuario ya cuenta con ese rol");
		}else {
			UsuarioHasRol objUsp = usuarioService.insertaRol(usp);
			if (objUsp == null) {
				maps.put("mensaje", "Error en el registro");
			}
			else {
				maps.put("mensaje", "Registro existoso");
			}
		}
		List<Rol> lstSalida = usuarioService.traerRolesDeUsuario(idUsuario);
		maps.put("lista", lstSalida);
		maps.put("usuario", idUsuario);
		return maps;
	}
	
	@ResponseBody()
	@PostMapping("/eliminaRol")
	public  HashMap<String, Object> accionEliminar(int idUsuario, int idRol){ 
		HashMap<String, Object> maps = new HashMap<>();
		//------------> recibe todos los datos enviados como "data" desde el formulario del .jsp
		
		//CREA EL OBJETO
		UsuarioHasRolPK pk = new UsuarioHasRolPK();
		pk.setIdRol(idRol);
		pk.setIdUsuario(idUsuario);
		
		//VALIDAR PARA ELIMINAR
		UsuarioHasRol usp = new UsuarioHasRol();
		usp.setUsuarioHasRolPk(pk);
		
		if (usuarioService.buscaRol(pk).isPresent()) {
			usuarioService.eliminaRol(usp);
			maps.put("mensaje", "Eliminación de rol existosa");		
		}else {
			maps.put("mensaje", "No existe rol");
		}
		List<Rol> lstSalida = usuarioService.traerRolesDeUsuario(idUsuario);
		maps.put("lista", lstSalida);
		maps.put("usuario", idUsuario);
		return maps;
	}
}
