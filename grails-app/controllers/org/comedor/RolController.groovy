package org.comedor

class RolController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        log.debug "Index"
        redirect(action: "lista", params: params)
    }

    def lista = {
        log.debug "Lista"
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [rolList: Rol.list(params), rolTotal: Rol.count()]
    }

    def crear = {
        log.debug "Crear"
        def rol = new Rol()
        rol.properties = params
        return [rol: rol]
    }

    def guardar = {
        log.debug "Guardar"
        def rol = new Rol(params)
        if (rol.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'rol.label', default: 'Rol'), rol.id])}"
            redirect(action: "ver", id: rol.id)
        }
        else {
            render(view: "crear", model: [rol: rol])
        }
    }

    def ver = {
        log.debug "Ver"
        def rol = Rol.get(params.id)
        if (!rol) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rol.label', default: 'Rol'), params.id])}"
            redirect(action: "lista")
        }
        else {
            [rol: rol]
        }
    }

    def editar = {
        log.debug "editar"
        def rol = Rol.get(params.id)
        if (!rol) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rol.label', default: 'Rol'), params.id])}"
            redirect(action: "lista")
        }
        else {
            return [rol: rol]
        }
    }

    def actualizar= {
        log.debug "actualizar"
        def rol = Rol.get(params.id)
        if (rol) {
            if (params.version) {
                def version = params.version.toLong()
                if (rol.version > version) {
                    
                    rol.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'rol.label', default: 'Rol')] as Object[], "Another user has updated this Rol while you were editing")
                    render(view: "editar", model: [rol: rol])
                    return
                }
            }
            rol.properties = params
            if (!rol.hasErrors() && rol.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'rol.label', default: 'Rol'), rol.id])}"
                redirect(action: "ver", id: rol.id)
            }
            else {
                render(view: "editar", model: [rol: rol])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rol.label', default: 'Rol'), params.id])}"
            redirect(action: "lista")
        }
    }

    def eliminar = {
        log.debug "eliminar"
        def rol = Rol.get(params.id)
        if (rol) {
            try {
                rol.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'rol.label', default: 'Rol'), params.id])}"
                redirect(action: "lista")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'rol.label', default: 'Rol'), params.id])}"
                redirect(action: "ver", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rol.label', default: 'Rol'), params.id])}"
            redirect(action: "lista")
        }
    }
}
