package mt



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FanKuiController {

    static responseFormats = ['json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond FanKui.list(params), [status: OK]
    }

    @Transactional
    def save(FanKui fanKuiInstance) {
        if (fanKuiInstance == null) {
            render status: NOT_FOUND
            return
        }

        fanKuiInstance.validate()
        if (fanKuiInstance.hasErrors()) {
            render status: NOT_ACCEPTABLE
            return
        }

        fanKuiInstance.save flush:true
        respond fanKuiInstance, [status: CREATED]
    }

    @Transactional
    def update(FanKui fanKuiInstance) {
        if (fanKuiInstance == null) {
            render status: NOT_FOUND
            return
        }

        fanKuiInstance.validate()
        if (fanKuiInstance.hasErrors()) {
            render status: NOT_ACCEPTABLE
            return
        }

        fanKuiInstance.save flush:true
        respond fanKuiInstance, [status: OK]
    }

    @Transactional
    def delete(FanKui fanKuiInstance) {

        if (fanKuiInstance == null) {
            render status: NOT_FOUND
            return
        }

        fanKuiInstance.delete flush:true
        render status: NO_CONTENT
    }
}
