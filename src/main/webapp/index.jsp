<%@ page import="java.util.ResourceBundle" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8" isELIgnored="false"%>
<%
	// properties 配置文件名称
	ResourceBundle res = ResourceBundle.getBundle("db");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/music.css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/music.js"></script>
<script
	src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style>
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
}
</style>
</head>

<body>
	<!-- 图片轮播 -->
	<div id="myCarousel" class="carousel slide">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="https://static.runoob.com/images/mix/img_fjords_wide.jpg"
					alt="First slide">
			</div>
			<div class="item">
				<img src="https://static.runoob.com/images/mix/img_nature_wide.jpg"
					alt="Second slide">
			</div>
			<div class="item">
				<img
					src="https://static.runoob.com/images/mix/img_mountains_wide.jpg"
					alt="Third slide">
			</div>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!--
			面包屑导航
		-->
	<div class="col-md-9" style="padding-top: 20px;">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active">新歌首发</li>
		</ol>
		<ul class="list-unstyled list-inline imgsize" id="rank_musicid_index">
		<c:forEach items="${pageBean_musicid.listT }" var="musicCustom"
				varStatus="status">
			<li onclick="play_music('${musicCustom.musicid}','<%=res.getString("filegoldeurl")%>${musicCustom.photo}','<%=res.getString("filegoldeurl")%>${musicCustom.path }','${musicCustom.name }')">
				<div class="img-thumbnail bianda">
					<img src="<%=res.getString("filegoldeurl")%>${musicCustom.photo}" class="img-responsive" width="150px"
						height="150px" /> <label>${musicCustom.name } </label>
				</div>
			</li>
			</c:forEach>
		</ul>
		<ol class="breadcrumb">
			<li class="breadcrumb-item active">热门歌单</li>
		</ol>
		<ul class="list-unstyled list-inline imgsize">
			<c:forEach items="${pageBean_songmenu.listT }" var="songmenuCustom"
				varStatus="status">
				<li><a
					href="findSongMenuByIdUser.action?songmenuid=${songmenuCustom.songmenuid }">
						<div class="img-thumbnail bianda">
							<img src="<%=res.getString("filegoldeurl")%>${songmenuCustom.photo }" class="img-responsive" width="150px"
								height="150px" /> <label>${songmenuCustom.menuname }</label>
						</div>
				</a></li>
			</c:forEach>
		</ul>
	</div>
	<div class="col-md-3 listmusic" style="padding-top: 20px;">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active">热播榜单<a href="rank.action?currPage=1" style="float: right;">>></a></li>
		</ol>
		<ul class="list-unstyled" id="rank_number_index">
			<c:forEach items="${pageBean_number.listT }" var="musicCustom"
				varStatus="status">
				<li onclick="play_music('${musicCustom.musicid}','<%=res.getString("filegoldeurl")%>${musicCustom.photo}','<%=res.getString("filegoldeurl")%>${musicCustom.path }','${musicCustom.name }')" style="padding-top:5px;">${status.count }.${musicCustom.name }</li>
			</c:forEach>
		</ul>
	</div>
	<div class="col-md-12 footer">
		<div class="container">
			<p>本系统为许剑峰所有</p>
		</div>
	</div>
</body>
</html>
