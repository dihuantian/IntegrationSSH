<%@page import="com.Integration.Entities.Newstable"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
 <title>我的博客</title>
 <meta name="关键字" content="">
 <link href="css/main.css" rel="stylesheet" type="text/css">

</head>
<body>


	<div class="top">
	  <ul>
	  	<li> <a class="nav_logo"><img src="images/logo.png" style="height: 50px; width: 50px; "></a></li>
	    <li><a href="#none" class="hover">首页</a></li>
	    <s:if test="#session.LoginUserInfo==null">				
				<li><a href="getName_userLoginPage" class="hover">用户登陆</a></li>
	    </s:if>
	    <s:else>
	       <li><a href="getName_userPersonalSpace.action?userName=<s:property value="#session.LoginUserInfo.userName"/>" class="hover">个人空间</a></li>
	       <li><a href="getName_LoginUserExit" class="hover">用户注销</a></li>	
	    </s:else>
	
	  </ul>
	</div>

	

  <article>
 
    <div class="l_box f_l">
    <br>
		<a>&nbsp;&nbsp;&nbsp;&nbsp;随时随地发现新鲜事~</a>
	   <div class="topnews">
	   
	   <s:iterator value="list" status="s">

	     <div class="blogs">
		     <figure>
			     <img src="images/<s:property value="newImage"/>" style="height: 150px; width: 150px; ">
			   </figure>
			   <ul>
			     <h3><a href="news_newsAllContent.action?newsId=<s:property value="newId"/>" ><s:property value="newTitle"/></a></h3>
				  <p><s:property value="introduction"/></p>
			     <p class="autor">
				    <span class="lm f_l">
					    <a href="getName_userPersonalSpace.action?userName=<s:property value="author"/>"><s:property value="author"/></a>
					 </span>
					 <span class="dtime f_l"><s:property value="issueTime"/></span>
					 <span class="viewnum f_r">
					    浏览（<a href="news_newsAllContent.action?newsId=<s:property value="newId"/>"><s:property value="commentNumber"/></a>）</span>
					 <span class="pingl f_r">	
					    评论（<a href="news_newsAllContent.action?newsId=<s:property value="newId"/>"><s:property value="browseNumber"/></a>）</span>
				  </p>
			   </ul>
	       </div>
	       </s:iterator>
	       	     
	   </div>
	 </div>  

    <div class="r_box f_r">
	  <s:if test="#session.LoginUserInfo!=null">
		<div class="s_about" align="center">    
		   <br>     
           <img src="images/userImage.jpg" width="230" height="230"/>
           <br>
           <p>&nbsp;&nbsp;&nbsp;&nbsp;昵称：<s:property value="#session.LoginUserInfo.userName"/></p>
           <p>&nbsp;&nbsp;&nbsp;&nbsp;爱好：<s:property value="#session.LoginUserInfo.hobby"/></p>
           <p>&nbsp;&nbsp;&nbsp;&nbsp;
           <div class="clear"></div>
           </p>
         </div>
        </s:if>   
	   
	   <div class="tab" id="lp_right_select">
	     <script>
		     window.onload=function()
			 {
			     var oLi=document.getElementById("tb").getElementsByTagName("li");
				 var oUl=document.getElementById("tb-main").getElementsByTagName("div");
				 for(var i=0;i<oLi.length;i++)
				 {
				     oLi[i].index=i;
					 oLi[i].onmouseover=function()
					 {
					    for(var n=0;n<oLi.length;n++)
						    oLi[n].className="";
							this.className="cur";
						for(var n=0;n<oUl.length;n++)
                            oUl[n].style.display="none";
                            oUl[this.index].style.display="block";							
					 }
				 }
			 }
		  </script>
	     <div class="tab-top">
		      <ul class="hd" id="tb">
			       <li class="cur"><a href="/">点 击 排 行</a></li>
				   <li><a href="/">最 新 文 章</a></li>
				   <li><a href="/">站 长 推 荐</a></li>
			  </ul>
		  </div>
		  <div class="tab-main" id="tb-main">
		      <div class="bd bd-news" style="display:block;"><ul>
		         <s:iterator id="recommendNumber" value="#request.recommendNumber">
			       <li><a href="news_newsAllContent.action?newId=<s:property value="#recommendNumber.newId"/>"" target="_blank"><s:property value="#recommendNumber.newTitle"/></a></li>
			     </s:iterator>
			  </ul></div>
			  
			   <div class="bd bd-news" ><ul>
			    <s:iterator id="rankingList" value="#request.rankingList">
			      <li><a href="news_newsAllContent.action?newId=<s:property value="#rankingList.newId"/>" target="_blank"><s:property value="#rankingList.newTitle"/></a></li>
				 </s:iterator>   
			  </ul></div>
			  
			   <div class="bd bd-news" ><ul>
			   <s:iterator id="recommendtableList" value="#request.recommendtableList">
			      <li><a href="news_newsAllContent.action?newId=<s:property value="#recommendtableList.newsId" />" target="_blank"><s:property value="#recommendtableList.newsTitle"/></a></li>
			   </s:iterator>
			  </ul></div>
		  </div>
	   </div>
	   <div class="cloud">
	     <h3>热门词汇</h3>
		  <ul>
		    <li><a href="/">蓝瘦香菇</a></li>
			 <li><a href="/">web开发</a></li>
			 <li><a href="/">狗带</a></li>
			 <li><a href="/">IOS开发</a></li>
			 <li><a href="/">葛优瘫</a></li>
			 <li><a href="/">CSS3+HTML5</a></li>
			 <li><a href="/">度娘</a></li>
			 <li><a href="/">JavaScript</a></li>
			 <li><a href="/">小目标</a></li>
			 <li><a href="/">ASP.NET</a></li>
			 <li><a href="/">老司机</a></li>
			 <li><a href="/">Android开发</a></li>
			 <li><a href="/">PHP</a></li>
			 <li><a href="/">上天</a></li>
		  </ul>
	   </div>
	   
	   <div class="ad"><img src="images/03.jpg"></div>
	   <div class="links">
	     <h3><span><a href="/">申请友情链接</a></span>友情链接</h3>
		 <ul>
		   <li><a href="/">醉牛逼的武魂生涯</a></li>
		    <li><a href="/">观察者网</a></li>
			 <li><a href="/">中国投资</a></li>
			  <li><a href="/">强国论坛</a></li>
			   <li><a href="/">车讯网</a></li>
			    <li><a href="/">360导航</a></li>
				 <li><a href="/">一带一路门户网</a></li>
		 </ul>
	   </div>

	 <div>
	 	 <s:if test="page==1">
	      <a href="">上一页  </a>
	 </s:if>
	 <s:else>
	 <a href="news_test.action?page=<s:property value="page-1" />">上一页  </a>
	 </s:else>
	 <s:if test="page<totalPage">
	 <a href="news_test.action?page=<s:property value="page+1" />">下一页  </a>	       
	 </s:if>
	 <s:else>
	 <a>下一页  </a>	       
	 </s:else>
	 <span><b><s:property value="totalPage"/></b></span> 
	 </div>

	 </div>

  </article>	
</body>
</html>
