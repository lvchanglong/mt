package mt



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ZhuanTiController {

    static responseFormats = ['json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ZhuanTi.list(params), [status: OK]
    }

    @Transactional
    def save(ZhuanTi zhuanTiInstance) {
        if (zhuanTiInstance == null) {
            render status: NOT_FOUND
            return
        }

        zhuanTiInstance.validate()
        if (zhuanTiInstance.hasErrors()) {
            render status: NOT_ACCEPTABLE
            return
        }

        zhuanTiInstance.save flush:true
        respond zhuanTiInstance, [status: CREATED]
    }

    @Transactional
    def update(ZhuanTi zhuanTiInstance) {
        if (zhuanTiInstance == null) {
            render status: NOT_FOUND
            return
        }

        zhuanTiInstance.validate()
        if (zhuanTiInstance.hasErrors()) {
            render status: NOT_ACCEPTABLE
            return
        }

        zhuanTiInstance.save flush:true
        respond zhuanTiInstance, [status: OK]
    }

    @Transactional
    def delete(ZhuanTi zhuanTiInstance) {

        if (zhuanTiInstance == null) {
            render status: NOT_FOUND
            return
        }

        zhuanTiInstance.delete flush:true
        render status: NO_CONTENT
    }
}
