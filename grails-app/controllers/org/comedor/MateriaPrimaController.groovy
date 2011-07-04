package org.comedor

class MateriaPrimaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def materiaPrimaService
    
    def index = {
        redirect(action: "lista", params: params)
    }

    def lista = {
        log.debug "Lista"
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [materiaList: MateriaPrima.list(params), materiaTotal: MateriaPrima.count()]
    }

    def crear = {
        log.debug "Crear "
        def materia = new MateriaPrima()
        materia.properties = params
        return [materia: materia]
    }

    def guardar = {
        log.debug "Guardar "
        def materia = new MateriaPrima(params)
        if (materia.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), materia.id])}"
            redirect(action: "ver", id: materia.id)
        }
        else {
            render(view: "crear", model: [materia: materia])
        }
    }

    def ver = {
        log.debug "Ver $params"
        def materia = MateriaPrima.get(params.id)
        if(params.nombre){
            materia=MateriaPrima.findByNombre(params.nombre)
        }
        log.debug "Ver $materia "
        if (!materia) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), params.id])}"
            redirect(action: "buscarMateriaPrima")
        }
        else {
            [materia: materia]
        }
    }

    def editar = {
        log.debug "Editar "
        log.debug "Parametros --> $params "
        def materia = MateriaPrima.get(params.id)
        if (!materia) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), params.id])}"
            redirect(action: "ver")
        }
        else {
            return [materia: materia]
        }
    }

    def actualizar = {
        log.debug "Actualizar "
        def materia = MateriaPrima.get(params.id)
        if (materia) {
            if (params.version) {
                def version = params.version.toLong()
                if (materia.version > version) {
                    
                    materia.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'materiaPrima.label', default: 'MateriaPrima')] as Object[], "Another user has updated this MateriaPrima while you were editing")
                    render(view: "editar", model: [materia: materia])
                    return
                }
            }
            materia.properties = params
            if (!materia.hasErrors() && materia.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), materia.id])}"
                redirect(action: "ver", id: materia.id)
            }
            else {
                render(view: "editar", model: [materia: materia])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), params.id])}"
            redirect(action: "buscarMateriaPrima")
        }
    }

    def eliminar = {
        log.debug "Eliminar $params"
        def materia = MateriaPrima.get(params.id)
        if (materia) {
            try {
                log.debug "try"
                materia.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), params.id])}"
                redirect(action: "buscarMateriaPrima")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                log.debug "catch"
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), params.id])}"
                redirect(action: "ver", id: params.id)
            }
        }
        else {
            log.debug "else"
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), params.id])}"
            redirect(action: "ver")
        }
    }
    
    def buscarMateriaPrima={
        log.debug "buscarMateriaPrima"        
    }


    def materiasByNombre={
        log.debug "materiasByNombre $params"
        def lista = []
        for(materia in materiaPrimaService.listaByNombre(params?.term)) {
            log.debug "Materia---!> $materia"
            lista << [id:materia.id,value:materia.nombre]
        }
        def result = lista as grails.converters.JSON
        render result
    }
}
