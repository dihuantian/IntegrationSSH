package com.Integration.Dao;

import java.util.List;

import com.Integration.Entities.Commentstable;
import com.Integration.Entities.Newsrecommendtable;
import com.Integration.Entities.Newstable;
import com.Integration.Entities.Usertable;

public interface BaseDao<T> {
	
	//��ѯ���ݿⲢ����Userʵ��
	public List<Usertable> getUser(String hsql);
	
	//��ע���û����ݲ������ݿ�
	public void saveUser(Usertable usertable);
	
	//�����ѯ���ݿ�
	public List<Newstable> getNews(int flag);
	
	public int PlanTotalPage(int rowsPerPage);

	public List<Newstable> findPlantByPage(String sql,int page, int rowsPerPage);

	public int PlanNum();
	
	public List<Newsrecommendtable> getRecommendNews(String hsql);
	
	public List<Newstable> getUserNews(String sql,int page);
	
	public void updateUserInfo(Usertable usertable);
	
	public void deleteNews(Newstable newstable);
	
	//�����û�����
	public void saveUserComments(Commentstable commentstable);
	
	//����û�����
	public List<Commentstable> getUserComments(String Sql);
	
	//ɾ���û�����
	public void deleteUserComments(Commentstable commentstable);
	
	//����µ�����
	public void saveNews(Newstable newstable);
}
