package mt

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional;

/**
 * 受保护方法，需登录
 */
class ProtectedController {
	
	static defaultAction = "index"
	
	/**
	 * 实体列表(页面)
	 */
	def listShiTi() {
		def dangQianYongHu = YongHu.get(session.uid)
		
		def criteria = ShiTi.where {
			if(dangQianYongHu) {
				yongHu {
					id == dangQianYongHu.id
				}
			}
		}
		params.max = 1
		params.sort = "id"
		params.order = "desc"
		[shiTiInstanceList:criteria.list(params), shiTiInstanceCount:criteria.count(), dangQianYongHu:dangQianYongHu]
	}
	
	/**
	 * 实体修改(页面)
	 * @param shiTiInstance
	 */
	def editShiTi(ShiTi shiTiInstance) {
		def dangQianYongHu = YongHu.get(session.uid)
		
		if (shiTiInstance == null) {
			render status: NOT_FOUND
			return
		}
		respond shiTiInstance, model:[dangQianYongHu:dangQianYongHu]
	}
	
	/**
	 * 空间列表(页面)
	 */
	def listKongJian() {
		def dangQianYongHu = YongHu.get(session.uid)
		
		def criteria = KongJian.where {
			if(dangQianYongHu) {
				yongHu {
					id == dangQianYongHu.id
				}
			}
		}
		params.max = 1
		params.sort = "id"
		params.order = "desc"
		[kongJianInstanceList:criteria.list(params), kongJianInstanceCount:criteria.count(), dangQianYongHu:dangQianYongHu]
	}
	
	/**
	 * 空间修改(页面)
	 * @param kongJianInstance
	 */
	def editKongJian(KongJian kongJianInstance) {
		def dangQianYongHu = YongHu.get(session.uid)
		
		if (kongJianInstance == null) {
			render status: NOT_FOUND
			return
		}
		respond kongJianInstance, model:[dangQianYongHu:dangQianYongHu]
	}
	
	/**
	 * 酱油
	 */
    def index() {
		render "受保护的"
	}

	//---------------------------------------------------------------------------------------------------
	
	/**
	 * 修改密码(服务)
	 */
	@Transactional
	def miMaXiuGai(String yuanMiMa, String xinMiMa, String queRenMiMa) {
		def dangQianYongHu = YongHu.get(session.uid)
		if (dangQianYongHu && yuanMiMa && xinMiMa && queRenMiMa) {
			if (xinMiMa == queRenMiMa) {//确认密码一致性
				def md5 = (dangQianYongHu.xingMing + yuanMiMa).encodeAsMD5()
				if (dangQianYongHu.miMa == md5) {//原始密码验证
					dangQianYongHu.miMa = (dangQianYongHu.xingMing + xinMiMa).encodeAsMD5() //更新密码
					dangQianYongHu.save(flush: true)
					render status: OK, text: "修改成功"
					return
				}
				render status: UNAUTHORIZED, text: "原密码有误"
				return
			}
			render status: NOT_ACCEPTABLE, text: "新密码不一致"
			return
		}
		render status: BAD_REQUEST, text: "请求不合法 "
	}
	
	/**
	 * 头像上传(服务)
	 */
	@Transactional
	def touXiangShangChuan(String fileName) {
		withForm {
			def dangQianYongHu = YongHu.get(session.uid)
			if (dangQianYongHu) {
				String realPath = servletContext.getRealPath("/")
				def imagePath = realPath + "images/userData/${dangQianYongHu.xingMing}/${fileName}"
				File file = Helper.getFile(imagePath)
				
				BufferedInputStream fileIn = new BufferedInputStream(request.getInputStream())
				byte[] buf = new byte[1024]
				BufferedOutputStream fileOut = new BufferedOutputStream(new FileOutputStream(file))
				while (true) {
				   int bytesIn = fileIn.read(buf, 0, 1024)
				   if (bytesIn == -1) {
					  break
				   } else {
					  fileOut.write(buf, 0, bytesIn)
				   }
				}
				fileOut.flush()
				fileOut.close()
				
//				Helper.yaSuo(file, 180, 180)//图片压缩处理
				
				dangQianYongHu.touXiang = file.getBytes()
				dangQianYongHu.save(flush: true)//更新路径
				
				render status: OK
			} else {
				render status: NOT_FOUND, text: '用户不存在'
			}
		}.invalidToken {
			// bad request
		}
	}
	
}
