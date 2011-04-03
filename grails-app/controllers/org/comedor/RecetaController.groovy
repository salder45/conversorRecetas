package org.comedor

class RecetaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def recetaService
    def ingredienteService
    def materiaPrimaService

    def index = {
        redirect(action: "crear", params: params)
    }

    def lista = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [recetaList: Receta.list(params), recetaTotal: Receta.count()]
    }

    def crear = {
        def receta = new Receta()
        receta.properties = params
        return [receta: receta]
    }

    def guardar = {
        def receta = new Receta(params)
        if (receta.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'receta.label', default: 'Receta'), receta.id])}"
            redirect(action: "agregarIngredientes", id: receta.id)
        }
        else {
            render(view: "crear", model: [receta: receta])
        }
    }

    def editar = {
        def receta = Receta.get(params.id)
        if (!receta) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "lista")
        }
        else {
            return [receta: receta]
        }
    }

    def actualizar = {
        def receta = Receta.get(params.id)
        if (receta) {
            if (params.version) {
                def version = params.version.toLong()
                if (receta.version > version) {
                    
                    receta.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'receta.label', default: 'Receta')] as Object[], "Another user has updated this Receta while you were editing")
                    render(view: "editar", model: [receta: receta])
                    return
                }
            }
            receta.properties = params
            if (!receta.hasErrors() && receta.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'receta.label', default: 'Receta'), receta.id])}"
                redirect(action: "edit", id: receta.id)
            }
            else {
                render(view: "editar", model: [receta: receta])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "lista")
        }
    }

    def eliminar = {
        def receta = Receta.get(params.id)
        if (receta) {
            try {
                receta.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
                redirect(action: "lista")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
                redirect(action: "editar", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "lista")
        }
    }

    def agregarIngredientes={
        log.debug 'agregarIngredientes'
        log.debug params
        def receta = Receta.get(params.id)
        if (!receta) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "crear")
        }
        else {
            [receta: receta,ingrediente:new Ingrediente()]
        }
    }

    def addIngrediente={
        log.debug 'addIngrediente'
        def receta = Receta.get(params.idReceta)
        log.debug receta
        log.debug params
        if(!receta){
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "crear")
        }else{
            def materia=MateriaPrima.findByNombre(params.nombre)
            if(!materia){
            materia=materiaPrimaService.guardaMateria(params.nombre,params.unidadMedida)
            }
            ingredienteService.guardaIngrediente(receta,materia,new BigDecimal(params.cantidad),params.unidadMedida)
            redirect(action: "agregarIngredientes",id:receta.id)
        }
    }
}
