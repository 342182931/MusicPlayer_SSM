<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/music.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/music.js"></script>
<title></title>
</head>
<body>
	<!--
        	作者：342183931@qq.com
        	时间：2017-10-12
        	描述：歌手详细信息
        -->
	<main role="main">
	<div class="container">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="singer.html"><label
					style="font-size: 20px;" class="shouxing">歌手列表</label></a></li>
			<li class="breadcrumb-item active"><label
				style="font-size: 20px;">歌手详情</label></li>
		</ol>
		<div class="row">
			<div class="col-md-2">
				<img src="images/cover2.jpg" style="margin-top: 35px;"
					class="img-responsive img-circle" width="200px" height="200px" />
			</div>
			<div class="col-md-4 " style="margin: 30px 90px;">
				<div class="row">
					<label style="font-size: 20px;">歌手:</label>
					${sessionScope.singer.name }
				</div>
				<div class="row">
					<label style="font-size: 20px;">性别:</label>
					<c:if test="${sessionScope.singer.sex==1 }">男</c:if>
					<c:if test="${sessionScope.singer.sex==2 }">女</c:if>
				</div>
				<div class="row">
					<label style="font-size: 20px;">年龄:</label>
					${sessionScope.singer.age }
				</div>
				<div class="row">
					<label style="font-size: 20px;">歌手描述:</label>
					${sessionScope.singer.note }
				</div>
			</div>
		</div>
	</div>
	<hr />
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">热门歌曲</div>
					<div class="panel-body">
						<table class="table table-striped table-hover table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>歌名</th>
									<th>歌手</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageBean.listT }" var="musicCustom"
									varStatus="status">
									<tr id="tr1">
										<td>${status.count }</td>
										<td>${musicCustom.name }
										<div class="Btmusic">
												<img src="img/play_1.png"
													onclick="play_music('${musicCustom.musicid}','${musicCustom.photo}','${musicCustom.path }','${musicCustom.name }')" />
												<c:if test="${sessionScope.userCustom!=null }"> <img src="img/add.png"
													onclick="add_songmenu(${sessionScope.userCustom.userid},${songlist.music.musicid })" />
													</c:if>
												<img src="img/download.png" onclick="downloadmp3('${songlist.music.path }')" />
											</div>
										</td>
										<td>${musicCustom.user.name }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="text-align: center;">
			<ul class="pagination">
				<c:if test="${pageBean.currPage!=1 }">
					<li><a
						href="findmusicbysinger.action?currPage=${pageBean.currPage-1 }&&musicCustom.userid=${sessionScope.singer.userid }">&laquo;</a></li>
				</c:if>
				<c:forEach begin="1" end="${pageBean.totalPage }" var="totalPage">
					<c:if test="${pageBean.currPage==totalPage }">
						<li><a><c:out value="${totalPage }" /></a></li>
					</c:if>
					<c:if test="${pageBean.currPage!=totalPage }">
						<li><a
							href="findmusicbysinger.action?currPage=${totalPage }&&musicCustom.userid=${sessionScope.singer.userid }"><c:out
									value="${totalPage }" /></a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pageBean.currPage!=pageBean.totalPage }">
					<li><a
						href="findmusicbysinger.action?currPage=${pageBean.currPage+1 }&&musicCustom.userid=${sessionScope.singer.userid }">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	</main>
	<div class="col-md-12 footer">
		<div class="container">
			<p>本系统为许剑峰所有</p>
		</div>
	</div>
	<!--收藏歌单模态框-->
	<div id="add_songmenu" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
						<input type="hidden" name="musicid" id="musicid" value="">
						<div class="form-group">
							<label for="sel1">收藏歌单:</label> <select class="form-control"
								name="songmenuid" id="sel1">
							</select>
						</div>
						<div class="text-right">
							<input class="btn btn-primary" type="button" onclick="insertCollect()" value="提交"/>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
