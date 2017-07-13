package com.Integration.Action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.Integration.Entities.Newsrecommendtable;
import com.Integration.Entities.Newstable;
import com.Integration.Entities.Usertable;
import com.Integration.Service.NewsServicelmpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class NewsAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 9218067231572208955L;
	protected NewsServicelmpl newsServicelmpl;
	List<Newstable> list=new ArrayList();
	private int newsId;
	private Map<String, Object> request;
	private int rowsPerPage = 7;// 每页显示几条

	private int page = 1; // 默认当前页

	private int totalPage;// 总共多少页

	private int planNum;// 总过多少条
	
	public int getNewsId() {
		return newsId;
	}

	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}

	public int getRowsPerPage() {
		return rowsPerPage;
	}

	public void setRowsPerPage(int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPlanNum() {
		return planNum;
	}

	public void setPlanNum(int planNum) {
		this.planNum = planNum;
	}

	public List<Newstable> getList() {
		return list;
	}

	public void setList(List<Newstable> list) {
		this.list = list;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public NewsServicelmpl getNewsServicelmpl() {
		return newsServicelmpl;
	}

	public void setNewsServicelmpl(NewsServicelmpl newsServicelmpl) {
		this.newsServicelmpl = newsServicelmpl;
	}
	
	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public String test(){		
		
		//主页面内容
		mainNewsContent();
		
		//排行新闻内容
		newsRankingList();
		
		//站长推荐
		newsRecommend();
		
		//单击量排行
		recommendNumber();
		
		List<Newstable> userNewsList =newsServicelmpl.getUserNews("123456",1);
		System.out.println(userNewsList.get(0));
		return SUCCESS;
	}

	private void recommendNumber() {
		Map request = (Map)ActionContext.getContext().get("request");
		List<Newstable> recommendNumber = newsServicelmpl.getNewsTitle(1);
		request.put("recommendNumber", recommendNumber);
	}

	private void newsRecommend() {
		Map request = (Map)ActionContext.getContext().get("request");
		List<Newsrecommendtable> recommendtableList = newsServicelmpl.getNewsrecommend();
		request.put("recommendtableList", recommendtableList);
		System.out.println(recommendtableList.size());
	}

	private void mainNewsContent() {
		String sql="from Newstable order by newId desc";;
		list=newsServicelmpl.getAllNews(sql , page, rowsPerPage);
		totalPage=newsServicelmpl.getTotalPage(rowsPerPage);
		
		System.out.println(list.size()+"   "+totalPage+"   "+planNum+"  "+rowsPerPage);
	}

	private void newsRankingList() {
		Map request = (Map)ActionContext.getContext().get("request");
		List<Newstable> rankingList = newsServicelmpl.getNewsTitle(0);
		request.put("rankingList", rankingList);
	}
	
	public String newsAllContent(){
		
		Map<String,  Object> session = ActionContext.getContext().getSession();
		int newTheNews=(int)session.put("ContentnewsId", newsId);
		List<Newstable> fenye = newsServicelmpl.getNewsContent(newTheNews);
		session.put("newsAllContent", fenye.get(0));
		getNewsComments();
		return "fenye";	
	}
	
	//获得评论
	public void getNewsComments(){
		Map<String,  Object> session = ActionContext.getContext().getSession();
		String Sql="from Commentstable where newsId="+session.get("ContentnewsId");		
		System.out.println(session.get("ContentnewsId")+" 5");
		session.put("NewsComments", null);
		session.put("NewsComments", newsServicelmpl.getUserComments(Sql));
		
	}
	
	//重定向重新获得评论
	public String getRedirectActionNewsComments(){
		getNewsComments();
		return "getRedirectActionNewsComments";
	}
}
