<%@taglib uri="/struts-tags" prefix="s"%><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改个人资料</title>
<link href="css/person.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div class="top">
  <ul>
    <li> <a class="nav_logo"><img src="images/logo.png"></a></li>
    <li><a href="news_test.action" class="hover">首页</a></li>
    	    <s:if test="#session.LoginUserInfo==null">
				
				<li><a href="#none" class="hover">用户登陆</a></li>
	    </s:if>
	    <s:else>
	       <li><a href="getName_userPersonalSpace.action?userName=<s:property value="#session.LoginUserInfo.userName"/>" class="hover">个人空间</a></li>
	       <li><a href="getName_LoginUserExit" class="hover">用户注销</a></li>	
	    </s:else>

  </ul>
</div>

<div class="main">
		<s:form action="getName_updateUser">
		<table width="292" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="76" colspan="3" align="center" style="font-size:30px;"><strong>修改个人资料</strong></td>
        </tr>
         <tr>
          <td  width="65" style="font-size:14px;">用户ID</td>
          <td colspan="2"><input name="usertable2.id" value="<s:property value="#session.LoginUserInfo.id"/>" type="text" readonly="readonly" class="dlinput" style="width: 221px; "/></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
        <tr>
          <td  width="65" style="font-size:14px;">昵称</td>
          <td colspan="2"><input name="usertable2.userName" value="<s:property value="#session.LoginUserInfo.userName"/>" type="text" class="dlinput" readonly="readonly"/></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
        <tr>
          <td style="font-size:14px;">性别</td>
          <td colspan="2"><input name="usertable2.sex" type="text" value="<s:property value="#session.LoginUserInfo.sex"/>" class="dlinput" /></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
        <tr>
           <td width="65" style="font-size:14px;">年龄</td>
          <td colspan="2"><input name="usertable2.age" value="<s:property value="#session.LoginUserInfo.age"/>" type="text" class="dlinput" /></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
         <tr>
          <td width="65" style="font-size:14px;">手机号码</td>
          <td colspan="2"><input name="usertable2.phoneNumber" value="<s:property value="#session.LoginUserInfo.phoneNumber"/>" type="text" class="dlinput" /></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
         <tr>
          <td width="65" style="font-size:14px;">所在地</td>
          <td colspan="2"><input name="usertable2.address" type="text" value="<s:property value="#session.LoginUserInfo.address"/>" class="dlinput" /></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
        <tr>
          <td width="65" style="font-size:14px;">爱好</td>
          <td colspan="2"><input name="usertable2.hobby" type="text" value="<s:property value="#session.LoginUserInfo.hobby"/>" class="dlinput" /></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2"><input type="submit" value="修改" class="loginbtn" style="width: 100px; "/>&nbsp;&nbsp;<input type="submit" value="取消" class="loginbtn" style="width: 100px; "/></td>          
        </tr>
       
      </table>
      
   </s:form>
</div>

<div class="footer">ALiJiuJiu @ 2016 ALiJiuJiu.com All Rights Reserved　版权所有 阿里九九</div>

</body>
</html>

