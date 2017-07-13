<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
</head>
<body>
    
   	<a class="nav_logo"><img src="images/logo.png"></a>
    <div class="top">
	  <ul> 
	    <li><a href="news_test.action" class="hover">首页</a></li>
	    <li><a href="getName_userInfo.action" class="hover">修改个人资料</a></li>	
	    <s:if test="#session.LoginUserInfo==null">
	    <li><a href="getName_userLoginPage" class="hover">用户登录</a></li>	
	    </s:if>
	    <s:else>
	    <li><a href="addComtent_fabuNews" class="hover">发布内容</a></li>	
	    <li><a href="getName_LoginUserExit" class="hover">用户注销</a></li>	
	    </s:else>
	  </ul>
	</div>

	<div class="solo_bg">
	    <div class="banner" style="height: 200px; "  >
	    
	        <div id="banner_text">
              <s:if test="#session.userPersonalSpaceName==#session.LoginUserInfo.userName">
	            <div id="banner_text_a"><s:property value="#session.LoginUserInfo.userName"/>的个人空间</div>   
	          </s:if>
	          <s:else>
	            <div id="banner_text_a"><s:property value="#session.userPersonalSpaceName"/>的个人空间</div> 
	          </s:else>
	            <div id="banner_text_b">青春是打开了,就合不上的书。人生是踏上了，就回不了头的路。</div>       
	        </div>
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
	                    <span><img id="weibo_icon" src="images/index/icon_1.png" >微博</span>
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
	                            <li><img class="fk_img" src="images/index/costomer.png">引流助手<span class="fk_time">6月20日</span></li>
	                            <li><img class="fk_img" src="images/index/costomer.png">记得小窝<span class="fk_time">6月20日</span></li>
	                            <li><img class="fk_img" src="images/index/costomer.png">辣妈小衣橱<span class="fk_time">6月20日</span></li>
	                            <li><img class="fk_img" src="images/index/costomer.png">wanwang013<span class="fk_time">6月20日</span></li>
	                            <li><img class="fk_img" src="images/index/costomer.png">渔村<span class="fk_time">6月20日</span></li>
	                            <li><img class="fk_img" src="images/index/costomer.png">124的巧合<span class="fk_time">6月20日</span></li>
	                            <li><img class="fk_img" src="images/index/costomer.png">uu66tt<span class="fk_time">6月20日</span></li>
	                            <li><img class="fk_img" src="images/index/costomer.png">我盼雨量<span class="fk_time">6月20日</span></li>
	                            <li><img class="fk_img" src="images/index/costomer.png">爱你的我…<span class="fk_time">6月20日</span></li>
	                            <li><img class="fk_img" src="images/index/costomer.png">用户45234…<span class="fk_time">6月20日</span></li>
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
	
                     <s:iterator id="userNewsList" value="#session.userNewsList">
	                <div class="bw_text">
	                    <span class="title_span"><a class="bw_text_title" href="news_newsAllContent.action?newsId=<s:property value="#userNewsList.newId"/>"><s:property value="#userNewsList.newTitle"/></a>(2016年6月29日)
	                  
	                    <s:if test="#session.userPersonalSpaceName==#session.LoginUserInfo.userName">
	                       <a class="bw_text_title_bt" href="addComtent_addNews" target="_self">[编辑]</a><a class="bw_text_title_bt" href="delete_deleteNews.action?newId=<s:property value="#userNewsList.newId" />" target="_self">[删除]</a>
	                    </s:if>
	                    </span>
	                    <br />
	                    <span class="note_span">标签：<a class="note_span_a" href="###" target="_self">教程</a><a class="note_span_a" href="###" target="_self">视频</a><a class="note_span_a" href="###" target="_self">access</a>    分类：<a class="note_span_a" href="###" target="_self">二级考证</a></span>
	                    <div class="text_text">&nbsp;&nbsp;<s:property value="#userNewsList.issueContent"/></div>
	                    <br />
	                    <span class="bw_bottom"><a class="bw_bottom_bt" href="news_newsAllContent.action?newsId=<s:property value="#userNewsList.newId"/>" target="_self">阅读</a>(10) | <a class="bw_bottom_bt" href="news_newsAllContent.action?newsId=<s:property value="#userNewsList.newId"/>" target="_self">评论</a>(10) | <a class="bw_bottom_bt" href="###" target="_self">转载</a>(10) | <a class="bw_bottom_bt" href="###" target="_self">收藏</a>(10)<a class="bw_bottom_bt_more" href="news_newsAllContent.action?newsId=<s:property value="#userNewsList.newId"/>" target="_self">查看全文>></a></span>
	                </div>
	                
	                <hr class="bw_hr">
	                </s:iterator>
	                <br />
	                <br />
	                <br />
	            </div>
	        </div>
	    </div>
		 <div>
		<div class="footer">ALiJiuJiu @ 2016 ALiJiuJiu.com All Rights Reserved　版权所有 阿里九九</div>
	</div>
</body>
</html>