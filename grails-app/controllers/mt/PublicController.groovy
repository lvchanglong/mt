package mt

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON

/**
 * 公有方法，所有人
 */
class PublicController {

	static defaultAction = "index"
	
	/**
	 * 组件(页面)
	 */
	def zuJian() {
		ArrayList slideList = [
			[url:assetPath(src:"HuanDengPian/images/z1.jpg"), alt:"Dan The Man Stage 1", href:"javascript:void(0);"],
			[url:assetPath(src:"HuanDengPian/images/z2.jpg"), alt:"Dan The Man Stage 2", href:"javascript:void(0);"],
			[url:assetPath(src:"HuanDengPian/images/z3.jpg"), alt:"Dan The Man Stage 3", href:"javascript:void(0);"],
			[url:assetPath(src:"HuanDengPian/images/z4.jpg"), alt:"Dan The Man Stage 4", href:"javascript:void(0);"],
			[url:assetPath(src:"HuanDengPian/images/z5.jpg"), alt:"Dan The Man Stage 5", href:"javascript:void(0);"],
			[url:assetPath(src:"HuanDengPian/images/z6.jpg"), alt:"Dan The Man Stage 6", href:"javascript:void(0);"],
			[url:assetPath(src:"HuanDengPian/images/z7.jpg"), alt:"Dan The Man Stage 7", href:"javascript:void(0);"]
		]
		
		[slideList:slideList]
	}
	
	/**
	 * 反馈(页面)
	 */
	def fanKui(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond FanKui.list(params), model:[fanKuiInstanceCount: FanKui.count()]
	}
	
	/**
	 * 用前必读(页面)
	 */
	def yongQianBiDu() {
		
	}
	
	/**
	 * 实体详情(页面)
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
	 * 网站首页(页面)
	 */
    def index() {
		def hmIW = [0:'7', 1:'5', 2:'5', 3:'7', 4:'12', 5:'7', 6:'5', 7:'5', 8:'7']
		
		def dangQianYongHu = null
		if(session.uid) {
			dangQianYongHu = YongHu.get(session.uid)
		}
		
		params.max = 15
		params.sort = "id"
		params.order = "desc"
		[kongJianInstanceList:KongJian.list(params), kongJianInstanceCount:KongJian.count(), dangQianYongHu:dangQianYongHu, 
			kongJianInstanceListA:KongJian.getAll([1,2,10]), hmIW:hmIW
		]
	}
	
	//---------------------------------------------------------------------------------------------------
	
	/**
	 * 用户登录(服务)
	 * @param zhangHao 账号
	 * @param miMa 密码
	 */
	def yongHuDengLu(String zhangHao, String miMa) {
		if(!miMa) {
			miMa = grailsApplication.config.application.password
		}
		
		if (zhangHao) {
			def yonghu = YongHu.findByZhangHaoAndMiMa(zhangHao, miMa.encodeAsMD5())
			if (yonghu) {
				session.uid = yonghu.id
				render status: OK, text: '操作成功，初始化...'
				return
			} else {
				render status: UNAUTHORIZED, text: '认证失败'
				return
			}
		}
		render status: BAD_REQUEST, text: '请输入账号'
	}
	
	/**
	 * 用户注销(服务)
	 */
	def yongHuZhuXiao() {
		session.invalidate()
		render status: OK, text: '操作成功'
	}
	
	/**
	 * 用户注册(服务)
	 */
	@Transactional
	def yongHuZhuCe(String zhangHao, String miMa, String queRenMiMa) {
		if(!miMa && !queRenMiMa) {
			miMa = grailsApplication.config.application.password
			queRenMiMa = miMa
		}
		
		if (zhangHao) {
			if (miMa == queRenMiMa) {//确认密码一致性
				def yongHuInstance = YongHu.findByZhangHao(zhangHao)
				if (yongHuInstance) {//账号冲突
					render status: CONFLICT, text: '账号已存在'
					return
				}
				def yonghu = new YongHu([zhangHao: zhangHao, miMa: miMa])//注册用户
				if (!yonghu.hasErrors()) {
					yonghu.save flush: true
					render status: OK, text: '注册成功'
					return
				}
			}
			render status: NOT_ACCEPTABLE, text: '密码不一致'
			return
		}
		render status: BAD_REQUEST, text: '请输入账号'
	}
	
	/**
	 * 生肖查询(服务)
	 * @param nian 年份
	 */
	def shengXiaoChaXun(Integer nian) {
		if (nian && nian >= 0) {
			render Helper.getShengXiao(nian) as JSON
			return
		}
		render status: NOT_ACCEPTABLE, text: '数据不合法'
	}
	
	/**
	 * ip详情(服务)
	 * @param ip地址
	 */
	def ipXiangQing(String ip) {
		try {
			def url = new URL("http://wap.ip138.com/ip138.asp?ip=" + ip)
			def text = url.getText()
			render text.find(/(?<=<b>).*?(?=<\/b>)/)
		} catch(Exception e) {
			
		}
	}
	
	/**
	 * 下载(服务)
	 * @param filePath 文件路径  grails-app/assets/working/LinShi/${fileName}
	 */
	def xiaZai(String filePath) {
		File file = new File(filePath)
		def fileName = file.getName()
		def fileType = Helper.getFileType(fileName)
		response.contentType = grailsApplication.config.grails.mime.types[fileType]
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8"))
		def out = response.getOutputStream()
		out << file.getBytes()
		out.flush()
		out.close()
	}
	
	/**
	 * 近期公告，HTML5 EventSource，服务器实时推送(服务)
	 */
	def jinQiGongGao() {
		def array = ["I want to play a game with you", "我就是吕常龙", "我是这的站长", "我要不断的成长", "这是赔钱的网站，但我似乎并不在意"]
		
		Integer i = Math.floor(Math.random() * array.size())
		
		String wt = array[i];
		
		response.setHeader("Content-Type", "text/event-stream")
		response.setHeader("Cache-Control", "no-cache")
		response.setCharacterEncoding ("UTF-8")
		
		def printWriter = response.getWriter()

		printWriter.println("data:" + wt)
		
		printWriter.println()
		printWriter.flush()
	}
	
	/**
	 * 头像加载(服务)
	 */
	def loadTouXiang(YongHu yongHuInstance) {
		def url = new URL(createLink(uri:'/', absolute:true) + assetPath(src:'SuCai/%E8%AE%B0%E8%80%85.png').replaceFirst("/", ""))
		byte[] byteList = url.getBytes()
		if (yongHuInstance) {
			if (yongHuInstance.touXiang) {
				byteList = yongHuInstance.touXiang
			}
		}
		def out = response.getOutputStream()
		out << byteList
		out.flush()
		out.close()
	}
	
}
