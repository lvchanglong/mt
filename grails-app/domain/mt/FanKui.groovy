package mt

import java.util.Date

/**
 * 反馈
 * @author lvchanglong
 */
class FanKui {

	static belongsTo = [yongHu: YongHu]
	
	String neiRong //内容
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		yongHu(nullable: true, blank: true)
		neiRong(nullable: false, blank: false)
	}
	
	static mapping = {
		table 'FAN_KUI'
		
		yongHu column: 'YONG_HU_ID'
		
		neiRong column: 'NEI_RONG'

		id column:'ID'
		version column:'BAN_BEN'
		dateCreated column: 'CHUANG_JIAN_SHI_JIAN'
		lastUpdated column: 'GENG_XIN_SHI_JIAN'
		
		sort id: "desc"
	}
	
	String toString() {
		return this.neiRong
	}
	
	String getYongHuAsString() {
		return this.yongHu?:"匿名"
	}
	
}
