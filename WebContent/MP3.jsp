<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>音乐播放器</title>
<link rel="stylesheet" type="text/css" href="css/audio.css">
<link rel="stylesheet" type="text/css" href="css/music.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/music.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#iframe").height($(window).height() - $("#navbar").height() - 50);
		$(window).resize(
				function() {
					$("#iframe").height(
							$(window).height() - $("#navbar").height() - 50);
				});
		$("#leadmp3").change(function() {
			var objUrl = getObjectURL(this.files[0]);
			/* 向歌单中添加新曲目，第二个参数true为新增后立即播放该曲目，false则不播放 */
			audioFn.newSong({
				'cover' : 'img/cover.jpg',
				'src' : objUrl,
				'title' : this.files[0].name
			}, false);
		});
	});
	function change(url) {
		$("#iframe").attr("src", url);
	}
</script>
<style type="text/css">
*[hidden] {
	display: none;
}
</style>
</head>
<body style="height: auto; overflow: hidden; margin: 0; padding: 0;">
	<!--
			作者：xujianfeng
			时间：2020-02-06
			描述：导航栏
		-->
	<nav class="navbar navbar-inverse" style="margin: 0px;"
		role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="javascript:;"
					onclick="change('rank_index_music.action')">峰哥音乐</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="javascript:;"
						onclick="change('rank_index_music.action')">首页</a></li>
					<li><a href="javascript:;"
						onclick="change('rank.action?currPage=1')">排行榜</a></li>
					<li><a href="javascript:;"
						onclick="change('findSinger.action?currPage=1')">歌手</a></li>
					<li><a href="javascript:;" onclick="change('player.html')">播放器</a></li>
					<li><a href="javascript:;"
						onclick="change('findSongMenuByPage.action?currPage=1')">歌单</a></li>
				</ul>
				<form id="Searchfrom" class="navbar-form navbar-left" role="search"
					action="search.jsp" target="iframe">
					<div class="form-group">
						<input type="text" id="keyword" class="form-control"
							placeholder="请输入关键字" onkeydown="return event.keyCode != 13;">
					</div>
					<button type="button" class="btn btn-default" onclick="ajax()">搜索</button>
				</form>
				<div class="navbar-right" style="padding-right: 20px;">
					<ul class="nav navbar-nav">
						<c:if test="${sessionScope.userCustom==null }">
							<li><a data-toggle="modal" data-target="#register">注册</a></li>
							<li><a data-toggle="modal" data-target="#login">登录</a></li>
						</c:if>
						<c:if test="${sessionScope.userCustom!=null }">
							<li><img src="${sessionScope.userCustom.photo }"
								class="img-circle" style="height: 50px; width: 50px;"></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">${sessionScope.userCustom.name } <b
									class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a data-toggle="modal" data-target="#person">个人信息</a></li>
									<li class="divider"></li>
									<li><a href="javascript:;"
										onclick="change('person_listmenu.action?userid=${sessionScope.userCustom.userid }')">我的收藏</a></li>
									<li class="divider"></li>
									<li><a data-toggle="modal" data-target="#update-password">修改密码</a></li>
									<li class="divider"></li>
									<li><a href="quite.action">退出</a></li>
								</ul></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<iframe scrolling="yes" rameborder="0" src="rank_index_music.action"
		style="width: 100%;" id="iframe" name="iframe"></iframe>
	<!-- 播放器 -->
	<div class="audio-box">
		<div class="audio-container">
			<a href="music_message.action?id=12" id="message_button" target="iframe" title="点击查看留言信息"><div class="audio-cover"></div></a>
			<div class="audio-view">
				<h3 class="audio-title">未知歌曲</h3>
				<div class="audio-body">
					<div class="audio-backs">
						<div class="audio-this-time">00:00</div>
						<div class="audio-count-time">00:00</div>
						<div class="audio-setbacks">
							<i class="audio-this-setbacks"> <span class="audio-backs-btn"></span>
							</i> <span class="audio-cache-setbacks"> </span>
						</div>
					</div>
				</div>
				<div class="audio-btn">
					<div class="audio-select">
						<div class="audio-prev"></div>
						<div class="audio-play"></div>
						<div class="audio-next"></div>
						<div class="audio-menu"></div>
						<div class="audio-volume"></div>
					</div>
					<div class="audio-set-volume">
						<div class="volume-box">
							<i><span></span></i>
						</div>
					</div>
					<div class="audio-list">
						<div class="audio-list-head">
							<p>峰哥音乐</p>
							<span style="margin-right: 40px;"><a data-toggle="modal"
								data-target="#leading">导入</a></span> <span class="menu-close">关闭</span>
						</div>
						<ul class="audio-inline">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 模态框（Modal） -->
	<!-- 导入窗口-->
	<div id="leading" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h1 class="text-center">请选择文件</h1>
				</div>
				<div class="modal-body">
					<input id="leadmp3" type="file" multiple="multiple" />
					<div class="text-right">
						<button class="btn btn-danger" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 注册窗口 -->
	<div id="register" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h1 class="text-center">注册</h1>
				</div>
				<div class="modal-body">
					<form class="form-group" action="register.action">
						<div class="form-group">
							<label for="">用户名</label> <input class="form-control" type="text"
								name="username" placeholder="6-15位字母或数字">
						</div>
						<div class="form-group">
							<label for="">密码</label> <input class="form-control"
								name="password" type="password" placeholder="至少6位字母或数字">
						</div>
						<div class="form-group">
							<label for="">姓名</label> <input class="form-control" type="text"
								name="name">
						</div>
						<div class="form-group">
							<label for="">邮箱</label> <input class="form-control" type="email"
								name="email" placeholder="例如:123@123.com">
						</div>
						<div class="form-group">
							<label for="">电话</label> <input class="form-control" type="text"
								name="tel">
						</div>
						<div class="text-right">
							<button class="btn btn-primary" type="submit">提交</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
						<a href="" data-toggle="modal" data-dismiss="modal"
							data-target="#login">已有账号？点我登录</a>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 登录窗口 -->
	<div id="login" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h1 class="text-center">登录</h1>
				</div>
				<div class="modal-body">
					<form class="form-group" action="login.action">
						<div class="form-group">
							<label for="">用户名</label> <input class="form-control" type="text"
								name="userCustom.username" placeholder="请输入用户名">
						</div>
						<div class="form-group">
							<label for="">密码</label> <input class="form-control"
								name="userCustom.password" type="password" placeholder="请输入密码">
						</div>
						<div class="text-right">
							<button class="btn btn-primary" type="submit">登录</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
						<a href="" data-toggle="modal" data-dismiss="modal"
							data-target="#register">还没有账号？点我注册</a>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--个人信息页面-->
	<div id="person" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h1 class="text-center">个人信息</h1>
				</div>
				<div class="modal-body">
					<form class="form-group" action="updateImg.action"
						enctype="multipart/form-data" method="post">
						<div class="col-sm-4" style="text-align: center;">
							<input type="hidden" name="id"
								value="${sessionScope.userCustom.userid }"> <img
								src="${sessionScope.userCustom.photo }" id="imgsrc"
								height="100px" width="100px" class="img-circle"><br /> <br />
							<input id="imgfile" name="file" type="file" id="file"
								style="display: none;" />
							<button type="button" class="btn  btn-default"
								onclick="changeimg()">选择头像</button>
							<button type="submit" class="btn  btn-default">上传头像</button>
						</div>
						<div class="col-sm-8">
							<div class="form-group">
								<label for="">昵称</label> ${sessionScope.userCustom.name }
							</div>
							<div class="form-group">
								<label for="">性别</label>
								<c:if test="${sessionScope.userCustom.sex==1 }">男</c:if>
								<c:if test="${sessionScope.userCustom.sex==2 }">男</c:if>
							</div>
							<div class="form-group">
								<label for="">年龄</label> ${sessionScope.userCustom.age }
							</div>
							<div class="form-group">
								<label for="">生日</label>
								<fmt:formatDate value="${sessionScope.userCustom.birthday }"
									pattern="yyyy-MM-dd" />
							</div>
							<div class="form-group">
								<label for="">地址</label> ${sessionScope.userCustom.adress }
							</div>
							<div class="form-group">
								<label for="">个人简介</label> ${sessionScope.userCustom.note }
							</div>
						</div>
						<div class="text-right">
							<button class="btn btn-primary" type="button" data-toggle="modal"
								data-dismiss="modal" data-target="#person-update">编辑</button>
							<button class="btn btn-danger" data-dismiss="modal">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--个人信息修改页面-->
	<div id="person-update" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h1 class="text-center">个人信息</h1>
				</div>
				<div class="modal-body">
					<form class="form-group" action="updateImg.action">
						<input type="hidden" name="id"
							value="${sessionScope.userCustom.userid }">
						<div class="form-group">
							<label for="">昵称</label> <input type="text" class="form-control"
								name="name" value="${sessionScope.userCustom.name }" />
						</div>
						<div class="form-group">
							<label for="">性别</label> <input type="radio" name="sex" value="1"
								<c:if test="${sessionScope.userCustom.sex==1 }">checked</c:if>>男
							<input type="radio" name="sex" value="2"
								<c:if test="${sessionScope.userCustom.sex==2 }">checked</c:if>>女
						</div>
						<div class="form-group">
							<label for="">年龄</label> <input type="text" class="form-control"
								name="age" value="${sessionScope.userCustom.age }" />
						</div>
						<div class="form-group">
							<label for="">生日</label>
							<script src="/MusicPlayer_SSM/js/laydate/laydate.js"></script>
							<input type="text" class="form-control" name="birthday"
								id="datetime"
								value="<fmt:formatDate value="${sessionScope.userCustom.birthday }"
								pattern="yyyy-MM-dd" />"
								data-validate="required:日期不能为空"
								style="padding: 10px !important; height: auto !important; border: 1px solid #ddd !important;" />
							<script type="text/javascript">
								laydate.render({
									elem : "#datetime",
									istime : true,
									trigger : 'click'
								});
							</script>
						</div>
						<div class="form-group">
							<label for="">地址</label> <input type="text" class="form-control"
								name="adress" value="${sessionScope.userCustom.adress }" />
						</div>
						<div class="form-group">
							<label for="">个人简介</label>
							<textarea class="form-control" rows="3" name="note">${sessionScope.userCustom.note }</textarea>
						</div>
						<div class="text-right">
							<button class="btn btn-primary" type="submit">确定</button>
							<button class="btn btn-danger" data-dismiss="modal">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--修改密码-->
	<div id="update-password" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h1 class="text-center">修改密码</h1>
				</div>
				<div class="modal-body">
					<form class="form-group" action="updatePassword.action">
						<input type="hidden" name="id" value="${userCustom.userid }">
						<div class="form-group">
							<label for="">旧密码</label> <input class="form-control"
								name="password" id="password" type="password"
								placeholder="请输入旧密码">
						</div>
						<div class="form-group">
							<label for="">新密码</label> <input class="form-control"
								name="password1" id="password1" type="password"
								placeholder="请输入新密码"><span id="tip1"></span>
						</div>
						<div class="form-group">
							<label for="">再次输入</label> <input class="form-control"
								name="password2" id="password2" type="password"
								placeholder="再次输入密码"><span id="tip2"></span>
						</div>
						<div class="text-right">
							<button class="btn btn-primary" type="submit">修改</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/audio.js"></script>
<script type="text/javascript">
	var hashsong = "";
	var song = [ {
		'cover' : 'http://imge.kugou.com/stdmusic/20171208/20171208162911674095.jpg',
		'src' : '/upload/mp3/王力宏、谭维维 - 缘分一道桥.mp3',
		'title' : '王力宏、谭维维 - 缘分一道桥'
	} ];

	var audioFn = audioPlay({
		song : song,
		autoPlay : false
	//是否立即播放第一首，autoPlay为true且song为空，会alert文本提示并退出
	});

	/* 向歌单中添加新曲目，第二个参数true为新增后立即播放该曲目，false则不播放 */
	//			audioFn.newSong({
	//				'cover': '',
	//				'src': '',
	//				'title': ''
	//			}, false);
	/* 暂停播放 */
	//audioFn.stopAudio();
	/* 开启播放 */
	//audioFn.playAudio();
	/* 选择歌单中索引为3的曲目(索引是从0开始的)，第二个参数true立即播放该曲目，false则不播放 */
	//audioFn.selectMenu(3, true);
	/* 查看歌单中的曲目 */
	//console.log(audioFn.song);
	/* 当前播放曲目的对象 */
	//console.log(audioFn.audio);
</script>

</html>