package org.comedor

class IngredienteService {

    static transactional = true

    def serviceMethod() {

    }

    Ingrediente guardaIngrediente(BigDecimal cantidad,String unidad,String materia,Receta receta,String presentacion){
        log.debug "guardaIngrediente"
        def materiaPrima=MateriaPrima.findByNombre(materia)
        log.debug "Cant: $cantidad unidad: $unidad materia: $materia"
        Ingrediente ingrediente=new Ingrediente()        
        ingrediente.cantidad=cantidad
        ingrediente.presentacion=presentacion
        ingrediente.unidadMedida=unidad
        ingrediente.materia=materiaPrima
        ingrediente.receta=receta
        ingrediente.save(flush:true)
        return ingrediente
    }   
    

    BigDecimal convierteCantidadConUnidadMedida(String unidadMedida,BigDecimal cantidad){
        if(unidadMedida.equals("Gramo")||unidadMedida.equals("Mililitro")){
            cantidad=cantidad.multiply(new BigDecimal('0.001'));
        }
        return cantidad;
    }

}
