package com.cyberoller.pinying

import com.cyberoller.pinying.shiro.User

class ProCartController {

    def index() {
		log.info "**********index"
		render view : "/pinying/index"
	}
	
	def list(){
		def userId = session.getAttribute("userId")
		def user = User.get(userId)
		log.info("user: ${user}")
		def cartList = ShoppingCart.findAll("from ShoppingCart as t where t.user.id=?",[userId])
		render view : "/pinying/proCart", model : [cartList:cartList ,user:user]
	}
	
	def delete(long cartId){
		log.info "delete --${cartId}"
		def result="success"
		try{
			def cart=ShoppingCart.get(cartId)
			cart.delete(flush:true)
		}catch(e){
			result = e.getMessage()
		}
		render "${result}"
	}
	
	def delAll(){
		log.info "deleteAll"
		def result="success"
		try{
			def userId = session.getAttribute("userId")
			def count = ShoppingCart.executeUpdate("delete from ShoppingCart t where t.user.id=?", [userId])
			//log.info "delete success count ${count}"
		}catch(e){
			result = e.getMessage()
		}
		render "${result}"
	}
	
	def update(long cartId,int nums ){
		log.info "update ${cartId},${nums}"
		def result="success"
		try{
			def count = ShoppingCart.executeUpdate("update from ShoppingCart t set t.nums=? where t.id=?", [nums,cartId])
			//log.info "update success count ${count}"
		}catch(e){
			result = e.getMessage()
		}
		render "${result}"
	}
	
	def cart(){
		log.info "----cart "
		def userId = session.getAttribute("userId")
		def userName = session.getAttribute("userName")
		//
		def goodId = Long.valueOf(params.id)
		def nums = Integer.valueOf(params.nums)
		
		log.info "userId: ${userId} ,userName:${userName},goodId:${goodId},nums:${nums}"
		
		def user = User.get(userId)
		//def user = new User()
		//user.id = userId
		//user.username = userName
		//
		def good = ProductGoods.get(goodId)
		
		def cart = ShoppingCart.find("from ShoppingCart as t where t.user.id=? and t.good.id=? ",[userId,goodId])
		//log.info "---cart------${cart}"
		if(cart){
			cart.nums = nums
			cart.xprice = good.xorderPrice
			cart.xthumbnail = good.xthumbnail
			cart.xname = good.xname
		}else{
			cart = new ShoppingCart()
			cart.good = good
			cart.user = user
			cart.xprice = good.xorderPrice
			cart.xthumbnail = good.xthumbnail
			cart.xname = good.xname
			cart.nums = nums
		}
		cart.save(flush:true)
		redirect (action:"list")
	}
	
	
	def tradeTag(){
		def cid = params.cid
		def nums = params.nums
		def price = params.price
		log.info("trade: ${params}")
		
		def userId = session.getAttribute("userId")
		//def user = User.get(userId)
		
		def count = ShoppingCart.executeUpdate("update from ShoppingCart t set t.xtrade=? where t.user.id=?", [false,userId])
		
		def cidArr = cid.split(",") 
		def numsArr = nums.split(",")
		for(int i=0;i<cidArr.length;i++){
			ShoppingCart.executeUpdate("update from ShoppingCart t set t.xtrade=?,t.nums=? where t.id=?",[true, Integer.valueOf(numsArr[i]), Long.valueOf(cidArr[i]) ]);
		}
		redirect (action:"tradeIndex",params:params)
	}
	
	def tradeIndex(){
		log.info("trade: ${params}")
		def userId = session.getAttribute("userId")
		//def user = User.get(userId)
		render view : "/pinying/proTrade", model : params
	}
	
	def orderIndex(){
		log.info("orderIndex")
		def userId = session.getAttribute("userId")
		def user = User.get(userId)
		render view : "/pinying/proOrder", model : [oNo:params.oNo ,user:user]
	}
	
	def payment(){
		def result ="ss"
		log.info("trade: ${params}")
		def userId = session.getAttribute("userId")
		
		def cartList = ShoppingCart.findAll("from ShoppingCart as t where t.user.id=? and t.xtrade=? ",[userId,true])
		
		if(cartList && cartList.size()>0){
			def user = User.get(userId)
			def proOrder = new ProOrder()
			
			proOrder.pjNum = params.pjNum
			proOrder.cjNum = params.cjNum
			proOrder.costDepart = params.costDepart
			
			//收货人信息
			proOrder.consigneeName = params.consigneeName
			proOrder.consigneeAddress = params.consigneeAddress
			proOrder.consigneePhone = params.consigneePhone
			proOrder.consigneeMobile = params.consigneeMobile
			proOrder.consigneeRemark = params.consigneeRemark
			
			
			proOrder.user = user
			proOrder.price = Double.valueOf(params.price)
			
			proOrder.save(flush:true)
			
			cartList.each {
				def orderDetail = new ProOrderDetail()
				orderDetail.order = proOrder
				orderDetail.good = it.good
				orderDetail.xname = it.xname
				orderDetail.xthumbnail = it.xthumbnail
				orderDetail.nums = it.nums
				orderDetail.xprice = it.xprice
				orderDetail.subprice = it.xprice * it.nums
				orderDetail.save(flush:true)
				
				it.delete(flush:true)
			}
			user.money = user.money-proOrder.price
			user.save(flush:true)
			
			redirect (action:"orderIndex",params:[oNo:proOrder.id])
		}else{
			//def model = params
			//model.productCn = -1
			redirect (action:"list")
		}
	}
	
	
}
