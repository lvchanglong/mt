import mt.YongHu

class BootStrap {

    def init = { servletContext ->
		YongHu.sheZhiGuanLiYuan()
    }
    
	def destroy = {
    }
	
}
