<%@ page import="java.util.ResourceBundle" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	// properties 配置文件名称
	ResourceBundle res = ResourceBundle.getBundle("application");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/music.css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/music.js"></script>
</head>
<body>
	<main role="main">
	<div class="container">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active"><label
				style="font-size: 20px;"> 收藏列表 </label></li>
		</ol>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-3" style="padding: 50px;">
			<ul class="list-group">
				<c:forEach items="${sessionScope.list_songmenu }" var="songmenu"
					varStatus="status">
					<li class="list-group-item li_menu"><a
						href="findSongMenuById.action?songmenuid=${songmenu.songmenuid }">
							<label>${songmenu.menuname }</label>
					</a> <c:if
							test="${songmenu.user.userid==sessionScope.userCustom.userid }">
							<a onclick="updatemenu(${songmenu.songmenuid })">编辑</a>
						</c:if></li>
				</c:forEach>
				<li class="list-group-item" style="text-align: center;"><a
					data-toggle="modal" href="#add-songmenu">+</a></li>
			</ul>
		</div>
		<div class="col-md-6">
			<table class="border-songmenu">
				<tr>
					<td rowspan="3"><img class="img-thumbnail"
						src="<%=res.getString("filegoldeurl")%>${sessionScope.personsongMenuCustom.photo }" height="150px"
						width="130"></td>
					<td><label>歌单名</label></td>
					<td>${sessionScope.personsongMenuCustom.menuname }</td>
				</tr>
				<tr>
					<td><label>作者</label></td>
					<td>${sessionScope.personsongMenuCustom.user.name }</td>
				</tr>
				<tr>
					<td><label>创建时间</label></td>
					<td><fmt:formatDate
							value="${sessionScope.personsongMenuCustom.time }"
							pattern="yyyy-MM-dd" /></td>
				</tr>
			</table>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>歌名</th>
						<th>歌手</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sessionScope.person_songlist }" var="songlist"
						varStatus="status">
						<tr id="tr1">
							<td>${songlist.music.name }
								<div class="Btmusic">
									<img src="img/play_1.png"
										onclick="play_music('${songlist.music.musicid}','<%=res.getString("filegoldeurl")%>${songlist.music.photo}','<%=res.getString("filegoldeurl")%>${songlist.music.path }','${songlist.music.name }')" />
								</div>
							</td>
							<td>${songlist.music.user.name }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
	<!--修改密码-->
	<div id="add-songmenu" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h1 class="text-center">添加歌单</h1>
				</div>
				<div class="modal-body">
					<form class="form-group" action="addSongMenu.action">
						<input type="hidden" name="userid" value="${userCustom.userid }">
						<div class="form-group">
							<label for="">歌单名</label> <input class="form-control"
								name="menuname" type="text" placeholder="输入歌单名">
						</div>
						<div class="text-right">
							<button class="btn btn-primary" type="submit">添加</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--修改歌单-->
	<div id="update-songmenu" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h1 class="text-center">修改歌单</h1>
				</div>
				<div class="modal-body">
					<form class="form-group" action="updateSongMenu.action"
						enctype="multipart/form-data">
						<input type="hidden" name="songmenuid" id="songmenuid">
						<div class="col-sm-4" style="text-align: center;">
							<input type="hidden" name="userid"
								value="${sessionScope.userCustom.userid }"> <img
								src="<%=res.getString("filegoldeurl")%>${sessionScope.personsongMenuCustom.photo }" id="imgsrc"
								height="100px" width="100px" class="img-circle"><br /> <br />
							<input id="imgfile" name="file" type="file" id="file"
								style="display: none;" />
							<button type="button" class="btn  btn-default"
								onclick="changeimg()">选择头像</button>
						</div>
						<div class="col-sm-8">
							<div class="form-group">
								<label for="">歌单名</label> <input class="form-control"
									name="menuname" type="text" placeholder="输入歌单名" id="menuname">
							</div>
							<div class="form-group">
								<label for="">主题</label> <input class="form-control"
									name="theme" type="text" id="theme">
							</div>
							<div class="form-group">
								<label for="">风格</label> <input class="form-control"
									name="style" type="text" id="style">
							</div>
							<div class="form-group">
								<label for="">语言</label> <input class="form-control"
									name="language" type="text" id="language">
							</div>
						</div>
						<div class="text-right">
							<button class="btn btn-primary" type="submit">编辑</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</main>
</body>
</body>
</html>
