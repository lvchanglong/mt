package mt

import java.util.Date;

/**
 * 空间
 * @author lvchanglong
 *
 */
class KongJian {

    static belongsTo = [yongHu: YongHu]
	
	String biaoTi //标题
	String neiRong //内容
	String fuJian //附件
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		yongHu(nullable: false, blank: false)
		biaoTi(nullable: false, blank: false)
		neiRong(nullable: false, blank: false)
		fuJian(nullable: true, blank: true)
	}
	
	static mapping = {
		table 'KONG_JIAN'
		
		yongHu column: 'YONG_HU_ID'
		
		biaoTi column: 'BIAO_TI'
		neiRong column: 'NEI_RONG'
		fuJian column: 'FU_JIAN', sqlType:"text"

		id column:'ID'
		version column:'BAN_BEN'
		dateCreated column: 'CHUANG_JIAN_SHI_JIAN'
		lastUpdated column: 'GENG_XIN_SHI_JIAN'
		
		sort id: "desc"
	}
	
	String toString() {
		return this.biaoTi
	}
	
	String getYongHuAsString() {
		return this.yongHu?:"匿名"
	}
	
	List<ShiTi> children() {
		String[] splits = this.neiRong.split("(,|，)")
		def arrayList = ShiTi.getAll(splits)
		return arrayList.findAll {elem->
			elem != null
		}
	}
	
}
