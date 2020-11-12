<%@ page import="java.util.ResourceBundle" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	// properties 配置文件名称
	ResourceBundle res = ResourceBundle.getBundle("db");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/music.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/music.js"></script>
<title>歌单详情页</title>
<script type="text/javascript">
	$.ajax({
				url : "findCollect.action",
				data : {
					"collectCustom.userid" :${sessionScope.userCustom.userid==null?0:sessionScope.userCustom.userid },
					"collectCustom.songmenuid" :${sessionScope.songMenuCustom.songmenuid==null?0:sessionScope.songMenuCustom.songmenuid }
				},
				success:function(result){
					if(result){$("#uncollect").hide();$("#collect").show();}
					else{$("#collect").hide();$("#uncollect").show();}
				},
				error:function(){
					$("#collect").hide();
				}
			});
</script>
</head>
<body>
	<!--
        	作者：1205219294@qq.com
        	时间：2017-10-12
        	描述：歌手详细信息
        -->
	<main role="main">
	<div class="container">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="songlist.html"><label
					style="font-size: 20px;" class="shouxing">歌单列表</label></a></li>
			<li class="breadcrumb-item active"><label
				style="font-size: 20px;">歌单详情</label></li>
		</ol>
		<div class="row">
			<div class="col-md-2">
				<img src="images/cover2.jpg" style="margin-top: 35px;"
                     class="img-responsive img-circle" width="200px" height="200px" />
			</div>
			<div class="col-md-4" style="margin: 30px 90px;">
				<div class="row">
					<label style="font-size: 20px;"> 歌单名: </label>
					${sessionScope.songMenuCustom.menuname }
				</div>
				<div class="row">
					<label style="font-size: 20px;"> 创建人: </label>
					${sessionScope.songMenuCustom.user.name }
				</div>
				<div class="row">
					<label style="font-size: 20px;"> 主题: </label>
					${sessionScope.songMenuCustom.theme }
				</div>
				<div class="row">
					<label style="font-size: 20px;"> 语言: </label>
					${sessionScope.songMenuCustom.language }
				</div>
				<div class="row">
					<label style="font-size: 20px;"> 风格: </label>
					${sessionScope.songMenuCustom.style }
				</div>
				<div class="row">
					<label style="font-size: 20px;"> 创建时间: </label>
					<fmt:formatDate value="${sessionScope.songMenuCustom.time }"
						pattern="yyyy-MM-dd" />
				</div>
			</div>
			<div class="col-md-2">
				<div style="padding-top: 180px;">
					<input type="button" id="uncollect" value="收藏"
						class="btn btn-default"
						onclick="collect(${sessionScope.songMenuCustom.songmenuid })" />
					<input type="button" id="collect" value="已收藏"
						class="btn btn-primary active"
						onclick="uncollect(${sessionScope.songMenuCustom.songmenuid })" />
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
								<c:forEach items="${sessionScope.list_songlist }" var="songlist"
									varStatus="status">
									<tr  id='tr1'>
										<td>${status.count }</td>
										<td>${songlist.music.name }
											<div class="Btmusic">
												<img src="img/play_1.png"
													onclick="play_music('${songlist.music.musicid}','<%=res.getString("filegoldeurl")%>${songlist.music.photo}','<%=res.getString("filegoldeurl")%>${songlist.music.path }','${songlist.music.name }')" />
												<c:if test="${sessionScope.userCustom!=null }"> <img src="img/add.png"
													onclick="add_songmenu(${sessionScope.userCustom.userid},${songlist.music.musicid })" />
													</c:if>
												<img src="img/download.png" onclick="downloadmp3('<%=res.getString("filegoldeurl")%>${songlist.music.path }')" />
											</div>
										</td>
										<td>${songlist.music.user.name }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
	<!--
        	作者：342182931@qq.com
        	时间：2019-10-10
        	描述：页脚
        -->
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
<script type="text/javascript">
function collect(songmenuid){
	var userid="<c:out value="${sessionScope.userCustom.userid }"/>";
	if(userid==""||userid==null){
		alert("请先登录");
	}else{
		window.location.href="addCollect.action?userid="+userid+"&songmenuid="+songmenuid;
	}
}
function uncollect(songmenuid){
	var userid="<c:out value="${sessionScope.userCustom.userid }"/>";
	if(userid==""||userid==null){
		alert("请先登录");
	}else{
		window.location.href="deleteCollect.action?collectCustom.userid="+userid+"&collectCustom.songmenuid="+songmenuid;
	}
}
</script>
</html>