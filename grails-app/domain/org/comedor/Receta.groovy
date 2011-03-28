package org.comedor

class Receta {
    String nombre
    BigDecimal numPorciones;

    static hasMany=[ingredientes:Ingrediente]



    static constraints = {
        nombre maxSize:64,blank:false
        numPorciones scale:2, precision:8, blank:false

    }
}
