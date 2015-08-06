package com.cyberoller.pinying

import com.cyberoller.pinying.shiro.User

class ShoppingCart {
    //名称
	String	xname
	//价格
	double xprice = 0
	String xthumbnail //缩略图 列表展示使用 默认是第一张相册的图片
	//数量
	int nums =1
	//是否结算
	Boolean xtrade = false
		
	Date 	dateCreated
	Date 	lastUpdated
	
	static	belongsTo = [user:User,good:ProductGoods]
	
    static constraints = {
		xname(nullable:false,blank:false,size:1..200)
		xthumbnail(nullable:true)
		
		user(nullable:true)
		good(nullable:true)
    }	
    
    String toString(){
    	return "${xname}"
    }
    
	static mapping = {
		table 'x_product_carts'
	}

}
