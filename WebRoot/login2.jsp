<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/RegisterValidation.js" charset="gb2312"></script>
<title>注册页面</title>
<link href="css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div class="top">
  <ul>
    <li> <a class="nav_logo"><img src="images/logo.png"></a></li>
    <li><a href="news_test.action" class="hover">首页</a></li>
    <s:if test="#session.LoginUserInfo==null">
    <li><a href="getName_userLoginPage" class="hover">用户登陆</a></li>
    </s:if>
    <s:else>
    <li><a href="getName_userPersonalSpace.action?userName=<s:property value="#session.LoginUserInfo.userName"/>" class="hover">个人空间</a></li>
    <li><a href="getName_LoginUserExit" class="hover">用户注销</a></li>	
    </s:else>
  </ul>
</div>

<div class="main">
  <div class="denglu">
    <!-- <div class="text" style="font-size:13px;">可以在这里放图（图上图）</div> -->
    <div class="dlk">
    <s:form action="getName_registerUser" onsubmit="return formcheck(this)" name="form_1">
      <table width="292" border="0" align="center" cellpadding="0" cellspacing="0">
      <s:if test="#session.LoginFlagInfo!=null">
        <tr>
          <td height="20" colspan="3" align="center" style="font-size:18px;"><strong><s:property value="#session.registerFlagInfo"/></strong></td>
        </s:if>
        <tr>
          <td height="76" colspan="3" align="center" style="font-size:30px;"><strong>用户注册</strong></td>
        </tr>
        <tr>
          <td width="65" style="font-size:14px;">输入账号</td>
          <td colspan="2"><input name="userName" type="text" class="dlinput" placeholder="请输入账号" /></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
        <tr>
          <td style="font-size:14px;">输入密码</td>
          <td colspan="2"><input name="password" type="text" class="dlinput" placeholder="请输入密码"/></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
        <tr>
          <td style="font-size:14px;">确认密码</td>
           <td colspan="2"><input name="repetitionPassword" type="text" class="dlinput" placeholder="请输入重复密码"/></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2"><input type="submit" value="注  册" class="loginbtn" /></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2"><table width="224" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="24"><a href="#none" class="mm">游客登录</a></td>
              <td align="right"><a href="#none" class="zc" style="font-size:13px;"><strong>立即登陆！</strong></a></td>
            </tr>
          </table></td>
        </tr>
      </table>
      </s:form>
    </div>
  </div>
</div>

<div class="footer">ALiJiuJiu @ 2016 ALiJiuJiu.com All Rights Reserved　版权所有 阿里九九</div>

</body>
</html>

