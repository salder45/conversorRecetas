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
                receta.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
                redirect(action: "buscarReceta")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
                redirect(action: "ver", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "buscarReceta")
        }
    }

    def agregarIngredientes={
        log.debug "agregarIngredientes"
        log.debug "Parametros $params"
        def receta=null
        if(params.nombre!=null){
            log.debug "Busca por nombre"
            receta=Receta.findByNombre(params.nombre.toUpperCase())
        }else if(params.id!=null){
            log.debug "Busca por id"
            receta=Receta.get(params.id)
        }
        log.debug "receta = $receta"
        if(!receta){
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'receta.label', default: 'Receta'), params.id])}"
            redirect(action: "crear")            
        }else{
            return[receta:receta,ingrediente:new Ingrediente()]
        }
    }

    def agregaIngrediente={
        log.debug "agregaIngrediente"
        log.debug "Params $params"
        MateriaPrima materia=materiaPrimaService.guardaMateriaPrima(params.nombre,params.unidadMedida)
        Receta receta=Receta.get(params.idReceta)
        Ingrediente ingrediente=ingredienteService.guardaIngrediente(new BigDecimal(params.cantidad),receta,materia,params.unidadMedida)
        redirect(action:'agregarIngredientes',id:receta.id)
    }

    def capturaDatosConversor={
        log.debug "capturaDatosConversor"
        log.debug "params capturaDatosConversor$params"
    }

    def convertirReceta={
        log.debug "capturaDatosConversor"
        log.debug "Params $params"
        Receta recetaTmp=new Receta()
        recetaTmp.properties=params
        Receta recetaConvertida=recetaService.convertirReceta(recetaTmp)
        [recetaConvertida:recetaConvertida]
    }

    def capturaDatosEditar={
        log.debug "capturaDatosEditar"
        log.debug "Parametros $params"
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
    
    def agregaIngre={
        log.debug "agrega $params"
        def receta=Receta.findByNombre(params.nombre)
        log.debug "receta $receta"
        def materia=MateriaPrima.findByNombre(params.nombreMateria)
        log.debug "Materia $materia"
        Ingrediente ingrediente=new Ingrediente()
        ingrediente.properties=params
        log.debug "Ingrediente $ingrediente.cantidad"
        log.debug "Ingrediente $ingrediente.unidadMedida"
        ingrediente.materia=materia
        ingrediente.receta=receta
        ingrediente.save(flush:true)
        redirect (action:"editar",id:receta.id)
    }
}
