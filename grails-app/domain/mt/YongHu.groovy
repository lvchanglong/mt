package mt

/**
 * 用户
 * @author lvchanglong
 *
 */
class YongHu {

	static hasMany = [fanKuis: FanKui, kongJians: KongJian, shiTis: ShiTi]
	
	String zhangHao //账号
	String miMa //密码
	String xingMing = "匿名" //姓名
	String touXiang = "WangLuo/TouXiang/警察.png" //头像
	String jianJie = "暂无" //简介
	
	String quanXian = "普通用户" //权限
	
	Date dateCreated //创建时间
	Date lastUpdated //更新时间

	static transients = ["gongWangIP", "sessionID"] //属性集合（不会出现在数据库中）
	
	String gongWangIP //公网-IP
	String sessionID //session-ID
	
	static constraints = {
		zhangHao(nullable: false, blank: false, unique: true)
		miMa(nullable: false, blank: false)
		xingMing(nullable: true, blank: true)
		touXiang(nullable: true, blank: true)
		jianJie(nullable: true, blank: true)
		quanXian(nullable: true, blank: true, inList: ["管理员", "普通用户"])
	}
	
	static mapping = {
		table 'YONG_HU'
		
		zhangHao column: 'ZHANG_HAO'
		miMa column: 'MI_MA'
		xingMing column: 'XING_MING'
		touXiang column: 'TOU_XIANG'
		jianJie column: 'JIAN_JIE'
		quanXian column: 'QUAN_XIAN'

		id column:'ID'
		version column:'BAN_BEN'
		dateCreated column: 'CHUANG_JIAN_SHI_JIAN'
		lastUpdated column: 'GENG_XIN_SHI_JIAN'
		
		fanKuis sort: "dateCreated", order: "desc"
		kongJians sort: "dateCreated", order: "desc"
		shiLis sort: "dateCreated", order: "desc"
	}
	
	String toString() {
		return this.xingMing
	}
	
	def beforeInsert() {
		this.miMa = this.miMa.encodeAsMD5()
	}
	
	def beforeUpdate() {
		
	}
	
	/**
	 * 是管理员么？
	 * @return
	 */
	boolean shiFouGuanLiYuan() {
		return (this.quanXian == "管理员")
	}
	
	/**
	 * 设置管理员
	 */
	static boolean sheZhiGuanLiYuan() {
		
		def yonghu = YongHu.findWhere([zhangHao: "lvchanglong"])
		
		if (yonghu) {
			return true
		}
		
		Map map = [
			zhangHao: "lvchanglong",
			miMa: "123456",
			xingMing: "吕常龙",
			touXiang: "WangLuo/TouXiang/警察.png",
			jianJie: "用实践更新认识、用认识指导实践",
			quanXian: "管理员",
		]
		yonghu = new YongHu(map)
		if (yonghu.hasErrors()) {
			return false
		} else {
			yonghu.save flush:true
			return true
		}
		
	}

}
