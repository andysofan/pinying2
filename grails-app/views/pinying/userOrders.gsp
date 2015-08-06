<%@ page import="com.cyberoller.pinying.ApDateTimeUtil" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="pinying"/>
	<title>我的订单~Best Gift</title>
	<link rel="stylesheet" href="${resource(dir:"css/pinying", file:"static.css")}" />
	
	<script type="text/javascript">
	function timebetween(datetime,id){
		var date3 = new Date().getTime()-datetime;  //时间差的毫秒数
		if(date3<3600*1000*0.5){
			return true;
		}
		return false;
	}
	function rightDel(startDate,id){
		var datetime = new Date(startDate.replace("-", "/")).getTime();
		if(timebetween(datetime,id)){
			document.write("<span class='delete' onclick='javascript:delorder("+datetime+","+id+")'>删除</span>");
		}
		return false;
	}
</script>
</head>
<body>
	<div class="catbox">
	
	<div>
	<form>
		
	</form>
	</div>
	
	  <table id="cartTable">
	    <thead>
	      <tr>
	        <th>订单信息</th>
	        <th>收货人</th>
	        <th>手机</th>
	        <th>地址</th>
	        <th>订单金额</th>
	        <th>
		        <select id="q_date" name ="q_date"  style="width:120px;font-size:12px" >
				</select>
			</th>
			<th>操作</th>
	      </tr>
	    </thead>
	    
	    <tbody>
	      <g:each in="${list}" status="i" var="order">
	      <tr>
	        <td > ${order?.id }</td>
	        <td > ${order?.consigneeName }</td>
	        <td > ${order?.consigneeMobile }</td>
	        <td > ${order?.consigneeAddress }</td>
	        <td > ${order?.price }</td>
	        <td><g:formatDate date="${order.lastUpdated}" /></td>
	        <td class="operation">
	        	<script>
	        	rightDel("<g:formatDate date="${order.lastUpdated}" />",${order?.id });
	        	</script>
	        	<input type="hidden" value="${order?.id}"/>
	        </td>
	      </tr>
	      
	      <tr>
	        <td class="goods" colspan="7" >
	        <g:each in="${order.details}" status="j" var="detail">
				<a  href="${createLink(controller:'index', action:'product', id:detail?.good?.id)}" title="${detail.xname } (${detail.nums }件)" >
		        <img alt="" src="<g:resource dir="images/pinying/images" file="${detail?.xthumbnail}" />"  />
		        </a>
			</g:each>
	        </td>
	      </tr>
	      
	      </g:each>
	      
	    </tbody>
	  </table>
	  <div class="pagelist mt10 clearFix">
		<div class="fr">
		<g:paginate total="${totalCount}" params="${filterParams?filterParams:params}" />
		</div>
	</div>
	</div>
<script type="text/javascript">
function load(){
	//var now = new Date();
	//var currentYear = now.getFullYear();
	//var minYear = 2015;
	
	var date = [{value:'all',text:'所有订单'},{value:'3m',text:'最近3个月'}];
	//var len = currentYear-minYear;
	//for(i=0;i<=len;i++){
	//	date.push({value:currentYear-i,text:currentYear+'年'});
	//}
	var q_date = '${params.q_date}';
	var q_dateObj = $('#q_date');
	var index = 0;
	for(var i=0;i<date.length;i++){
		if(q_date==date[i].value){
			index = i;
		}
		q_dateObj.append('<option value="'+date[i].value+'">'+date[i].text+'</option>');  
	}
	q_dateObj.get(0).selectedIndex=index;//index为索引值 
	
	q_dateObj.change(function(){//select选中项改变时触发
		var href="${createLink(controller:'proOrder', action:'list')}";
		href+="?q_date=" + q_dateObj.val();
		window.location.href = href;
	});    
}
load();

function delorder(datetime,id){
	if(!timebetween(datetime,id)){
		alert("超过30分钟不能删除");
		location.reload(); 
		return false;
	}
	var conf = confirm('确定删除该订单？');
	if(conf){
		var href="${createLink(controller:'proOrder', action:'deleteOrder')}";
		href+="?id=" + id;
		window.location.href = href;
	}
}
</script>
</body>
</html>
