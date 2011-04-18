package org.comedor

class RecetaService {

    static transactional = true

    def serviceMethod() {

    }

    Receta convertirReceta(Receta recetaTransient){
        List<Ingrediente> ingredientesConvertidos=new ArrayList()
        log.debug "nombre $recetaTransient.nombre"
        log.debug "porciones $recetaTransient.numPorciones"
        Receta r=Receta.findByNombre(recetaTransient.nombre)
        if(r!=null){
            log.debug "Receta Existe"
            for(Ingrediente ingr:r.ingredientes){
                log.debug "Nombre $ingr.materia.nombre"
                Ingrediente ingredienteTmp=new Ingrediente()
                ingredienteTmp.properties=ingr.properties
                ingredienteTmp.id=null;
                ingredienteTmp.version=null;
                ingredienteTmp.cantidad=convierteCantidad(r.numPorciones,recetaTransient.numPorciones,ingr.cantidad);
                log.debug "cantidad Convertida $ingredienteTmp.cantidad"
                ingredientesConvertidos.add(ingredienteTmp)
            }
            recetaTransient.procedimiento=r.procedimiento
            recetaTransient.ingredientes=ingredientesConvertidos
            return recetaTransient
        }
    }

    BigDecimal convierteCantidad(BigDecimal numPorciones,BigDecimal numPorcionesAConvertir,BigDecimal cantidad){
        BigDecimal cantidadConvertida=cantidad
        cantidadConvertida=cantidadConvertida.multiply(numPorcionesAConvertir.divide(numPorciones))
        return cantidadConvertida
    }

    def listaByNombre(filtro){
        log.debug "Filtro $filtro"
        filtro = "%${filtro.toUpperCase()}%"
        def recetas=Receta.buscaPorNombre(filtro)
        def resultados = [:] as TreeMap
        for (resultado in recetas) {
            resultados[resultado.nombre] = resultado
        }
        return resultados.values()
    }
}
