package mt

import grails.converters.JSON
import grails.transaction.Transactional;
import java.nio.CharBuffer
import java.text.DateFormat
import javax.servlet.http.HttpSession;
import static org.springframework.http.HttpStatus.*

/**
 * 系统后台服务（爱你，在心中）
 * @author lvchanglong
 *
 */
class Z520Controller {
	
	/**
	 * 用户登录(私有)
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
	 * 用户注销(私有)
	 */
	def yongHuZhuXiao() {
		session.invalidate()
		render status: OK, text: '操作成功'
	}
	
	/**
	 * 用户注册
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
	 * 修改密码
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
	 * 头像上传
	 * @param uid 被处理用户
	 */
	@Transactional
	def touXiangShangChuan(String fileName, String uid) {
		withForm {
			def yongHuInstance = YongHu.get(uid)
			if (yongHuInstance) {
				def assetPath = "KongJian/${yongHuInstance.zhangHao}/TuPian/${fileName}"
				BufferedInputStream fileIn = new BufferedInputStream(request.getInputStream())
				byte[] buf = new byte[1024]
				File file = Helper.getFile("grails-app/assets/working/${assetPath}")
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
				
				yongHuInstance.touXiang = assetPath
				yongHuInstance.save(flush: true)//更新路径
				
				Helper.yaSuo(file, 180, 180)//图片压缩处理
				
				render assetPath
			} else {
				render status: NOT_FOUND, text: '用户不存在'
			}
		}.invalidToken {
			// bad request
		}
	}
	
	/**
	 * 生肖查询
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
	 * ip详情
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
	 * 下载
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
	 * 近期公告（HTML5 EventSource（服务器实时推送））
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
	
}
