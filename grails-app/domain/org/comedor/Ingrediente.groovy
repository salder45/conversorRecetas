package org.comedor

class Ingrediente {
    BigDecimal cantidad
    Receta receta
    MateriaPrima materia
    String unidadMedida

    static belongsTo=[Receta,MateriaPrima]

    static transients=['unidadMedida']

    static constraints = {
        cantidad scale:2, precision:8, blank:false
        unidadMedida inList:['KiloGramo','Gramos','Litro','MiliLitro','Piezas'],blank:false
    }
}
