package org.comedor

class RecetaService {

    static transactional = true

    def serviceMethod() {

    }    

    def listaByNombre(filtro){
        log.debug "listaByNombre $filtro"
        def recetas=Receta.buscaPorNombre(filtro)
        log.debug "Lista ${recetas.list()}"
        return recetas.list()
        }
}
