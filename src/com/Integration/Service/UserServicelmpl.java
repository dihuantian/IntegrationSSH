package com.Integration.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.Integration.Dao.BaseDao;
import com.Integration.Entities.Newsrecommendtable;
import com.Integration.Entities.Newstable;
import com.Integration.Entities.Usertable;
import com.opensymphony.xwork2.ActionContext;

public class UserServicelmpl {
	
	private BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}
	
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	//取得用户实体
	public int getEntities(String userName, String password){
		String hql = "FROM Usertable u where u.userName='"+userName+"'";
		System.out.println(hql);
		List<Usertable> usertable=new ArrayList<Usertable>();
		usertable=baseDao.getUser(hql);	
		if(usertable==null)
		{
			return -1;//表示用户不存在
		}
		else if(userName.equals(usertable.get(0).getUserName()))
		{
			if(password.equals(usertable.get(0).getPassword()))
			{
				Map<String,Object> session = (Map<String, Object>) ActionContext.getContext().getSession();
				session.put("LoginUserInfo", usertable.get(0));			
				return 1;//1表示验证成功
			}
			else
			{
				return 2;//2表示密码错误
			}
		}
		return 0;
	}	
	
	//保存用户注册信息
	public boolean saveUser(Usertable usertable){	
		String hql = "FROM Usertable u where u.userName='"+usertable.getUserName()+"'";
		List<Usertable> usertable_1=baseDao.getUser(hql);	
		if(usertable_1==null)
		{
			baseDao.saveUser(usertable);
			return false;//表示用户不存在
		}
		else if(usertable.getUserName().equals(usertable_1.get(0).getUserName()))
		{
			return true;//表示用户存在
		}	
		return true;	
	}
	
	//取得用户的个人新闻
	public List<Newstable> getUserNews(String UserName){
		
		String hsql="from Newstable where author='"+UserName+"'";
		System.out.println(hsql);
		return baseDao.getUserNews(hsql,1);
		
	}
	
	//更新用户的信息
	public void updateUser(Usertable usertable){
		baseDao.updateUserInfo(usertable);
		
	}
}
