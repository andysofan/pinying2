package com.cyberoller.pinying

import com.cyberoller.pinying.shiro.User

class ProOrder {
	
	String cjNum
	
	String pjNum
	
	String costDepart
	
	String consigneeName
	
	String consigneeAddress
	
	String consigneePhone
	
	String consigneeMobile
	
	String consigneeRemark
	
	//是否删除
	//Boolean delete = false
	//订单状态
	//int status = 0
	
	//是否删除
	Boolean xdel = false
	
	double price=0
	
	int nums=1
	
	Date 	dateCreated
	Date 	lastUpdated
	
	static	belongsTo = [user:User]
	static hasMany = [details:ProOrderDetail]

    static constraints = {
		cjNum(nullable:true)
		pjNum(nullable:true)
		costDepart(nullable:true)
		user(nullable:true)
		xdel(nullable:false)
		
		
		consigneeName(nullable:true)
		consigneeAddress(nullable:true,size:0..600)
		consigneePhone(nullable:true)
		consigneeMobile(nullable:true)
		consigneeRemark(nullable:true)
    }
	
	/*String toString(){
		return "订单号：${id} cjNum: ${cjNum}"
	}*/
	
	static mapping = {
		table 'x_product_order'
	}
}
