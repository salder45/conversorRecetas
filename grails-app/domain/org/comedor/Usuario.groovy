package org.comedor

class Usuario {

	String username
        String nombre
        String apPaterno
        String apMaterno
        String email
	String password
	String confirmPassword
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
            id generator:'increment'
		password column: '`password`'
	}

    static transients=["confirmPassword"]

	Set<Rol> getAuthorities() {
		UsuarioRol.findAllByUsuario(this).collect { it.rol } as Set
	}
}
