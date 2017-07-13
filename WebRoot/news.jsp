<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="images/index/icon_2.png">
    <title>个人空间</title>
    <link href="css/solo.css" rel="stylesheet" type="text/css">
    <link href="css/index/cbody.css" rel="stylesheet" type="text/css">
    <link href="css/index/banner.css" rel="stylesheet" type="text/css">
    <link href="css/index/nav.css" rel="stylesheet" type="text/css">
    <link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body>
    
   	<a class="nav_logo"><img src="images/logo.png"></a>
    <div class="top">
	  <ul>
	    <li><a href="news_test.action" class="hover">首页</a></li>
	    <s:if test="#session.LoginUserInfo==null">
	       <li><a href="getName_userLoginPage" class="hover">用户登陆</a></li>
	    </s:if>
	    <s:else>
	       <li><a  href="getName_userPersonalSpace.action?userName=<s:property value="#session.LoginUserInfo.userName"/>" class="hover">个人空间</a></li>
	    </s:else>
	    
	
	  </ul>
	</div>

	<div class="solo_bg">
	    <div class="banner" style="height: 200px; "  >

	    
	        <div id="banner_text">
	            <div id="banner_text_a"><s:property value="#session.newsAllContent.newTitle"/></div>    
	            <div id="banner_text_b">青春是打开了,就合不上的书。人生是踏上了，就回不了头的路。</div>       
	        </div>
	    </div>
	
	
	    <div class="cbody">
	        <div class="cbody_left">
	            <div id="gr">
	                <div class="cbody_bar">
	                    <span><b>个人资料</b><a class="cbody_bar_span_a" href="###" target="_self">[管理]</a></span>
	                </div>
	                <div id="gr_tou">
	                    <img id="gr_touxiang" src="images/userImage.jpg"  width="150px; width: 160px">
	                </div>
	                <span id="name"><s:property value="#session.LoginUserInfo.userName"/></span>
	                <div id="weibo">
	                    <span><img id="weibo_icon" src="images/index/icon_1.png">微博</span>
	                </div>
	                <hr>
	                <div id="list_ul">
	                    <ul>
	                        <li>博客等级：<span>7</span></li>
	                        <li>博客积分：<span>83</span></li>
	                        <li>博客访问：<span>843</span></li>
	                        <li>关注人气：<span>3</span></li>
	                        <li>获赠金币：<span>0</span></li>
	                        <li>赠出金币：<span>0</span></li>
	                        <li>荣誉勋章：<span>7</span></li>
	                    </ul>
	                </div>
	            </div>
	
	            <div class="panel" id="lx">
	                <div class="cbody_bar">
	                    <div>
	                        <span><b>小迪QQ二维码</b><a class="cbody_bar_span_a" href="###" target="_self">[管理]</a></span>
	                        <div id="lx_img">
	                            <img src="images/index/erweima.png">
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="panel" id="fl">
	                <div class="cbody_bar">
	                    <div>
	                        <span><b>分类</b><a class="cbody_bar_span_a" href="###" target="_self">[管理]</a></span>
	                        <ul>
	                            <li>全部博文<span>(30)</span></li>
	                            <li>二级考证<span>(19)</span></li>
	                            <li>英语四级<span>(22)</span></li>
	                            <li>班级资料<span>(17)</span></li>
	                            <li>学术交流<span>(8)</span></li>
	                            <li>影视天地<span>(39)</span></li>
	                            <li>侃侃杂谈<span>(1)</span></li>
	                            <li>转载转发<span>(349)</span></li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            <div class="panel" id="fk">
	                <div class="cbody_bar">
	                    <div id="fk_list">
	                        <span><b>访客</b><a class="cbody_bar_span_a" href="###" target="_self">[管理]</a></span>
	                        <ul>
	                          <s:iterator id="NewsComments" value="#session.NewsComments" >
	                            <li><img class="fk_img" src="images/index/costomer.png"><s:property value="#NewsComments.userName"/><span class="fk_time">6月20日</span></li>
	                          </s:iterator>
	                        </ul>
	                        <hr>
	                        <a id="fk_a" href="###" target="_self">更多>></a>
	                    </div>
	                </div>
	            </div>
	        </div>
	
	        <div class="cbody_right">
	            <div id="bw">
	                <div>
	                    <div id="cbody_bar_r">
	                        <span><b>博文</b><a href="###" target="_self">[管理]</a></span>
	                    </div>
	                </div>
	
	
	                <div class="bw_text">
	                    <span class="title_span"><a class="bw_text_title" href="text.html"><s:property value="#session.newsAllContent.newTitle"/></a>(2016年6月29日)<a class="bw_text_title_bt" href="###" target="_self">[编辑]</a><a class="bw_text_title_bt" href="delete_deleteNews.action?newId=<s:property value="#session.newsAllContent.newId" />" target="_self">[删除]</a></span>
	                    <br />
	                    <span class="note_span">标签：<a class="note_span_a" href="###" target="_self">教程</a><a class="note_span_a" href="###" target="_self">视频</a><a class="note_span_a" href="###" target="_self">access</a>    分类：<a class="note_span_a" href="###" target="_self">二级考证</a></span>
	                    <div class="text_text">&nbsp;&nbsp;&nbsp;&nbsp;
	                    
	                     <s:property value="#session.newsAllContent.introduction"/>
	                     <s:property value="#session.newsAllContent.issueContent"/>
	                    </div>
	                    <br />
	                    <span class="bw_bottom"><a class="bw_bottom_bt" href="###" target="_self">阅读</a>(10) | <a class="bw_bottom_bt" href="###" target="_self">评论</a>(10) | <a class="bw_bottom_bt" href="###" target="_self">转载</a>(10) | <a class="bw_bottom_bt" href="###" target="_self">收藏</a>(10)</span>
	                </div>
	               
	                <br />
	                <br />
	                <br />
	               <s:form action="addComtent_addNewsComments">
	                 <div class=“pinglun”>
	             <textarea name="commentstable.commentsContent" id="txtCode" rows="5" cols="50" style="width: 637px"></textarea>
<input type="hidden" name="commentstable.newsId" value="<s:property value="#session.newsAllContent.newId"/>"/>
<s:if test="#session.LoginUserInfo!=null">
<input type="hidden" name="commentstable.userId" value="<s:property value="#session.LoginUserInfo.id"/>"/>
<input type="hidden" name="commentstable.userName" value="<s:property value="#session.LoginUserInfo.userName"/>"/>
</s:if>
<s:else>
<input type="hidden" name="commentstable.userId" value="999"/>
<input type="hidden" name="commentstable.userName" value="匿名"/>
</s:else>

<input type="submit" name=""   class="loginbtn"><script src="javascript/wangEditor-1.0.0.js" type="text/javascript"></script>
<script type="text/javascript">
		$(function () {
			$('#divEditor').wangEditor({
				codeTargetId: 'txtCode',			  //将源码存储到txtCode
				frameHeight: '300px',				 //默认值为“300px”
				initWords: '欢迎评论！请输入文字...',  //默认值为“请输入...”
				showInfo: true						//是否显示“关于”菜单，默认显示
			});
		});
</script>   
	                </div>
	                </s:form> 
	                <br />
	                <br />
	                 </div>
	       <div>
	       <a>所有评论：</a>
	       
	       <s:iterator id="NewsComments" value="#session.NewsComments">
			<table>
			<tr>
			<td>用户:<s:property value="#NewsComments.userName"/></td>
			<td rowspan="2"><s:property value="#NewsComments.commentsContent"/></td>
			</tr>
			<tr>
			<s:if test="#NewsComments.userName==#session.LoginUserInfo.userName">
			   <td><a href="delete_deleteNewsComments.action?commentsId=<s:property value="#NewsComments.commentsId"/>">[删除]</a></td>	
			</s:if>
			</tr>
			</table>
			</s:iterator>
			</div>
			
	                <br />
	                <br />
	                <br />
	           
	        </div>
	    </div>
	
		<div class="footer">ALiJiuJiu @ 2016 ALiJiuJiu.com All Rights Reserved　版权所有 阿里九九</div>
</body>
</html>