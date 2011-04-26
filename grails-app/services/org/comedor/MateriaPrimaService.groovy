package org.comedor

class MateriaPrimaService {

    static transactional = true

    def serviceMethod() {

    }

    MateriaPrima guardaMateriaPrima(String nombre,String unidadMedida){
        log.debug "guardaMateriaPrima"
        MateriaPrima materia=MateriaPrima.findByNombre(nombre)
        if(!materia){
            log.debug "materia nula"
            materia=new MateriaPrima()
            materia.nombre=nombre.toUpperCase()
            materia.unidadMedida=convierteStringUnidadMedida(unidadMedida)
            materia.save(flush:true)
        }        
        return materia
    }

    String convierteStringUnidadMedida(String unidadMedida){
        if(unidadMedida.equals('Gramo')){
        unidadMedida='Kilogramo'
        }else if(unidadMedida.equals('Mililitro')){
        unidadMedida='Litro'
        }
        return unidadMedida
    }

    def listaByNombre(filtro){
        log.debug "listaByNombre $filtro"
        def materias=MateriaPrima.buscaPorNombre(filtro)
        log.debug "Lista ${materias.list()}"
        return materias.list()
        }
}
