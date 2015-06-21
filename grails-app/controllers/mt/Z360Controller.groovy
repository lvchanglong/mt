package mt

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional;

/**
 * 系统前台页面（服务，全方位）
 * @author lvchanglong
 *
 */
class Z360Controller {

	static defaultAction = "index" //默认方法
	
	/**
	 * 测试
	 */
	def test() {
		
	}
	
	def ajaxTest() {
		render status: BAD_REQUEST, text:"请求不合法！！！！！"
	}
	
	/**
	 * 网站首页
	 */
	def index() {
		params.max = 1
		params.sort = "dateCreated"
		params.order = "desc"
		[shiTiInstanceList:ShiTi.list(params), shiTiInstanceCount:ShiTi.count()]
	}
	
	/**
	 * 个人管理
	 * @param yongHuInstance 被处理用户(id:YongHu)
	 */
	def geRenGuanLi(YongHu yongHuInstance) {
		if (!yongHuInstance) {
			render status: NOT_FOUND
			return
		}
		
		[yongHuInstance: yongHuInstance]
	}
	
	/**
	 * 实体列表
	 */
	def listShiTi(YongHu yongHuInstance) {
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
		[shiTiInstanceList:criteria.list(params), shiTiInstanceCount:criteria.count(), yongHuInstance:yongHuInstance]
	}
	
	/**
	 * 实体详情
	 * @param shiTiInstance
	 */
	def showShiTi(ShiTi shiTiInstance) {
		if (shiTiInstance == null) {
			render status: NOT_FOUND
			return
		}
		respond shiTiInstance
	}
	
	/**
	 * 实体修改
	 * @param shiTiInstance
	 */
	def editShiTi(ShiTi shiTiInstance) {
		if (shiTiInstance == null) {
			render status: NOT_FOUND
			return
		}
		respond shiTiInstance
	}
	
	/**
	 * 空间修改
	 * @param kongJianInstance
	 */
	def editKongJian(KongJian kongJianInstance) {
		if (kongJianInstance == null) {
			render status: NOT_FOUND
			return
		}
		respond kongJianInstance
	}
	
	/**
	 * 空间列表
	 */
	def listKongJian(YongHu yongHuInstance) {
		def criteria = KongJian.where {
			if(yongHuInstance) {
				yongHu {
					id == yongHuInstance.id
				}
			}
		}
		params.max = 10
		params.sort = "dateCreated"
		params.order = "desc"
		[kongJianInstanceList:criteria.list(params), kongJianInstanceCount:criteria.count(), yongHuInstance:yongHuInstance]
	}
	
	/**
	 * 用前必读
	 */
	def yongQianBiDu() {
		
	}
	
	/**
	 * 关于网站
	 */
	def guanYuWangZhan() {
		
	}
	
	/**
	 * 反馈
	 */
	def fanKui(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond FanKui.list(params), model:[fanKuiInstanceCount: FanKui.count()]
	}
	
	/**
	 * 组件
	 */
	def zuJian() {
		ArrayList slideList = [
			[url:assetPath(src:"HuanDengPian/images/1.jpg"), alt:"Dan The Man Stage 1", href:"javascript:void(0);"],
			[url:assetPath(src:"HuanDengPian/images/2.jpg"), alt:"Dan The Man Stage 2", href:"javascript:void(0);"],
			[url:assetPath(src:"HuanDengPian/images/3.jpg"), alt:"Dan The Man Stage 3", href:"javascript:void(0);"],
			[url:assetPath(src:"HuanDengPian/images/4.jpg"), alt:"Dan The Man Stage 4", href:"javascript:void(0);"],
			[url:assetPath(src:"HuanDengPian/images/5.jpg"), alt:"Dan The Man Stage 5", href:"javascript:void(0);"],
			[url:assetPath(src:"HuanDengPian/images/6.jpg"), alt:"Dan The Man Stage 6", href:"javascript:void(0);"],
			[url:assetPath(src:"HuanDengPian/images/7.jpg"), alt:"Dan The Man Stage 7", href:"javascript:void(0);"]
		]
		
		[slideList:slideList]
	}
	
}
