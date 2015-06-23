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
	def listShiTi(YongHu yongHuInstance) {
		def dangQianYongHu = null
		if(session.uid) {
			dangQianYongHu = YongHu.get(session.uid)
		}
		
		def criteria = ShiTi.where {
			if(yongHuInstance) {
				yongHu {
					id == yongHuInstance.id
				}
			}
		}
		params.max = 1
		params.sort = "dateCreated"
		params.order = "desc"
		[shiTiInstanceList:criteria.list(params), shiTiInstanceCount:criteria.count(), yongHuInstance:yongHuInstance, dangQianYongHu:dangQianYongHu]
	}
	
	/**
	 * 实体修改(页面)
	 * @param shiTiInstance
	 */
	def editShiTi(ShiTi shiTiInstance) {
		def dangQianYongHu = null
		if(session.uid) {
			dangQianYongHu = YongHu.get(session.uid)
		}
		
		if (shiTiInstance == null) {
			render status: NOT_FOUND
			return
		}
		respond shiTiInstance, model:[dangQianYongHu:dangQianYongHu]
	}
	
	/**
	 * 空间列表
	 */
	def listKongJian(YongHu yongHuInstance) {
		def dangQianYongHu = null
		if(session.uid) {
			dangQianYongHu = YongHu.get(session.uid)
		}
		
		def criteria = KongJian.where {
			if(yongHuInstance) {
				yongHu {
					id == yongHuInstance.id
				}
			}
		}
		params.max = 1
		params.sort = "dateCreated"
		params.order = "desc"
		[kongJianInstanceList:criteria.list(params), kongJianInstanceCount:criteria.count(), yongHuInstance:yongHuInstance, dangQianYongHu:dangQianYongHu]
	}
	
	/**
	 * 空间修改
	 * @param kongJianInstance
	 */
	def editKongJian(KongJian kongJianInstance) {
		def dangQianYongHu = null
		if(session.uid) {
			dangQianYongHu = YongHu.get(session.uid)
		}
		
		if (kongJianInstance == null) {
			render status: NOT_FOUND
			return
		}
		respond kongJianInstance, model:[dangQianYongHu:dangQianYongHu]
	}
	
    def index() {
		render "受保护的"
	}

	//---------------------------------------------------------------------------------------------------
	
	/**
	 * 修改密码(服务)
	 * @param yongHuInstance 被处理用户(id:YongHu)
	 */
	@Transactional
	def miMaXiuGai(YongHu yongHuInstance, String yuanMiMa, String xinMiMa, String queRenMiMa) {
		if (yongHuInstance && yuanMiMa && xinMiMa && queRenMiMa) {
			if (xinMiMa == queRenMiMa) {//确认密码一致性
				if (yongHuInstance.miMa == yuanMiMa.encodeAsMD5()) {//原始密码验证
					yongHuInstance.miMa = xinMiMa.encodeAsMD5() //更新密码
					yongHuInstance.save(flush: true)
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
	 * @param uid 被处理用户
	 */
	@Transactional
	def touXiangShangChuan(String fileName, String uid) {
		withForm {
			def yongHuInstance = YongHu.get(uid)
			if (yongHuInstance) {
				def imagePath = "images/working/KongJian/${yongHuInstance.zhangHao}/TuPian/${fileName}"
				BufferedInputStream fileIn = new BufferedInputStream(request.getInputStream())
				byte[] buf = new byte[1024]
				File file = Helper.getFile("web-app/${imagePath}")
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
				
				yongHuInstance.touXiang = imagePath
				yongHuInstance.save(flush: true)//更新路径
				
				Helper.yaSuo(file, 180, 180)//图片压缩处理
				
				render imagePath
			} else {
				render status: NOT_FOUND, text: '用户不存在'
			}
		}.invalidToken {
			// bad request
		}
	}
	
}
