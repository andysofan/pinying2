package com.cyberoller.pinying

import com.cyberoller.pinying.shiro.User

class ProOrderDetail {
	//名称
	String	xname
	String xthumbnail //缩略图 列表展示使用 默认是第一张相册的图片
	//价格
	double xprice = 0
	double subprice = 0
	//数量
	int nums =1
		
	Date 	dateCreated
	Date 	lastUpdated
	
	static	belongsTo = [order:ProOrder,good:ProductGoods]
	
	static constraints = {
		xname(nullable:false,blank:false,size:1..200)
		xthumbnail(nullable:true)
		
		order(nullable:true)
		good(nullable:true)
	}
	
	String toString(){
		return "${xname}"
	}
	
	static mapping = {
		table 'x_product_order_detail'
	}

}
