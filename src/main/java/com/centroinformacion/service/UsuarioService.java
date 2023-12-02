package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Opcion;
import com.centroinformacion.entity.Rol;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.entity.UsuarioHasRol;
import com.centroinformacion.entity.UsuarioHasRolPK;

public interface UsuarioService {

	public abstract Usuario login(Usuario bean);

	public abstract List<Opcion> traerEnlacesDeUsuario(int idUsuario);

	public abstract Usuario buscaPorLogin(String login);
	
	/*______________________ PC4 _______________________*/
	public abstract List<Usuario> listaUsuario(); //listar Usuarios
	public abstract List<Rol> traerRolesDeUsuario(int idUsuario); // busca por idUsuario los roles del usario
	public abstract Optional<UsuarioHasRol> buscaRol(UsuarioHasRolPK obj); //para validar los roles del usuario
	public abstract UsuarioHasRol insertaRol(UsuarioHasRol obj); //insertar rol al usuario
	public abstract void eliminaRol(UsuarioHasRol obj); //eliminar rol del usuario
}
