package org.comedor

class IngredienteService {

    static transactional = true

    def serviceMethod() {

    }

    Ingrediente guardaIngrediente(BigDecimal cantidad,Receta receta,MateriaPrima materia){
        log.debug "guardaIngrediente"
        Ingrediente ingrediente=new Ingrediente()
        ingrediente.cantidad=cantidad
        ingrediente.receta=receta
        ingrediente.materia=materia
        ingrediente.save(flush:true)
        return ingrediente
    }
}
