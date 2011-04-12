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
            materia.nombre=nombre
            materia.unidadMedida=unidadMedida
            materia.save(flush:true)
        }        
        return materia
    }
}
