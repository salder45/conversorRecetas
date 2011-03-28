package sistemaconversor
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_COCINERO'])
class InicioController {

    def index = {
    }
}
