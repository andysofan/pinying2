package com.cyberoller.pinying

import com.cyberoller.pinying.shiro.User

class Favorite {

	User user
	ProductGoods productGoods

    //创建日期
	Date dateCreated
	//修改日期
	Date lastUpdated

    static constraints = {
		user(nullable:false)
		productGoods(nullable:false)
    }
    
    static mapping = {
    	table "x_favorite"
    }
}