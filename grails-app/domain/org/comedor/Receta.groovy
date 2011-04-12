package org.comedor

class Receta {
    String nombre
    String procedimiento
    BigDecimal numPorciones;
    

    static hasMany=[ingredientes:Ingrediente]



    static constraints = {
        nombre maxSize:64,blank:false,unique:true
        procedimiento maxSize:512,blank:false
        numPorciones scale:2, precision:8, blank:false
    }
}
