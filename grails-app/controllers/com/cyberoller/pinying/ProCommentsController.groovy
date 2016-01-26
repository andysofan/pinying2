package com.cyberoller.pinying

import com.cyberoller.pinying.shiro.User

class ProCommentsController {

    def index() {
		log.info "**********index"
		render view : "/pinying/index"
	}
	
	def add(){
		log.info "comments.add ${params}"
		def result="success"
		try{
			def userId = session.getAttribute("userId")
			def user = User.get(userId)
			
			def comments = new ProComments()
			comments.user= user
			comments.userName= user.fullname
			comments.goodId= Long.valueOf(params.proId)
			comments.cnt=params.commentCnt
			
			comments.save(flush:true)
			
		}catch(e){
			result = e.getMessage()
		}
		render "${result}"
	}
	
	def del(){
		log.info "comments.add ${params}"
		def result="success"
		try{
			def count = ProComments.executeUpdate("delete from ProComments t where t.id=?", [Long.valueOf(params.cId)])
		}catch(e){
			result = e.getMessage()
		}
		render "${result}"
	}
	
	
	
	
	
}
