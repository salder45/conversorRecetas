package org.comedor

class IngredienteService {

    static transactional = true

    def serviceMethod() {

    }

    def guardaIngrediente(Receta receta,MateriaPrima materia ,BigDecimal cantidad,String unidadMedida){
        def ingrediente=new Ingrediente()

        switch(unidadMedida){
            case 'KiloGramo':
            //no hace nada
            break;
            case 'Gramos':
            cantidad=cantidad.multiply(new BigDecimal('0.001'))
            break;
            case 'Litro':
            //no hace nada
            break;
            case 'MiliLitro':
            cantidad=cantidad.multiply(new BigDecimal('0.001'))
            break;
            case 'Piezas':
            //no hace nada
            break;
        }
        ingrediente.cantidad=cantidad
        ingrediente.materia=materia
        ingrediente.receta=receta
        ingrediente.save(flush:true)
    }

}
