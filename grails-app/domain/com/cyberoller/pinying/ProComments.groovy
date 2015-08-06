package com.cyberoller.pinying

import com.cyberoller.pinying.shiro.User

class ProComments {

	String cnt
	String userName
	
	Date 	dateCreated
	Date 	lastUpdated
	
	long goodId=0
	
	static	belongsTo = [user:User] //,good:ProductGoods
	
    static constraints = {
		cnt(nullable:true,size:0..2000)
		userName(nullable:true,size:0..100)
		goodId(nullable:true)
		user(nullable:true)
    }
	
	/*String toString(){
		return "订单号：${id} cjNum: ${cjNum}"
	}*/
	
	static mapping = {
		table 'x_product_comments'
	}
}
