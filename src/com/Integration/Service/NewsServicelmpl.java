package com.Integration.Service;

import java.util.List;

import org.springframework.dao.support.DaoSupport;

import com.Integration.Action.NewsAction;
import com.Integration.Dao.BaseDao;
import com.Integration.Entities.Commentstable;
import com.Integration.Entities.Newsrecommendtable;
import com.Integration.Entities.Newstable;

public class NewsServicelmpl {
	
	private BaseDao baseDao;
	private NewsAction newsAction;
	public BaseDao getBaseDao() {
		return baseDao;
	}
	
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	public List<Newstable> getAllNews(String sql,int page,int rowsPerPage){
		newsAction=new NewsAction();
		return baseDao.findPlantByPage(sql ,page, rowsPerPage);  
	}	
	
	public int getTotalPage(int rowsPerPage){
		return baseDao.PlanTotalPage(rowsPerPage);
	}
	
	public int getPlanNum(){
		return baseDao.PlanNum();
	}
	
	public List<Newstable> getNewsTitle(int flag)
	{
		String hsql="select newId newTitle from Newstable";
		return baseDao.getNews(flag);
	}
	
	public List<Newsrecommendtable> getNewsrecommend(){
		String hsql="from Newsrecommendtable order by newsId desc";
		return baseDao.getRecommendNews(hsql);
	}
	
	public List<Newstable> getUserNews(String UserName,int page){
		
		String hsql="from Newstable where author='"+UserName+"'";
		return baseDao.getUserNews(hsql,page);	
	}
	
	public List<Newstable> getNewsContent(int newsId){
		String sql="from Newstable where id='"+newsId+"'";
		return baseDao.getUserNews(sql,1);			
	}
	
	public void deleteNews(Newstable newstable){
		baseDao.deleteNews(newstable);
	}
	
	//添加评论
	public void addUserComments(Commentstable commentstable){
		
		baseDao.saveUserComments(commentstable);
		System.out.println(commentstable);
	}
	
	//获得评论
	public List<Commentstable> getUserComments(String Sql){
		
		return baseDao.getUserComments(Sql);	
	}
	
	//删除评论 baseDao
	public void deleteUserComments(String Sql){
		
		baseDao.deleteUserComments((Commentstable) baseDao.getUserComments(Sql).get(0));
	}
	
	//添加新的新闻
	public void addNews(Newstable newstable){
		
		baseDao.saveNews(newstable);
	}
}
