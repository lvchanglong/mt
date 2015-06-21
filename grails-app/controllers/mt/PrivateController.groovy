package mt

/**
 * 私有方法，需登录，管理员
 */
class PrivateController {

	static defaultAction = "index"
	
    def index() {
		render "私有的"
	}
	
	//---------------------------------------------------------------------------------------------------
	
}
