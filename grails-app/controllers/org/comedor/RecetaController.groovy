package org.comedor

class RecetaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def ingredienteService
    def materiaPrimaService
    def recetaService

    def index = {
        
        log.debug "index"
        log.debug "parametros index $params"
        
        //redirect(action: "lista", params: params)
    }

    def lista = {        
        log.debug "lista"
        log.debug "parametros lista $params"
         
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [recetaList: Receta.list(params), recetaTotal: Receta.count()]
    }

    def crear = {
        
        log.debug "crear"
        log.debug "parametros crear $params"
         
        def receta = new Receta()
        receta.properties = params
        return [receta: receta]
    }

    def guardar = {
        
        log.debug "guardar"
        log.debug "parametros guardar $params"
         
        def receta = new Receta(params)
        //receta.nombre=params.nombre.toUpperCase()
        if (receta.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'receta.label', default: 'Receta'), receta.id])}"
            redirect(action: "ver", id: receta.id)
        }
        else {
            render(view: "crear", model: [receta: receta])
        }
    }

    def ver = {
        
        log.debug "ver"
        log.debug "parametros ver $params"
         
        def receta = Receta.get(params.id)
        if(params.nombre){
            receta=Receta.findByNombre(params.nombre)            
        }
        if (!receta) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "buscarReceta")
        }
        else {
            [receta: receta]
        }
    }

    def editar = {
        
        log.debug "editar"
        log.debug "parametros editar $params"
         
        def receta = Receta.get(params.id)
        if (!receta) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "buscarReceta")
        }
        else {
            return [receta: receta,ingrediente:new Ingrediente()]
        }
    }

    def actualizar = {
        
        log.debug "actualizar"
        log.debug "parametros actualizar $params"
         
        def receta = Receta.get(params.id)
        if (receta) {
            if (params.version) {
                def version = params.version.toLong()
                if (receta.version > version) {
                    
                    receta.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'receta.label', default: 'Receta')] as Object[], "Another user has updated this Receta while you were editing")
                    render(view: "ver", model: [receta: receta])
                    return
                }
            }
            receta.properties = params
            if (!receta.hasErrors() && receta.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'receta.label', default: 'Receta'), receta.id])}"
                log.debug "------------------->$receta.nombre"
                redirect(action: "ver", id:receta.id)
            }
            else {
                log.debug "------>145"
                render(view: "editar", model: [receta: receta])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "buscarReceta")
        }
    }
    
    def eliminar= {
        
        log.debug "eliminar"
        log.debug "parametros eliminar $params"
         
        def receta = Receta.get(params.id)
        if (receta) {
            try {
                for(Ingrediente ingrediente:receta.ingredientes){
                    log.debug "ingrediente: $ingrediente"
                    ingrediente.delete()                    
                }
                receta.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
                redirect(action: "buscarReceta")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                log.debug "error de integridad"
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
                redirect(action: "ver", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "buscarReceta")
        }
    }
    
    def recetasByNombre={
        
        log.debug "Recetas Busqueda por nombre $params"
         
        def lista = []        
        for(receta in recetaService.listaByNombre(params?.term)) {
            log.debug "Receta---!> $receta"
            lista << [id:receta.id,value:receta.nombre]
        }
        def result = lista as grails.converters.JSON
        render result
    }
    
    def buscarReceta={
        
        log.debug "BuscarRecetas"
        log.debug "$params"
         
        def receta=new Receta()
    }
    
    def agregaIngrediente={
        log.debug "Agrega Ingredientes parametros ---->$params"
        def receta=Receta.get(params.id)
        ingredienteService.guardaIngrediente(new BigDecimal(params.cantidad),params.unidadMedida,params.nombreMateria,receta)
        redirect (action:"editar",id:receta.id)
    }
    
    def datosConversion={
        log.debug "datosConversion"
        log.debug "Paramtros: $params"
    }
    
    def convertir={
        log.debug "convertir"
        log.debug "Paramtros: $params"
    }
}
