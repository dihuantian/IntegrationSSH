package com.Integration.Dao;

import java.util.List;

import com.Integration.Entities.Commentstable;
import com.Integration.Entities.Newsrecommendtable;
import com.Integration.Entities.Newstable;
import com.Integration.Entities.Usertable;

public interface BaseDao<T> {
	
	//查询数据库并返回User实体
	public List<Usertable> getUser(String hsql);
	
	//将注册用户数据插入数据库
	public void saveUser(Usertable usertable);
	
	//分组查询数据库
	public List<Newstable> getNews(int flag);
	
	public int PlanTotalPage(int rowsPerPage);

	public List<Newstable> findPlantByPage(String sql,int page, int rowsPerPage);

	public int PlanNum();
	
	public List<Newsrecommendtable> getRecommendNews(String hsql);
	
	public List<Newstable> getUserNews(String sql,int page);
	
	public void updateUserInfo(Usertable usertable);
	
	public void deleteNews(Newstable newstable);
	
	//保存用户评论
	public void saveUserComments(Commentstable commentstable);
	
	//获得用户评论
	public List<Commentstable> getUserComments(String Sql);
	
	//删除用户评论
	public void deleteUserComments(Commentstable commentstable);
	
	//添加新的新闻
	public void saveNews(Newstable newstable);
}
