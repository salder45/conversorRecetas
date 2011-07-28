package org.comedor

class Ingrediente {
    BigDecimal cantidad
    Receta receta
    MateriaPrima materia
    String unidadMedida
    String presentacion

    static belongsTo=[Receta,MateriaPrima]

    static constraints = {
        cantidad scale:2, precision:8, blank:false
        unidadMedida inList:['Kilogramo','Gramo','Litro','Mililitro','Piezas']
    }
}
