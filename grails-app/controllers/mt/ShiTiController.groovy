package mt



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ShiTiController {

    static responseFormats = ['json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ShiTi.list(params), [status: OK]
    }

    @Transactional
    def save(ShiTi shiTiInstance) {
        if (shiTiInstance == null) {
            render status: NOT_FOUND
            return
        }

        shiTiInstance.validate()
        if (shiTiInstance.hasErrors()) {
			println shiTiInstance.errors
            render status: NOT_ACCEPTABLE
            return
        }

        shiTiInstance.save flush:true
        respond shiTiInstance, [status: CREATED]
    }

    @Transactional
    def update(ShiTi shiTiInstance) {
        if (shiTiInstance == null) {
            render status: NOT_FOUND
            return
        }

        shiTiInstance.validate()
        if (shiTiInstance.hasErrors()) {
            render status: NOT_ACCEPTABLE
            return
        }

        shiTiInstance.save flush:true
        respond shiTiInstance, [status: OK]
    }

    @Transactional
    def delete(ShiTi shiTiInstance) {

        if (shiTiInstance == null) {
            render status: NOT_FOUND
            return
        }

        shiTiInstance.delete flush:true
        render status: NO_CONTENT
    }
}
