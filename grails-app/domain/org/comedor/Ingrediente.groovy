package org.comedor

class Ingrediente {
    BigDecimal cantidad
    String descripcion
    Receta receta
    MateriaPrima materia

    static belongsTo=[Receta,MateriaPrima]


    static constraints = {
        cantidad scale:2, precision:8, blank:false
        descripcion maxSize:64,blank:false
    }
}
