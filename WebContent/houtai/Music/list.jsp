<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="../css/pintuer.css">
<link rel="stylesheet" href="../css/admin.css">
<link href="../css/bootstrap.css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script src="../js/pintuer.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder"> 内容列表</strong> <a href=""
				style="float: right; display: none;">添加字段</a>
		</div>
		<div class="padding border-bottom">
			<form action="findMusicListByPage.action" id="searchform">
				<ul class="search" style="padding-left: 10px;">
					<li>搜索：<input type="hidden" name="currPage" value="1" /></li>
					<li><input type="text" placeholder="请输入搜索关键字"
						name="musicCustom.name" class="input"
						style="width: 250px; line-height: 17px; display: inline-block" />
						<a href="javascript:void(0)"
						class="button border-main icon-search" onclick="changesearch()">搜索</a>
						&nbsp;&nbsp;</li>
				</ul>
			</form>
		</div>
		<table class="table table-hover text-center">
			<tr>
				<th style="text-align: left; padding-left: 20px;">ID</th>
				<th>图片</th>
				<th>歌名</th>
				<th>作者</th>
				<th>语言</th>
				<th>风格</th>
				<th>大小</th>
				<th>热度</th>
				<th width="310">操作</th>
			</tr>
			<c:forEach var="music" items="${pageBean.listT }">
				<form action="updateMusic.action" id="form${music.musicid }"
					method="get">
					<tr>
						<td style="text-align: left; padding-left: 20px;"><input
							type="checkbox" name="id[]" value="${music.musicid }" /> <input
							type="hidden" name="id" value="${music.musicid }" /> <input
							type="hidden" name="currPage" value="${pageBean.currPage }" /></td>
						<td><img src="${music.photo }" alt="" width="50" style="border-radius:50px;"
							height="50" /></td>
						<td><input style="border: 0px; background: none;" size="5"
							type="text" name="name" value="${music.name }" /></td>
						<td>${music.user.name }</td>
						<td><input style="border: 0px; background: none;" size="5"
							type="text" name=language value="${music.language }" /></td>
						<td><input style="border: 0px; background: none;" size="5"
							type="text" name="style" value="${music.style }" /></td>
						<td><input style="border: 0px; background: none;" size="5"
							type="text" name="size" value="${music.size }" /></td>
						<td><input style="border: 0px; background: none;" size="5"
							type="text" name="number" value="${music.number }" /></td>
						<td><div class="button-group">
								<a class="button border-main" href="javascript:void(0)"
									onclick="update(form${music.musicid })"><span
									class="icon-edit"></span> 修改</a> <a class="button border-red"
									href="javascript:void(0)"
									onclick="return del(${music.musicid},${pageBean.currPage })"><span
									class="icon-trash-o"></span> 删除</a>
									<c:if test="${music.mv==null }">
									<a class="button border-main" href="javascript:void(0)"
									onclick="mv_upload(${music.musicid })"><span
									class="icon-edit"></span>上传MV</a>
									</c:if>
							</div></td>
					</tr>
				</form>
			</c:forEach>
			<tr>
				<td style="text-align: left; padding: 19px 0; padding-left: 20px;"><input
					type="checkbox" id="checkall" /> 全选</td>
				<td colspan="12" style="text-align: left; padding-left: 20px;"><a
					href="javascript:void(0)" class="button border-red icon-trash-o"
					style="padding: 5px 15px;"
					onclick="DelSelect(${pageBean.currPage })"> 删除</a></td>
			</tr>
			<tr>
				<td colspan="13">
					<div class="pagelist">
						<c:if test="${pageBean.currPage!=1 }">
							<a
								href="findMusicListByPage.action?currPage=${pageBean.currPage-1 }">上一页</a>
						</c:if>
						<c:forEach begin="1" end="${pageBean.totalPage }" var="totalPage">
							<c:if test="${pageBean.currPage==totalPage }">
								<span class="current"><c:out value="${totalPage }" /></span>
							</c:if>
							<c:if test="${pageBean.currPage!=totalPage }">
								<a href="findMusicListByPage.action?currPage=${totalPage }"><c:out
										value="${totalPage }" /></a>
							</c:if>
						</c:forEach>
						<c:if test="${pageBean.currPage!=pageBean.totalPage }">
							<a
								href="findMusicListByPage.action?currPage=${pageBean.currPage+1 }">下一页</a>
						</c:if>
						当前页数：${pageBean.currPage }，总页数：${pageBean.totalPage }
					</div>
			</tr>
		</table>
	</div>
	<!--上传MV模态框-->
	<div id="mv_uplad" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						
					</button>
				</div>
				<div class="modal-body">
					<form action="mv_upload.action" enctype="multipart/form-data" method="post">
						<input type="hidden" name="id" id="musicid" value="">
						<input type="hidden" name="currPage" id="currPage" value="${pageBean.currPage }">
						<div class="form-group">
							<label for="sel1">文件选择:</label> 
							<input type="file" name="file" id="file"/>
						</div>
						<div class="text-right">
							<input class="btn btn-primary" type="submit" value="提交"/>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function mv_upload(id){
			$("#musicid").val(id);
			$("#mv_uplad").modal("show");
		}
		//搜索
		function changesearch() {
			$("#searchform").submit();
		}

		//单个删除
		function del(id,currPage) {
			if (confirm("您确定要删除吗?")) {
				window.document.location.href="deleteMusicById.action?id="+id+"&currPage="+currPage;
			}
		}

		//修改
		function update(form){
			if (confirm("您确定要修改吗?")) {
			document:form.submit();
			}
		}
		//全选
		$("#checkall").click(function() {
			$("input[name='id[]']").each(function() {
				if (this.checked) {
					this.checked = false;
				} else {
					this.checked = true;
				}
			});
		})

		//批量删除
		function DelSelect(currPage) {
			var id_array=new Array();
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
				var t = confirm("您确认要删除选中的内容吗？");
				if (t == false)
					return false;
				$("input:checkbox[name='id[]']:checked").each(function(i){
					id_array[i]=$(this).val();
				});
				var vals = "id="+id_array.join("&id=");
				window.document.location.href="deleteAllMusicById.action?"+vals+"&currPage="+currPage;
			} else {
				alert("请选择您要删除的内容!");
				return false;
			}
		}
	</script>
</body>
</html>