package org.comedor

class MateriaPrimaService {

    static transactional = true

    def serviceMethod() {
    }

    def guardaMateria(String nombre,String unidadMedida){
        MateriaPrima materia=new MateriaPrima()
        materia.nombre=nombre
        switch(unidadMedida){
            case 'KiloGramo':
            unidadMedida='Kilogramo'
            break;
            case 'Gramos':
            unidadMedida='Kilogramo'
            break;
            case 'Litro':
            unidadMedida='Litro'
            break;
            case 'MiliLitro':
            unidadMedida='Litro'
            break;
            case 'Piezas':
            unidadMedida='Piezas'
            break;
        }
        materia.unidadMedida=unidadMedida
        materia.save(flush: true)
        return materia
    }
}
