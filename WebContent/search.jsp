<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/music.css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/music.js"></script>
</head>
<body>
	<div class="row">
		<div class="col-sm-4">
			<p style="float: right; margin-top: 30px; font-size: 20px;">搜索：</p>
		</div>
		<div class="col-sm-4">
			<div class="input-group" style="margin: 30px 0px;">
				<input type="text" id="searchText" class="form-control"
					onkeydown="onKeyDown(event)" /> <span class="input-group-addon"
					onclick="search()"><i class="glyphicon glyphicon-search"></i></span>
			</div>
		</div>
	</div>
	<div class="row" style="padding: 50px;">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>歌名</th>
					<th>歌手</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</body>
<script>
	$("#searchText").val(parent.$("#keyword").val());
	function onKeyDown(event) {
		if (event.keyCode == 13)
			search();
	}
	function search() {
		parent.$("#keyword").val($("#searchText").val());
		parent.ajax();
	}
	
</script>
</html>
