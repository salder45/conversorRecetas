package org.comedor

class MateriaPrima {
    String nombre
    String unidadMedida

    static constraints = {
        nombre maxSize:64,blank:false
        unidadMedida inList:['Kilogramo','Litro']
    }
}
