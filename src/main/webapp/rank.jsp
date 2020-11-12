<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/music.css"/>
		<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/music.js"></script>
	</head>
	<body>
		<div class="row" style="margin-top: 50px;">
			<div class="col-md-1"></div>
			<div class="col-md-3" style="padding: 50px;">
				<ul class="list-group">
					<li class="list-group-item"><a href="rank.action?currPage=1&&term=number">热播榜</a></li>
					<li class="list-group-item"><a href="rank.action?currPage=1&&term=musicid">新歌榜</a></li>
					<li class="list-group-item"><a href="#">TOP500</a></li>
					<li class="list-group-item"><a href="#">热搜榜</a></li>
					<li class="list-group-item"><a href="#">热度榜</a></li>
				</ul>
			</div>
			<div class="col-md-6">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>歌名</th>
							<th>歌手</th>
						</tr>
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
												<c:if test="${musicCustom.mv!=null }">
												<a href="javascript:;" onclick="stop_play(${musicCustom.musicid })">mv</a>
												</c:if>
											</div>
										</td>
										<td>${musicCustom.user.name }</td>
									</tr>
						</c:forEach>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="row" style="text-align: center;">
			<ul class="pagination">
				<c:if test="${pageBean.currPage!=1 }">
					<li><a
						href="rank.action?currPage=${pageBean.currPage-1 }&&term=${term }">&laquo;</a></li>
				</c:if>
				<c:forEach begin="1" end="${pageBean.totalPage }" var="totalPage">
					<c:if test="${pageBean.currPage==totalPage }">
						<li><a><c:out value="${totalPage }" /></a></li>
					</c:if>
					<c:if test="${pageBean.currPage!=totalPage }">
						<li><a
							href="rank.action?currPage=${totalPage }&&term=${term }"><c:out
									value="${totalPage }" /></a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pageBean.currPage!=pageBean.totalPage }">
					<li><a
						href="rank.action?currPage=${pageBean.currPage+1 }&&term=${term }">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="row footer">
			<div class="container">
				<p>本系统为许剑峰所有</p>
			</div>
		</div>
	</body>
</html>
