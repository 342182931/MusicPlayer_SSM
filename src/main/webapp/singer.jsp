<%@ page import="java.util.ResourceBundle" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// properties 配置文件名称
	ResourceBundle res = ResourceBundle.getBundle("db");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/music.css" />
<title></title>
</head>
<body>

	<!--
        	作者：1205219294@qq.com
        	时间：2017-10-10
        	描述：歌手列表
        -->
	<main role="main">
	<div class="container">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active"><label
				style="font-size: 20px;"> 歌手列表 </label></li>
		</ol>
	</div>
	<div class="container" style="text-align: center;">
		<div class="row">
			<c:forEach items="${pageBean.listT }" var="userCustom"
				varStatus="status">
				<div class="col-md-2">
					<a href="findsonglistbyuserid.action?userid=${userCustom.userid }">
						<div class="img-thumbnail bianda">
							<img src="<%=res.getString("filegoldeurl")%>${userCustom.photo }" class="img-responsive"
								width="150px" height="150px" alt="${userCustom.name }"/> <label>
								${userCustom.name } </label>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
		<div class="row" style="text-align: center;">
			<ul class="pagination">
				<c:if test="${pageBean.currPage!=1 }">
					<li><a
						href="findSinger.action?currPage=${pageBean.currPage-1 }">&laquo;</a></li>
				</c:if>
				<c:forEach begin="1" end="${pageBean.totalPage }" var="totalPage">
					<c:if test="${pageBean.currPage==totalPage }">
						<li><a><c:out value="${totalPage }" /></a></li>
					</c:if>
					<c:if test="${pageBean.currPage!=totalPage }">
						<li><a href="findSinger.action?currPage=${totalPage }"><c:out
									value="${totalPage }" /></a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pageBean.currPage!=pageBean.totalPage }">
					<li><a
						href="findSinger.action?currPage=${pageBean.currPage+1 }">&raquo;</a></li>
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
