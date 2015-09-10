package mt

import java.util.Date;

/**
 * 实体
 * @author lvchanglong
 *
 */
class ShiTi {
	
	static belongsTo = [yongHu: YongHu]

	String biaoTi //标题
	String neiRong //内容
	String fuJian //附件 
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		yongHu(nullable: true, blank: true)
		biaoTi(nullable: false, blank: false)
		neiRong(nullable: true, blank: true)
		fuJian(nullable: true, blank: true)
	}
	
	static mapping = {
		table 'SHI_TI'
		
		yongHu column: 'YONG_HU_ID'
		
		biaoTi column: 'BIAO_TI'
		neiRong column: 'NEI_RONG', sqlType:"text"
		fuJian column: 'FU_JIAN', sqlType:"text"

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
