import org.comedor.*
class BootStrap {
    def springSecurityService

    def init = { servletContext ->
        log.debug "Creando Roles"
        def rolSuper=Rol.findAllByAuthority('ROLE_SUPER')?:new Rol(authority:'ROLE_SUPER').save(failOnError: true)
        def rolAdmin=Rol.findAllByAuthority('ROLE_ADMIN')?:new Rol(authority:'ROLE_ADMIN').save(failOnError: true)
        def rolUsuario=Rol.findAllByAuthority('ROLE_USER')?:new Rol(authority:'ROLE_USER').save(failOnError: true)
        def rolCocinero=Rol.findAllByAuthority('ROLE_COCINERO')?:new Rol(authority:'ROLE_COCINERO').save(failOnError: true)
        log.debug 'Creando Usuarios'
        def superAdmin=Usuario.findByUsername('super')
        if(!superAdmin){
            superAdmin=new Usuario(
                username:'super',
                nombre:'Eder',
                apPaterno:'Martinez',
                apMaterno:'Torres',
                password:springSecurityService.encodePassword('super') ,
                enabled:true,
                accountExpired:false,
                accountLocked:false,
                passwordExpired:false
            ).save(failOnError:true)
            def userAdmin=Usuario.findByUsername('admin')
            if(!userAdmin){
                userAdmin=new Usuario(
                    username:'admin',
                    nombre:'Eder',
                    apPaterno:'Martinez',
                    apMaterno:'Torres',
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
                        password:springSecurityService.encodePassword('cocinero') ,
                        enabled:true,
                        accountExpired:false,
                        accountLocked:false,
                        passwordExpired:false
                    ).save(failOnError:true)
                }
                log.debug 'Creando Roles'
                if(!superAdmin.authorities.contains(rolSuper) ){
                    UsuarioRol.create(superAdmin,rolSuper)
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
}