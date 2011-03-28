package org.comedor

class Rol {

    String authority

    static mapping = {
        cache true
    }

    static constraints = {
        authority blank: false, unique: true
    }
    static namedQueries={
        filtradoByRol{filtro ->
            filtro="%$filtro%"
            of{
                ilike('authority',filtro)
            }
        }
    }

}
