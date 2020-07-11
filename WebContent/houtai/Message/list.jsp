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
<script src="../js/jquery.js"></script>
<script src="../js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder">内容列表</strong> 
			<a href="" style="float: right; display: none;">添加字段</a>
		</div>
		<div class="padding border-bottom">
			<form action="findMessageListByPage.action" id="searchform">
				<ul class="search" style="padding-left: 10px;">
					<li>搜索：<input type="hidden" name="currPage" value="1" /></li>
					<li><input type="text" placeholder="请输入搜索关键字" name="messageCustom.comment" class="input" style="width: 250px; line-height: 17px; display: inline-block" />
						<a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()">搜索</a> &nbsp;&nbsp; 
					</li>
				</ul>
			</form>
		</div>
		<table class="table table-hover text-center">
			<tr>
				<th style="text-align: left; padding-left: 20px;">ID</th>
				<th>留言</th>
				<th>歌曲名</th>
				<th>时间</th>
				<th>用户名</th>
				<th>回复</th>
				<th width="310">操作</th>
			</tr>
			<c:forEach var="message" items="${pageBean.listT }">
				<form action="updateMessage.action" id="form${message.messageid }"
					method="get">
					<tr>
						<td style="text-align: left; padding-left: 20px;"><input
							type="checkbox" name="id[]" value="${message.messageid }" /> <input
							type="hidden" name="id" value="${message.messageid }" /> <input
							type="hidden" name="currPage" value="${pageBean.currPage }" /></td>
						<td>${message.comment }</td>
						<td>${message.music.name }</td>
						<td><fmt:formatDate value="${message.time }"
								pattern="yyyy-MM-dd" /></td>
						<td>${message.user.name }</td>
						<td>${message.message.comment }</td>
						<td><div class="button-group">
								<a class="button border-red"
									href="javascript:void(0)"
									onclick="return del(${message.messageid},${pageBean.currPage })"><span
									class="icon-trash-o"></span> 删除</a>
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
								href="findMessageListByPage.action?currPage=${pageBean.currPage-1 }">上一页</a>
						</c:if>
						<c:forEach begin="1" end="${pageBean.totalPage }" var="totalPage">
							<c:if test="${pageBean.currPage==totalPage }">
								<span class="current"><c:out value="${totalPage }" /></span>
							</c:if>
							<c:if test="${pageBean.currPage!=totalPage }">
								<a href="findMessageListByPage.action?currPage=${totalPage }"><c:out
										value="${totalPage }" /></a>
							</c:if>
						</c:forEach>
						<c:if test="${pageBean.currPage!=pageBean.totalPage }">
							<a
								href="findMessageListByPage.action?currPage=${pageBean.currPage+1 }">下一页</a>
						</c:if>
						当前页数：${pageBean.currPage }，总页数：${pageBean.totalPage }
					</div>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
		//搜索
		function changesearch() {
			$("#searchform").submit();
		}

		//单个删除
		function del(id,currPage) {
			if (confirm("您确定要删除吗?")) {
				window.document.location.href="deleteMessageById.action?id="+id+"&currPage="+currPage;
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
				window.document.location.href="deleteAllMessageById.action?"+vals+"&currPage="+currPage;
			} else {
				alert("请选择您要删除的内容!");
				return false;
			}
		}
	</script>
</body>
</html>