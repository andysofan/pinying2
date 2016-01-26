<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="pinying"/>
	<title><g:message code="custom.menu.productInfo" />~Best Gift</title>
	<link rel="stylesheet" href="${resource(dir:"css/pinying", file:"static.css")}" />
</head>
<body>
	<div class="aboutconpany mt10">
		<div class="hline"></div>
		<div class="list3">
			<div class="productdetail clearFix">
				<div class="fl pdleft">
					<div class="hpslides">
						<ul class="slides">
							<li>
								<a href="#" title="" target="_blank">
									<img src="<g:resource dir="images/pinying/images" file="${productInstance?.ximage1}" />" width="579" height="409" alt="">
								</a>
							</li>
							<li>
								<a href="#" title="" target="_blank">
									<img src="<g:resource dir="images/pinying/images" file="${productInstance?.ximage2}" />" width="579" height="409" alt="">
								</a>
							</li>
							<li>
								<a href="#" title="" target="_blank">
									<img src="<g:resource dir="images/pinying/images" file="${productInstance?.ximage3}" />" width="579" height="409" alt="">
								</a>
							</li>
						</ul>
					</div>
				</div>
			<div class="fr pdright">
				<h3><g:message code="custom.productInfo.detail" /></h3>
				<ul>
					<li>
						<p>
							<img alt="" src="<g:resource dir="images/pinying/images" file="${productInstance?.ximage1}" />" width="107" height="100" />
						</p>
						<p>&nbsp;</p>
					</li>
					<li>
						<p>
							<img alt="" src="<g:resource dir="images/pinying/images" file="${productInstance?.ximage2}" />" width="107" height="100" />
						</p>
						<p>&nbsp;</p>
					</li>
					<li>
						<p>
							<img alt="" src="<g:resource dir="images/pinying/images" file="${productInstance?.ximage3}" />" width="107" height="100" />
						</p>
						<p>&nbsp;</p>
					</li>
				</ul>
			</div>
			</div>

			<div class="detailinfo mt70">
				<ul>
					<li class="clearFix">
						<label><g:message code="custom.productInfo.detail.1" /></label>
						<span>${productInstance?.xprice}RMB</span>
						
						<label><g:message code="custom.productInfo.detail.8" /></label>
						<span>${productInstance?.xorderPrice}RMB</span>
						
						<%--<label><g:message code="custom.productInfo.detail.2" /></label>
						<span>${productInstance?.xpackage}</span>
					--%></li>
					<li class="clearFix">
						<label><g:message code="custom.productInfo.detail.3" /></label>
						<span>${productInstance?.xname}</span>
						<label><g:message code="custom.productInfo.detail.4" /></label>
						<span>${productInstance?.xmaterial}</span>
					</li>
					<li class="clearFix">
						<label><g:message code="custom.productInfo.detail.5" /></label>
						<span>${productInstance?.xsize}</span>
						<label><g:message code="custom.productInfo.detail.6" /></label>
						<span>${productInstance?.xcolor}</span>
					</li>
				</ul>
				
				<br>
				<table>
				<tr>
				<td class="choose-btns">
				<g:if test="${productInstance?.xdel==false}">
		          <input id="buyCount" class="count-input" type="text" value="1"/>
		          <a class="btn-append" href="javascript:buy()">加入购物车</a>
	          	</g:if>
	          	<g:if test="${productInstance?.xdel==true}">
	          		过期产品
	          	</g:if>
	          	<g:else>
	          	
	          	</g:else>
		          <%-- 
		          <a class="btn-buy" href="javascript:buy()" title="">
		          加入购物车
				  </a>
		        --%></td>
				</tr>
				</table>
				
				<p class="mt10"><g:message code="custom.productInfo.detail.7" /></p>
				<div class="dfinfo">
					${productInstance?.xdesc}
				</div>
				
			</div>
				
				<div class="tb-title">评论 &nbsp;<span id="totalCount">0条</span>
				</div>
				<br><br>
				<div class="tb-add-comments">
					<a class="btn-add" id="showComment" href="javascript:">发表评论</a> <div>还可以输入<b class="num">400</b>字</div>
					<textArea class="chackTextarea" id="commentCnt" name="commentCnt" cols="90" rows="4" readOnly=true>登录后发表评论</textArea> 
				</div>
				<br>
				<div class="tb-r-goods">
<script type="text/javascript" src="${resource(dir:"js/pinying/common/laytpl", file:"laytpl.js")}"></script>
<script id="tpl_comments" type="text/html">
<ul>
{{# for(var i = 0, len = d.list.length; i < len; i++){ }}
	<div style="width:750px;height:1px;margin:0px auto;padding:0px;background-color:#D4D4D4;overflow:hidden;"></div>
    <li id="comment_{{ d.list[i].id }}">
		
		<span class="tb-r-buyer" title="{{ d.list[i].userName }}">{{ d.list[i].userName }}
		{{#if(isManager==true){ }}
		<br><a href="javascript:deleteComment('{{ d.list[i].id }}');" style="color: #f00;line-height: 30px;">删除评论</a>
		{{#} }}
		</span>
		
		
        <div class="tb-r-bd">
			<div class="tb-r-cnt ">
				{{ d.list[i].cnt }}
			</div><br>
			<div class="tb-r-info">
				{{ d.list[i].dateCreated.replace('T',' ').replace('Z','') }}
			</div>
		</div>
    </li>
{{# } }}
</ul>

</script>
					<div id="pageview"></div>
					<div id="page1"></div>
				</div>
                
				<%--<div class="hline"></div>
			--%></div>
		</div>
	<script type="text/javascript">
		function buy(){
			var nums = $("#buyCount").val().replace(/\r\n/g, "");
			nums = parseInt(nums)
			if(!nums){
				nums = 1;
			}

			var href="${createLink(controller:'proCart', action:'cart', id:productInstance?.id)}";
				href+="?nums=" + nums;

			window.location.href = href;
		}
	</script>
	<script type="text/javascript" src="${resource(dir:"js/pinying/common/laypage", file:"laypage.js")}"></script>
	
	<script type="text/javascript">
	//以下将以jquery.ajax为例，演示一个异步分页
	var urlCn = "${createLink(controller:'index', action:'commentCount')}";
	var urlList = "${createLink(controller:'index', action:'commentList')}";
	var proId = ${productInstance?.id};
	function loadComment(){
		$.getJSON(urlCn, {proId:proId,rund:Math.random()}, function(res){ //从第6页开始请求。返回的json格式可以任意定义
			if(res.pages==0){
				return;
			}
		    laypage({
		        cont: 'page1', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
		        pages: res.pages, //通过后台拿到的总页数
		        curr: 1, //初始化当前页
		        jump: function(e){ //触发分页后的回调
		            $.getJSON(urlList, {proId:proId,curr: e.curr,rund:Math.random()}, function(res){
		                e.pages = e.last = res.pages; //重新获取总页数，一般不用写
		                //渲染
		                //var view = document.getElementById('view1'); //你也可以直接使用jquery
		                //var demoContent = (new Date().getTime()/Math.random()/1000)|0; //此处仅仅是为了演示
		                //view.innerHTML = res.content + demoContent; 
	
		                var gettpl = document.getElementById('tpl_comments').innerHTML;
		            	laytpl(gettpl).render(res, function(html){
		            	    document.getElementById('pageview').innerHTML = html;
		            	});
		            	document.getElementById('totalCount').innerHTML = res.totalCount+"条";
		            });
		        }
		    });
		});
	}

	setTimeout('loadComment()',100);


	function isLogin(){
		$.ajax({
			url: "${createLink(controller:'index', action:'isLogin')}",
			type: "POST",
			dataType: "html"
		}).done(function(result){
			if(result=="success"){
				document.getElementById('commentCnt').readOnly=false;
				document.getElementById('commentCnt').value='';
				document.getElementById('showComment').setAttribute("href","javascript:addComment()");
			}else{
				document.getElementById('showComment').setAttribute("href","javascript:");
			}
			//alert(result);
		}).fail(function(jqXHR, textStatus){
			alert( "Request failed: " + textStatus );
		});
	}
	isLogin();

	var appendNum =0;
	
	function addComment(){
		var commentCnt = $("#commentCnt").val();
		if(commentCnt.length<5){
			alert("评论内容至少5个字");
			return false;
		}
		if(appendNum>0){
			alert("评论内容超出"+appendNum+"字");
			return false;
		}
		
		$.ajax({
			url: "${createLink(controller:'proComments', action:'add')}",
			type: "POST",
			data: { proId : proId ,commentCnt : commentCnt },
			dataType: "html"
		}).done(function(result){
			if(result=="success"){
				document.getElementById('commentCnt').value='';
				appendNum = 0;
				loadComment();
			}else{
				alert('请登录重试');
				document.getElementById('commentCnt').value='';
				appendNum = 0;
			}
		}).fail(function(jqXHR, textStatus){
			alert( "Request failed: " + textStatus );
		});
	}

	function deleteComment(id){
		if(!confirm('你确定删除吗？')){
			return false;
		}
		$.ajax({
			url: "${createLink(controller:'proComments', action:'del')}",
			type: "POST",
			data: { cId : id },
			dataType: "html"
		}).done(function(result){
			//alert(result);
			//$(obj).html(result)
			loadComment();
		}).fail(function(jqXHR, textStatus){
			alert( "Request failed: " + textStatus );
		});
	}
	
	</script>
	
	<script type="text/javascript"> 
  var txtobj={
   divName:"tb-add-comments", //外层容器的class
   textareaName:"chackTextarea", //textarea的class
   numName:"num", //数字的class
   num:400 //数字的最大数目
  }
  
  var textareaFn=function(){
   //定义变量
   var $onthis;//指向当前
   var $divname=txtobj.divName; //外层容器的class
   var $textareaName=txtobj.textareaName; //textarea的class
   var $numName=txtobj.numName; //数字的class
   var $num=txtobj.num; //数字的最大数目
   
   function isChinese(str){  //判断是不是中文
    var reCh=/[u00-uff]/;
    return !reCh.test(str);
   }
   function numChange(){
    var strlen=0; //初始定义长度为0
    var txtval = $.trim($onthis.val());
    for(var i=0;i<txtval.length;i++){
     if(isChinese(txtval.charAt(i))==true){
      strlen=strlen+2;//中文为2个字符
     }else{
      strlen=strlen+1;//英文一个字符
     }
    }
    strlen=Math.ceil(strlen/2);//中英文相加除2取整数
    appendNum = 0;
    if($num-strlen<0){
     appendNum = Math.abs($num-strlen);
     $par.html("超出 <b style='color:red;font-weight:lighter' class="+$numName+">"+appendNum+"</b> 字"); //超出的样式
    }
    else{
     $par.html("还可以输入 <b class="+$numName+">"+($num-strlen)+"</b> 字"); //正常时候
    }
    $b.html($num-strlen);
   }
   $("."+$textareaName).live("focus",function(){
    $b=$(this).parents("."+$divname).find("."+$numName); //获取当前的数字
    $par=$b.parent(); 
    $onthis=$(this); //获取当前的textarea
    var setNum=setInterval(numChange,50);
   });
  }     
  textareaFn();
</script>
</body>
</html>
