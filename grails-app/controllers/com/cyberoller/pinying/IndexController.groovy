package com.cyberoller.pinying

import grails.converters.JSON

class IndexController {

	def indexService

	def index() {
		log.info "**********index"
		render view : "/pinying/index"
	}
	
	//菜单-获取品牌列表
	def menuBrandList(){
		log.info "**********menuBrandList"
		try{
			def menuBrandList = indexService.menuBrandList()
			render template : "/pinying/menuBrandList", model : [menuBrandList:menuBrandList]
		}catch(e){
			flash.message = e.getMessage()
			render template : "/pinying/menuBrandList", model : [menuBrandList:null]
		}
	}
	//菜单-取1级分类
	def menuFirstLevelCategory(){
		log.info "**********menuFirstLevelCategory"
		try{
			def firstLevelCategoryInstanceList = indexService.menuFirstLevelCategory()
			render template : "/pinying/menuFirstLevelCategory", model : [firstLevelCategoryInstanceList:firstLevelCategoryInstanceList]
		}catch(e){
			flash.message = e.getMessage()
			render template : "/pinying/menuFirstLevelCategory", model : [firstLevelCategoryInstanceList:null]
		}
	}
	//菜单-取2级分类
	def menuSecondLevelCategory(Long categoryId){
		log.info "**********menuSecondLevelCategory=${categoryId}"
		try{
			def secondLevelCategoryInstanceList = indexService.menuSecondLevelCategory(categoryId)
			render template : "/pinying/menuSecondLevelCategory", model : [secondLevelCategoryInstanceList:secondLevelCategoryInstanceList]
		}catch(e){
			flash.message = e.getMessage()
			render template : "/pinying/menuSecondLevelCategory", model : [secondLevelCategoryInstanceList:null]
		}
	}
	//主页-取推荐产品列表
	def recommendProductList(){
		log.info "**********recommendProductList"
		try{
			def recommendProductList = indexService.recommendProductList()
			render template : "/pinying/recommendProductList", model : [recommendProductList:recommendProductList]
		}catch(e){
			flash.message = e.getMessage()
			render template : "/pinying/recommendProductList", model : [recommendProductList:null]
		}
	}
	//主页-取最热门产品
	def hotestProduct(){
		log.info "**********hotestProduct"
		try{
			def hotestProductInstance = indexService.hotestProduct()
			render template : "/pinying/hotestProductList", model : [hotestProductInstance:hotestProductInstance]
		}catch(e){
			flash.message = e.getMessage()
			render template : "/pinying/hotestProductList", model : [hotestProductInstance:null]
		}
	}
	//主页-取人气产品列表
	def popularProductList(){
		log.info "**********popularProductList"
		try{
			def popularProductList = indexService.popularProductList()
			render template : "/pinying/popularProductList", model : [popularProductList:popularProductList]
		}catch(e){
			flash.message = e.getMessage()
			render template : "/pinying/popularProductList", model : [popularProductList:null]
		}
	}
	//品牌-主页
	def brand (Long brandId)  {
		log.info "**********brand:${brandId}"
		try{
			def productInstanceList = indexService.getProductListByBrandId(brandId, params)
			def productInstanceCount = indexService.getProductCountByBrandId(brandId, params)
			render view : "/pinying/brand", model : [productInstanceList:productInstanceList, productInstanceCount:productInstanceCount]
		}catch(e){
			flash.message = e.getMessage()
			render view : "/pinying/brand", model : [productInstanceList:null, productInstanceCount:0]
		}
	}
	//分类-主页
	def category (Long id)  {
		log.info "**********category:${id}"
		try{
			//取标题
			def title = indexService.getCategoryName(id)
			def productInstanceList = indexService.getProductListByCateogryId(id, params)
			def productInstanceCount = indexService.getProductCountByCateogryId(id, params)
			render view : "/pinying/category", model : [title:title, productInstanceList:productInstanceList, productInstanceCount:productInstanceCount]
		}catch(e){
			flash.message = e.getMessage()
			render view : "/pinying/category", model : [title:"", productInstanceList:null, productInstanceCount:0]
		}
	}
	//获取分类名称
	def getCategoryName (Long categoryId)  {
	    log.info "**********getCategoryName:${categoryId}"
		def result = ""
		try{
			//取标题
			result = indexService.getCategoryName(categoryId)
		}catch(e){
			result = e.getMessage()
		}
		render "${result}"
	}
	//获取分类名称
	def getBrandName (Long brandId)  {
	    log.info "**********getBrandName:${brandId}"
		def result = ""
		try{
			//取标题
			result = indexService.getBrandName(brandId)
		}catch(e){
			result = e.getMessage()
		}
		render "${result}"
	}
	//分类-取品牌列表,根据1级分类ID
	def getBrandListByParentCategoryId(Long parentCategoryId){
		log.info "**********getBrandListByParentCategoryId${parentCategoryId}"
		try{
			def brandListByParentCategoryId = indexService.getBrandListByParentCategoryId(parentCategoryId, params)
			render template : "/pinying/brandListByParentCategoryId", model : [brandListByParentCategoryId:brandListByParentCategoryId]
		}catch(e){
			flash.message = e.getMessage()
			render template : "/pinying/brandListByParentCategoryId", model : [brandListByParentCategoryId:null]
		}
	}
	//分类-取子分类列表，根据1级分类ID
	def getCategoryListByParentCategoryId(Long parentCategoryId){
		log.info "**********getCategoryListByParentCategoryId:${parentCategoryId}"
		try{
			def categoryListByParentCategoryId = indexService.getCategoryListByParentCategoryId(parentCategoryId)
			render template : "/pinying/categoryListByParentCategoryId", model : [categoryListByParentCategoryId:categoryListByParentCategoryId]
		}catch(e){
			flash.message = e.getMessage()
			render template : "/pinying/categoryListByParentCategoryId", model : [categoryListByParentCategoryId:null, subCategoryId : null]
		}
	}
	//分类-取品牌列表,根据2级分类ID
	def getBrandListByCategoryId(Long categoryId){
		log.info "**********getBrandListByCategoryId:${categoryId}"
		try{
			def getBrandListByCategoryId = indexService.getBrandListByCategoryId(categoryId)
			render template : "/pinying/brandListByCategoryId", model : [getBrandListByCategoryId:getBrandListByCategoryId]
		}catch(e){
			flash.message = e.getMessage()
			render template : "/pinying/brandListByCategoryId", model : [getBrandListByCategoryId:null]
		}
	}
	//分类-取产品列表
	def getProductListByCateogryId(Long categoryId, Long offset){
		log.info "**********getProductListByCateogryId:${categoryId},offset:${offset}"
		try{
			def getProductListByCateogryId = indexService.getProductListByCateogryId(categoryId, offset, params)
			render template : "/pinying/productListByCateogryId", model : [getProductListByCateogryId:getProductListByCateogryId]
		}catch(e){
			flash.message = e.getMessage()
			render template : "/pinying/productListByCateogryId", model : [getProductListByCateogryId:null]
		}
	}
	/************************************************************************************/
	//获取产品信息
	def product(Long id){
		try{
			def productInstance = indexService.getProductInstance(id)
			render view : "/pinying/productInfo", model : [productInstance:productInstance]
		}catch(e){
			flash.message = e.getMessage()
			render view : "/pinying/productInfo", model : [productInstance:null]
		}	
	}
	/************************************************************************************/
	//获取KV列表
	def getKvList ()  {
	    try{
			def kvInstanceList = indexService.getKvList()
			render template : "/pinying/kv", model : [kvInstanceList:kvInstanceList]
		}catch(e){
			flash.message = e.getMessage()
			render template : "/pinying/kv", model : [kvInstanceList:null]
		}	
	}
	/************************************************************************************/
	//获取招聘列表
	def getJobList ()  {
	    try{
			def xjobInstanceList = indexService.getJobList()
			render template : "/about/jobs", model : [xjobInstanceList:xjobInstanceList]
		}catch(e){
			flash.message = e.getMessage()
			render template : "/about/jobs", model : [xjobInstanceList:null]
		}	
	}
	def getJob (Long id)  {
	    try{
			def xjobInstance = indexService.getJob(id)
			render view : "/about/job", model : [xjobInstance:xjobInstance]
		}catch(e){
			flash.message = e.getMessage()
			render view : "/about/job", model : [xjobInstance:null]
		}	
	}
	
	
	def commentCount(long proId){
		log.info "ProComments..commentCount ${params}---init"
		
		long totalCount = ProComments.createCriteria().get {
			if(proId){
				eq("goodId", proId)
			}
			projections {
				rowCount()
			}
		}
		long pages = totalCount/10 +(totalCount%10>0 ?1 :0 )
		
		def model = [pages: pages,totalCount:totalCount]
		render model as JSON
	}
	
	//评论列表
	def commentList(long proId,int curr){
		log.info "ProComments..list ${params}---init"
		def cel = {
			if(proId){
				eq("goodId", proId)
			}
			order("lastUpdated", "desc")
		}
		
		params.max = 10
		params.offset = 10 * (curr-1)
		def results = ProComments.createCriteria().list(params,cel)
		
		long totalCount = results.totalCount
		long pages = totalCount/10 +(totalCount%10>0 ?1 :0 )
		
		def model = [list:results,pages: pages,totalCount:totalCount]
		render model as JSON
	}
	
	def isLogin(){
		log.info "deleteAll"
		def result="faild"
		try{
			def userId = session.getAttribute("userId")
			if(userId){
				result = "success"
			}
		}catch(e){
			result = e.getMessage()
		}
		render "${result}"
	}
	
	
}