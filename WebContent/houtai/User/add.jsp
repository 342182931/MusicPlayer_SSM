<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="/css/pintuer.css">
<link rel="stylesheet" href="/css/admin.css">
<script src="/js/jquery.js"></script>
<script src="/js/pintuer.js"></script>
<script src="/js/admin.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>增加内容</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" enctype="multipart/form-data" action="../addUser.action">
				<div class="form-group">
					<div class="label">
						<label>用户名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="username"
							data-validate="required:请输入用户名" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>密码：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="password"
							data-validate="required:请输入密码" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>头像：</label>
					</div>
					<div class="field">
						<input type="text" id="url1" name="img" class="input tips"
							style="width: 25%; float: left;"
							value="/MusicPlayer_SSM/img/photo.jpeg" data-toggle="hover"
							data-place="right" data-image="/MusicPlayer_SSM/img/photo.jpeg" />
						<input type="button" class="button bg-blue margin-left"
							id="image1" value="+ 浏览上传" style="float: left;"> <input name="file"
							type="file" value="E:\jaee-over\MusicPlayer_SSM\WebContent\img\photo.jpeg" hidden
							id="file" />
						<div class="tipss">图片尺寸：500*500</div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>真实姓名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="name"
							data-validate="required:请输入姓名" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>年龄：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="age" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>性别：</label>
					</div>
					<div class="field">
						<input type="radio" name="sex" value=1 checked>男 <input
							type="radio" name="sex" value=2>女
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>手机号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="tel" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>邮箱：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="email" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>地址：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="adress" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>生日：</label>
					</div>
					<div class="field">
						<script src="/MusicPlayer_SSM/js/laydate/laydate.js"></script>
						<input type="text" class="laydate-icon input w50" name="birthday"
							id="datetime" value="" data-validate="required:日期不能为空"
							style="padding: 10px !important; height: auto !important; border: 1px solid #ddd !important;" />
						<div class="tips"></div>
						<script type="text/javascript">
							laydate.render({
								elem : "#datetime",
								istime : true,
								trigger : 'click'
							});
						</script>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>描述：</label>
					</div>
					<div class="field">
						<textarea class="input" name="note" style="height: 90px;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<input type="text" name="orright" value="1" hidden>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>