package org.comedor

class RecetaService {

    static transactional = true

    def serviceMethod() {

    }

    Receta convierteReceta(Receta receta,BigDecimal cantidadConvertir){
        List<Ingrediente> ingredientesConvertidos=new ArrayList()
        log.debug "nombre $receta.nombre"
        log.debug "porciones $cantidadConvertir"
        Receta recetaTemporal=new Receta()
        recetaTemporal.nombre=receta.nombre
        recetaTemporal.numPorciones=receta.numPorciones
        if(receta!=null){
            for(Ingrediente ing:receta.ingredientes){
                Ingrediente ingredienteTmp=new Ingrediente()
                ingredienteTmp.properties=ing.properties
                ingredienteTmp.id=null;
                ingredienteTmp.version=null;
                ingredienteTmp.cantidad=convierteCantidad(receta.numPorciones,cantidadConvertir,ing.cantidad);
                ingredientesConvertidos.add(ingredienteTmp)
                
            }
            recetaTemporal.procedimiento=receta.procedimiento
            recetaTemporal.ingredientes=ingredientesConvertidos
        }        
       return recetaTemporal
    }
    
    BigDecimal convierteCantidad(BigDecimal numPorciones,BigDecimal numPorcionesAConvertir,BigDecimal cantidad){
        BigDecimal cantidadConvertida=cantidad
        cantidadConvertida=cantidadConvertida.multiply(numPorcionesAConvertir.divide(numPorciones))
        return cantidadConvertida
    }
        
    def listaByNombre(filtro){
        log.debug "listaByNombre $filtro"
        def recetas=Receta.buscaPorNombre(filtro)
        log.debug "Lista ${recetas.list()}"
        return recetas.list()
        }
}
