import org.comedor.*
class BootStrap {
    def springSecurityService

    def init = { servletContext ->
        log.debug "Creando Roles"
        def rolSuperAdmin=Rol.findAllByAuthority('ROLE_SUPERADMIN')?:new Rol(authority:'ROLE_SUPERADMIN').save(failOnError: true)
        def rolAdmin=Rol.findAllByAuthority('ROLE_ADMIN')?:new Rol(authority:'ROLE_ADMIN').save(failOnError: true)
        def rolUsuario=Rol.findAllByAuthority('ROLE_USER')?:new Rol(authority:'ROLE_USER').save(failOnError: true)
        def rolCocinero=Rol.findAllByAuthority('ROLE_COCINERO')?:new Rol(authority:'ROLE_COCINERO').save(failOnError: true)
        log.debug 'Creando Usuarios'
        def userSuperAdmin=Usuario.findByUsername('eder')
        if(!userSuperAdmin){
            userSuperAdmin=new Usuario(
                username:'eder',
                nombre:'Eder',
                apPaterno:'Martinez',
                apMaterno:'Torres',
                email:'edermtz.04@gmail.com',
                password:springSecurityService.encodePassword('eder') ,
                enabled:true,
                accountExpired:false,
                accountLocked:false,
                passwordExpired:false
            ).save(failOnError:true)
        }
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
            def userCocinero=Usuario.findByUsername('cocinero')
            if(!userCocinero){
                userCocinero=new Usuario(
                    username:'cocinero',
                    nombre:'C',
                    apPaterno:'C',
                    apMaterno:'C',
                    email:'aronmeza@homail.com',
                    password:springSecurityService.encodePassword('cocinero') ,
                    enabled:true,
                    accountExpired:false,
                    accountLocked:false,
                    passwordExpired:false
                ).save(failOnError:true)
            }
            log.debug 'Creando Roles'
            if(!userSuperAdmin.authorities.contains(rolSuperAdmin) ){
                UsuarioRol.create(userSuperAdmin,rolSuperAdmin)
            }
            if(!userAdmin.authorities.contains(rolAdmin) ){
                UsuarioRol.create(userAdmin,rolAdmin)
            }
            if(!userUser.authorities.contains(rolUsuario) ){
                UsuarioRol.create(userUser,rolUsuario)
            }
            if(!userCocinero.authorities.contains(rolCocinero) ){
                UsuarioRol.create(userCocinero,rolCocinero)
            }


        }
        def destroy = {
        }
    }
}