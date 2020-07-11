<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/music.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<title>用户评论</title>
<script type="text/javascript">
	function message_v() {
		if ($("#userid").val() == "") {
			alert("请先登录");
		} else {
			$("#message-form").submit();
		}
	}
	function message_r() {
		if ($("#userid").val() == "") {
			alert("请先登录");
		} else {
			$("#return-form").submit();
		}
	}
	function message_return(id){
		if($("#message_return"+id).css("display")=="none"){
			$("#message_return"+id).css("display","block");
			if($("#message_return"+id).find("div").length==1){
				$.ajax({url:"list_message.action",data:{"messageCustom.reply":id},success:function(result){
					for(var i=0;i<result.length;i++){
						var div="<div class='row'><div class='col-md-2'><img src="
						+result[i].user.photo+" class='img-circle' width='50px' height='50px' /></div><div class='col-md-7'><div class='row' style='margin-top: 0;''> <label style='color: #46B8DA;'> 用户名: </label>"
						+result[i].user.name+"</div><div class='row' style='margin-top: 0;'><label>"
						+result[i].comment+"</label></div><div class='row' style='margin-top: 10px;'>"
						+timeToString(result[i].time)+"</div></div></div><hr>"
						$("#message_return"+id).append(div);
						}
					}
				});
			}
			}else{
			$("#message_return"+id).css("display","none");
			}
	}
	//json数字日期转换成yyyy-mm-dd
	function timeToString(time) {
		var datetime = new Date();
		datetime.setTime(time);
		var year = datetime.getFullYear();
		var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1)
		: datetime.getMonth() + 1;
		var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime
		.getDate();
		var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime
		.getHours();
		var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes()
		: datetime.getMinutes();
		var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds()
		: datetime.getSeconds();
		return year + "-" + month + "-" + date;
		}
</script>
</head>
<body>
	<main role="main">
	<div class="container">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active"><label
				style="font-size: 20px;"> 留言列表 </label></li>
		</ol>
		<div class="row">
			<label style="font-size: 20px;"> 发表评论 </label>
		</div>
		<div class="row">
			<div class="col-md-1" style="text-align: center;">
				<img src="${sessionScope.musicCustom.photo }" width="60px" height="60px"
					class="img-circle" /> <br> <br> <label>${sessionScope.musicCustom.name }</label>
			</div>
			<div class="col-md-7">
				<form role="form" id="message-form" action="add_message.action">
					<input type="hidden" name="userid"
						value="${sessionScope.userCustom.userid }" id="userid"> <input
						type="hidden" name="musicid"
						value="${sessionScope.musicCustom.musicid }"> <input
						type="hidden" name="reply" value="0">
					<div class="form-group">
						<label for="name">留言</label> <input type="text"
							class="form-control" name="comment" placeholder="请输入名称">
					</div>
					<input type="button" class="btn btn-default" value="留言"
						onclick="message_v()" />
				</form>
			</div>
		</div>
		<hr />
		<div class="row">
			<label style="font-size: 20px;"> 精彩评论 </label>
		</div>
		<c:forEach items="${pageBean.listT }" var="messageCustom"
			varStatus="status">
			<div class="row">
				<div class="col-md-1">
					<img src="${messageCustom.user.photo }" class="img-circle"
						width="60px" height="60px" />
				</div>
				<div class="col-md-8">
					<div class="row" style="margin-top: 0;">
						<label style="color: #46B8DA;"> 用户名: </label>
						${messageCustom.user.name }
					</div>
					<div class="row" style="margin-top: 0;">
						<label>${messageCustom.comment }</label>
					</div>
					<div class="row" style="margin-top: 10px;">
						<label> 时间:<fmt:formatDate value="${messageCustom.time }"
								pattern="yyyy-MM-dd" /></label> <a href="javscrpt:;"
							onclick="message_return(${messageCustom.messageid})">查看回复</a>
					</div>

					<div class="message" id="message_return${messageCustom.messageid}">
						<form action="add_message.action" id="return-form">
							<input type="hidden" name="userid"
								value="${sessionScope.userCustom.userid }" id="userid">
							<input type="hidden" name="musicid"
								value="${sessionScope.musicCustom.musicid }"> <input
								type="hidden" name="reply" value="${messageCustom.messageid}">
							<div class="form-group">
								<label for="name">回复</label> <input type="text"
									class="form-control" name="comment" placeholder="请输入名称">
							</div>
							<input type="button" class="btn btn-default" value="留言"
								onclick="message_r()" />
						</form>
						<hr />
					</div>
				</div>
			</div>
			<hr>
		</c:forEach>
		<div class="row" style="text-align: center;">
			<ul class="pagination">
				<c:if test="${pageBean.currPage!=1 }">
					<li><a
						href="user_message.action?currPage=${pageBean.currPage-1 }&&messageCustom.musicid=${sessionScope.musicCustom.musicid }">&laquo;</a></li>
				</c:if>
				<c:forEach begin="1" end="${pageBean.totalPage }" var="totalPage">
					<c:if test="${pageBean.currPage==totalPage }">
						<li><a><c:out value="${totalPage }" /></a></li>
					</c:if>
					<c:if test="${pageBean.currPage!=totalPage }">
						<li><a
							href="user_message.action?currPage=${totalPage }&&messageCustom.musicid=${sessionScope.musicCustom.musicid }"><c:out
									value="${totalPage }" /></a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pageBean.currPage!=pageBean.totalPage }">
					<li><a
						href="user_message.action?currPage=${pageBean.currPage+1 }&&messageCustom.musicid=${sessionScope.musicCustom.musicid }">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	</main>
	<div class="row footer">
		<div class="container">
			<p>本系统为许剑峰所有</p>
		</div>
	</div>
</body>
</html>
