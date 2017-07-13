<%@taglib uri="/struts-tags" prefix="s"%><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'My.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<s:form action="addComtent_addNews">
	<a>标题:</a><input name="newstable.newTitle" id="u" type="text" placeholder="请输入标题" class="dlinput" /></br>
	<a>导语:</a><input name="newstable.introduction" id="u" type="text" placeholder="请输入导语" class="dlinput" /></br>
	<a>作者:</a><input name="newstable.author"  value="<s:property value="#session.LoginUserInfo.userName"/>"/></br>
	<a>发布时间:</a><input name="newstable.issueTime" value="<s:property value="#session.SystemTime"/>" /></br>
	<a>图片名字:</a><input name="newstable.newImage" value="Image.jpg" id="u" type="text" class="dlinput" /></br>
	    	<div class=“pinglun”>
	             <textarea id="txtCode" placeholder="请输入内容" name="newstable.issueContent"  rows="5" cols="50" style="width: 637px"></textarea>

<input type="submit" value="发表" class="loginbtn" style="height: 40px; width: 72px"><script src="javascript/wangEditor-1.0.0.js" type="text/javascript"></script>
<script type="text/javascript">
		$(function () {
			$('#divEditor').wangEditor({
				codeTargetId: 'txtCode',			  //将源码存储到txtCode
				frameHeight: '300px',				 //默认值为“300px”
				initWords: '请输入文字...',  //默认值为“请输入...”
				showInfo: true						//是否显示“关于”菜单，默认显示
			});
		});
</script></strong></td>     
	                </div>
	</s:form>
  </body>
</html>
