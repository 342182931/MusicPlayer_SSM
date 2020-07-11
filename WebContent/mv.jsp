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
<link href="css/video-js.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/video.js"></script>
<script type="text/javascript" src="js/videojs-ie8.js"></script>
<title>用户评论</title>
</head>
<body>
	<main role="main">
	<div class="container">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active"><label
				style="font-size: 20px;"> MV</label></li>
		</ol>
		<div class="row" style="background-color: #269ABC;height: 500px;">
					 <video id="example_video_1" class="video-js vjs-default-skin" autoplay="autoplay"
					      controls preload="none" width="1200" height="500"
					      poster="hangge-clip.png"
					      data-setup="{}">
					    <source src="${musicCustom.mv }" type="video/mp4" />
					    <source src="${musicCustom.mv }" type='video/webm' />
					    <source src="${musicCustom.mv }" type='video/ogg' />
					    <track kind="captions" src="hangge.vtt" srclang="en" label="English" />
					 </video>
				</div>
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
