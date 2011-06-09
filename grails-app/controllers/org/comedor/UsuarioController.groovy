package org.comedor
import grails.plugins.springsecurity.Secured

//@Secured(['ROLE_ADMIN'])
class UsuarioController {
    def springSecurityService
    def usuarioService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        log.debug "Index"
        redirect(action: "lista", params: params)
    }

    //@Secured(['ROLE_SUPERADMIN'])
    def lista = {
        log.debug "Lista"
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [usuarioList: Usuario.list(params), usuarioTotal: Usuario.count()]
    }

    def crear = {
        log.debug "Crear"
        def usuario = new Usuario()
        usuario.properties = params
        return [usuario: usuario]
    }

    def guardar = {
        log.debug "Guardar"
        def usuario = new Usuario(params)
        usuario.password=springSecurityService.encodePassword(usuario.password)
        usuario.accountExpired=false
        usuario.accountLocked=false
        usuario.enabled=true
        usuario.passwordExpired=false
        if (usuario.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])}"
            redirect(action: "ver", id: usuario.id)
        }
        else {
            render(view: "crear", model: [usuario: usuario])
        }
    }

    def ver = {
        log.debug "ver"
        def usuario = Usuario.get(params.id)
        if (!usuario) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "lista")
        }
        else {
            [usuario: usuario]
        }
    }

    def editar = {
        log.debug "Editar"
        def usuario = Usuario.get(params.id)
        if (!usuario) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "lista")
        }
        else {
            return [usuario: usuario]
        }
    }

    def actualizar = {
        log.debug "Actualizar"
        def usuario = Usuario.get(params.id)
        if (usuario) {
            if (params.version) {
                def version = params.version.toLong()
                if (usuario.version > version) {
                    
                    usuario.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'usuario.label', default: 'Usuario')] as Object[], "Another user has updated this Usuario while you were editing")
                    render(view: "editar", model: [usuario: usuario])
                    return
                }
            }
            usuario.properties = params
            usuario.password=springSecurityService.encodePassword(usuario.password)
            if (!usuario.hasErrors() && usuario.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])}"
                redirect(action: "ver", id: usuario.id)
            }
            else {
                render(view: "editar", model: [usuario: usuario])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "lista")
        }
    }

    def eliminar = {
        log.debug "Eliminar"
        def usuario = Usuario.get(params.id)
        if (usuario) {
            try {
                usuario.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
                redirect(action: "lista")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
                redirect(action: "ver", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "lista")
        }
    }

    def agregaRol={
        log.debug "busqueda"
        log.debug params
    }
}
