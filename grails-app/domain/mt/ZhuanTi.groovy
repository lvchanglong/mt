package mt

import java.util.Date;
import java.util.List;

/**
 * 专题
 * @author lvchanglong
 *
 */
class ZhuanTi {

	static belongsTo = [yongHu: YongHu]
	
	String biaoTi //标题
	String neiRong //内容（空间ID列表）
	
	static constraints = {
		yongHu(nullable: false, blank: false)
		biaoTi(nullable: false, blank: false)
		neiRong(nullable: false, blank: false)
	}
	
	static mapping = {
		table 'ZHUAN_TI'
		
		yongHu column: 'YONG_HU_ID'
		
		biaoTi column: 'BIAO_TI'
		neiRong column: 'NEI_RONG'

		id column:'ID'
		version column:'BAN_BEN'
		
		sort id: "desc"
	}
	
	String toString() {
		return this.biaoTi
	}
	
	String getYongHuAsString() {
		return this.yongHu?:"匿名"
	}
	
	/**
	 * 空间列表
	 */
	List<ShiTi> children() {
		String[] splits = this.neiRong.trim().split("(,|，)")
		def arrayList = KongJian.getAll(splits)
		return arrayList.findAll {elem->
			elem != null
		}
	}
	
}
