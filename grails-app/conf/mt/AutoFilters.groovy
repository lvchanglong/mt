package mt

import static org.springframework.http.HttpStatus.*

class AutoFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
				if(!session.uname) { //姓名
					session.uname = ChineseName.getInst()
				}
				if(!session.uinfo) { //简介
					session.uinfo = Story.getInst()
				}
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
		
		autoProtected(controller:'protected', action:'*') {
			before = {
				if(!session.uid) {
					redirect(url:"/")
					return
				}
			}
		}
	
		autoPrivate(controller:'private', action:'*') {
			before = {
				if(!session.uid) {
					redirect(url:"/")
					return
				}
				if(!YongHu.get(session.uid).shiFouGuanLiYuan()) {
					render status: UNAUTHORIZED, text:"未授权，非管理员"
					return
				}
			}
		}

    }
}
