package mt



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class YongHuController {

    static responseFormats = ['json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond YongHu.list(params), [status: OK]
    }

    @Transactional
    def save(YongHu yongHuInstance) {
        if (yongHuInstance == null) {
            render status: NOT_FOUND
            return
        }

        yongHuInstance.validate()
        if (yongHuInstance.hasErrors()) {
            render status: NOT_ACCEPTABLE
            return
        }

        yongHuInstance.save flush:true
        respond yongHuInstance, [status: CREATED]
    }

    @Transactional
    def update(YongHu yongHuInstance) {
        if (yongHuInstance == null) {
            render status: NOT_FOUND
            return
        }

        yongHuInstance.validate()
        if (yongHuInstance.hasErrors()) {
            render status: NOT_ACCEPTABLE
            return
        }

        yongHuInstance.save flush:true
        respond yongHuInstance, [status: OK]
    }

    @Transactional
    def delete(YongHu yongHuInstance) {

        if (yongHuInstance == null) {
            render status: NOT_FOUND
            return
        }

        yongHuInstance.delete flush:true
        render status: NO_CONTENT
    }
}
