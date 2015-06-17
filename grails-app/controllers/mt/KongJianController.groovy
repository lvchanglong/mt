package mt



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class KongJianController {

    static responseFormats = ['json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond KongJian.list(params), [status: OK]
    }

    @Transactional
    def save(KongJian kongJianInstance) {
        if (kongJianInstance == null) {
            render status: NOT_FOUND
            return
        }

        kongJianInstance.validate()
        if (kongJianInstance.hasErrors()) {
            render status: NOT_ACCEPTABLE
            return
        }

        kongJianInstance.save flush:true
        respond kongJianInstance, [status: CREATED]
    }

    @Transactional
    def update(KongJian kongJianInstance) {
        if (kongJianInstance == null) {
            render status: NOT_FOUND
            return
        }

        kongJianInstance.validate()
        if (kongJianInstance.hasErrors()) {
            render status: NOT_ACCEPTABLE
            return
        }

        kongJianInstance.save flush:true
        respond kongJianInstance, [status: OK]
    }

    @Transactional
    def delete(KongJian kongJianInstance) {

        if (kongJianInstance == null) {
            render status: NOT_FOUND
            return
        }

        kongJianInstance.delete flush:true
        render status: NO_CONTENT
    }
}
