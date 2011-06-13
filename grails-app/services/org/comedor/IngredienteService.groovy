package org.comedor

class IngredienteService {

    static transactional = true

    def serviceMethod() {

    }

    Ingrediente guardaIngrediente(BigDecimal cantidad,Receta receta,MateriaPrima materia,String unidad){
        log.debug "guardaIngrediente"
        Ingrediente ingrediente=new Ingrediente()
        ingrediente.cantidad=cantidad
        ingrediente.receta=receta
        ingrediente.materia=materia
        ingrediente.unidadMedida=unidad
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
