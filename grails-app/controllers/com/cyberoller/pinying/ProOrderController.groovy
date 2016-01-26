package com.cyberoller.pinying

import grails.transaction.Transactional

import com.cyberoller.pinying.shiro.User

class ProOrderController {
	
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	@Transactional(readOnly = true)
	def index(Integer max) {
		log.info "order..index"
		if(!params.sort){
			params.sort = "lastUpdated"
			params.order = "desc"
		}
		try{
			Integer.parseInt(params.id);
		}catch(Exception e){
			params.id =null
		}
		
		params.max = Math.min(max ?: 10, 100)
		def cel = {
			if(params.id){
				long id = params.id.toLong()
				eq("id", id)
			}
			if(params.consigneeName){
				like("consigneeName", "%${params.consigneeName}%")
			}
			if(params.consigneeMobile){
				like("consigneeMobile", "%${params.consigneeMobile}%")
			}
			//xdel
			eq("xdel", false)
		}
		
		def results = ProOrder.createCriteria().list(params,cel);
		render(view:"index",model:[proOrderList:results,orderCount: results.totalCount])
	}
	
	def detail(long id){
		log.info "order..${params}"
		def order = ProOrder.get(id)
		render(view:"detail",model:[order:order])
	}
	
	def list(){
		log.info("userOrders: ${params}")
		def userId = session.getAttribute("userId")
		
		def q_date
		if(params.q_date){
			q_date = params.q_date
			if(q_date=="all"){
				q_date = null
			}
			if(q_date=="3m"){//最近3个月
				GregorianCalendar gc = new GregorianCalendar();
				gc.setTime( new Date());//MONTH
				gc.set(Calendar.MONTH, gc.get(Calendar.MONTH)-3);
				q_date = gc.getTime();
			}
		}
		def max = 10
		if(params.max){
			max = Integer.valueOf(params.max) 
		}
		params.max = Math.min(max ?: 10, 100)
		
		def cel = {
			if(userId){
				eq("user.id", userId)
			}
			if(q_date){//最近3个月
				ge("lastUpdated", q_date)
			}
			order("lastUpdated", "desc")
			//xdel
			eq("xdel", false)
		}
		
		def results = ProOrder.createCriteria().list(params,cel)
		long totalCount = results.totalCount
		//long pages = totalCount/10 +(totalCount%10>0 ?1 :0 )
		
		def model = [list:results,totalCount:totalCount ,params:params]
		
		render view : "/pinying/userOrders", model : model
	}
	
	def deleteOrder(){
		def userId = session.getAttribute("userId")
		def user = User.get(userId)
		def id = params.id.toLong()
		
		def order = ProOrder.get(id)
		
		if(user && order){
			
			GregorianCalendar gc = new GregorianCalendar();
			gc.setTime( new Date());//MONTH
			gc.set(Calendar.MINUTE, gc.get(Calendar.MINUTE)-30);
			def min30 = gc.getTime();
			
			if(!order.lastUpdated.before(min30)){
				log.info("订单 ${order.id} ${order.lastUpdated} 30分钟内 删除")
				user.money = user.money+order.price
				user.save(flush:true)
				def count1 = ProOrderDetail.executeUpdate("delete from ProOrderDetail t where t.order.id=?", [id])
				//def count = ProOrder.executeUpdate("delete from ProOrder t where t.user.id=? and t.id=?", [userId,id])
				order.delete(flush:true);
			}else{
				log.info("订单 ${order.id} ${order.lastUpdated} 超过30分钟内 不能删除")
			}
		}
		redirect (action:"list")
	}
	
	//@Transactional(readOnly = false)
	def deleteOrder2(long id){
		log.info "order..${params}"
		def userId = session.getAttribute("userId")
		def user = User.get(userId)
		
		def order = ProOrder.get(id)
		//userInstance.save flush:true
		if(user && order){
			order.xdel = true;
			order.save flush:true;
			//def count1 = ProOrderDetail.executeUpdate("update ProOrderDetail set  where t.order.id=?", [id])
		}
		redirect (action:"index")
	}
	
}
