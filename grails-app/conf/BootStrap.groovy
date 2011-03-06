import org.comedor.*
class BootStrap {
    def springSecurityService

    def init = { servletContext ->
        log.debug "Creando Roles"
        def rolAdmin=Rol.findAllByAuthority('ROLE_ADMIN')?:new Rol(authority:'ROLE_ADMIN').save(failOnError: true)
        def rolUsuario=Rol.findAllByAuthority('ROLE_USER')?:new Rol(authority:'ROLE_USER').save(failOnError: true)
        log.debug 'Creando Usuarios'
        def userAdmin=Usuario.findByUsername('admin')
        if(!userAdmin){
            userAdmin=new Usuario(
                username:'admin',
                nombre:'Eder',
                apPaterno:'Martinez',
                apMaterno:'Torres',
                email:'edermtz.04@gmail.com',
                password:springSecurityService.encodePassword('admin') ,
                enabled:true,
                accountExpired:false,
                accountLocked:false,
                passwordExpired:false
            ).save(failOnError:true)
            def userUser=Usuario.findByUsername('user')
            if(!userUser){
                userUser=new Usuario(
                    username:'user',
                    nombre:'Aaron',
                    apPaterno:'Meza',
                    apMaterno:'Rodriguez',
                    email:'aronmeza@homail.com',
                    password:springSecurityService.encodePassword('user') ,
                    enabled:true,
                    accountExpired:false,
                    accountLocked:false,
                    passwordExpired:false
                ).save(failOnError:true)
            }
            log.debug 'Creando Roles'
            if(!userAdmin.authorities.contains(rolAdmin) ){
                UsuarioRol.create(userAdmin,rolAdmin)
            }
            if(!userUser.authorities.contains(rolUsuario) ){
                UsuarioRol.create(userUser,rolUsuario)
            }


        }
        def destroy = {
        }
    }
}