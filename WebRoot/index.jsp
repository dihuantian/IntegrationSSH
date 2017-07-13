<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
<head>
<script type="text/javascript">
  function reloadcode(obj,base){
  var rand=new Date().getTime(); //这里用当前时间作为参数加到url中，是为了使URL发生变化，这样验证码才会动态加载，
            //只是一个干扰作用，无确实意义，但却又非常巧妙，呵呵
  obj.src=base+"randomCode.action?abc="+rand; //其实服务器端是没有abc的字段的。
  }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>登录页面</title>
<link href="css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/LoginValidation.js" charset="gb2312"></script>
</head>
<body>

<div class="top">
  <ul>
  	<li> <a class="nav_logo"><img src="images/logo.png"></a></li>
    <li><a href="news_test.action" class="hover">首页</a></li>

    <s:if test="#session.LoginUserInfo==null">
       <li><a href="getName_registerUserPage" class="hover">用户注册</a></li>
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
    <s:form action="getName_loginVerify" onsubmit="return formcheck(this)" name="form_1">
      <table width="292" border="0" align="center" cellpadding="0" cellspacing="0">
      <s:if test="#session.LoginFlagInfo!=null">
        <tr>
          <td height="20" colspan="3" align="center" style="font-size:18px;"><strong><s:property value="#session.LoginFlagInfo"/></strong></td>
      </s:if>
        <tr>
          <td height="76" colspan="3" align="center" style="font-size:30px;"><strong>用户登录</strong></td>
        </tr>
        <tr>
          <td width="65" style="font-size:14px;">账号</td>
          <td colspan="2"><input name="userName" id="u" type="text" placeholder="请输入账号" class="dlinput" /></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
        <tr>
          <td style="font-size:14px;">登录密码</td>
          <td colspan="2"><input name="password" type="text" placeholder="请输入密码" class="dlinput" /></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
        <tr>
          <td style="font-size:14px;">验证码</td>       
          <td width="100"><input name="verificationCode" type="text" placeholder="请输入验证码" class="dlinput" style="width:90px;" maxlength="4" /></td>
          <td width="127"> <img title="看不清楚请点击这里" width="80" height="30" src="<%=basePath%>randomCode.action" id="safecode" onclick="reloadcode(this,'<%=basePath%>')" /></td>
        </tr>
        <tr>
          <td height="16" colspan="3"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2"><input type="submit" value="登   录" class="loginbtn" /></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2"><table width="224" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="right"><a href="getName_registerUserPage" class="zc" style="font-size:13px;"><strong>立即注册！</strong></a></td>
            </tr>
          </table></td>
        </tr>
      </table>
   
    </s:form>
    </div>
  </div>
</div>

<div class="footer">ALiJiuJiu @ 2016 ALiJiuJiu.com All Rights Reserved　版权所有 阿里九九</div>
<script>
function refresh(obj){  
    obj.src = "VerifyCodeServlet?" + Math.random();  
}  
 
function mouseover(obj){  
   obj.style.cursor = "pointer";  
}
</script>
</body>
</html>


