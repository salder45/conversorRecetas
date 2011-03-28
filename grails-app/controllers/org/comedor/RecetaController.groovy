package org.comedor

class RecetaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [recetaInstanceList: Receta.list(params), recetaInstanceTotal: Receta.count()]
    }

    def create = {
        def recetaInstance = new Receta()
        recetaInstance.properties = params
        return [recetaInstance: recetaInstance]
    }

    def save = {
        def recetaInstance = new Receta(params)
        if (recetaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'receta.label', default: 'Receta'), recetaInstance.id])}"
            redirect(action: "show", id: recetaInstance.id)
        }
        else {
            render(view: "create", model: [recetaInstance: recetaInstance])
        }
    }

    def show = {
        def recetaInstance = Receta.get(params.id)
        if (!recetaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "list")
        }
        else {
            [recetaInstance: recetaInstance]
        }
    }

    def edit = {
        def recetaInstance = Receta.get(params.id)
        if (!recetaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [recetaInstance: recetaInstance]
        }
    }

    def update = {
        def recetaInstance = Receta.get(params.id)
        if (recetaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (recetaInstance.version > version) {
                    
                    recetaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'receta.label', default: 'Receta')] as Object[], "Another user has updated this Receta while you were editing")
                    render(view: "edit", model: [recetaInstance: recetaInstance])
                    return
                }
            }
            recetaInstance.properties = params
            if (!recetaInstance.hasErrors() && recetaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'receta.label', default: 'Receta'), recetaInstance.id])}"
                redirect(action: "show", id: recetaInstance.id)
            }
            else {
                render(view: "edit", model: [recetaInstance: recetaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def recetaInstance = Receta.get(params.id)
        if (recetaInstance) {
            try {
                recetaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "list")
        }
    }
}
