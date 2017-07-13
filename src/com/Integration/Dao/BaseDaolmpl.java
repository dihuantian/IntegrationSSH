package com.Integration.Dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.Integration.Entities.Commentstable;
import com.Integration.Entities.Newsrecommendtable;
import com.Integration.Entities.Newstable;
import com.Integration.Entities.Usertable;

public class BaseDaolmpl implements BaseDao{
	
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public List<Usertable> getUser(String hsql){
        List<Usertable> list=this.sessionFactory.getCurrentSession().createQuery(hsql).list(); 
        if(list.size()==0)
        	return null;
        else
        	return list;
	}
	
	@Override
	public void saveUser(Usertable usertable) {
		// TODO 自动生成的方法存根
		this.sessionFactory.getCurrentSession().save(usertable);
	}
	
	@Override
	public List<Newsrecommendtable> getRecommendNews(String hsql) {
		// TODO 自动生成的方法存根
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Newsrecommendtable order by newsId desc");
		query.setMaxResults(6); // 每页最多显示几条
		List<Newsrecommendtable> list=query.list();
		return list;
	}
	
	@Override
	public List<Newstable> getNews(int flag){
		String sql;
		Session session = sessionFactory.getCurrentSession();
		if(flag==0)
			sql="from Newstable order by newId desc";
		else
			sql="from Newstable order by commentNumber desc";
		Query query = session.createQuery(sql);
		query.setMaxResults(6); // 每页最多显示几条
		List<Newstable> list = query.list();
		return list;
	}
	
	public List<Newstable> findPlantByPage(String sql,int page, int rowsPerPage) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(sql);
		query.setMaxResults(rowsPerPage); // 每页最多显示几条
		query.setFirstResult((page - 1) * rowsPerPage); // 每页从第几条记录开始
		List<Newstable> list = query.list();

		return list;
	}

	/**
	 * 共多少页计划数据
	 */
	public int PlanTotalPage(int rowsPerPage) {
		// System.out.println("rowsPerPage:" + rowsPerPage);
		int rows = 0;
		String hql = "select count(*) from Newstable";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);

		rows = ((Number) query.iterate().next()).intValue();
		// System.out.println("rows:" + rows);
		
		if (rows % rowsPerPage == 0) {
			return rows / rowsPerPage;
		} else {
			return rows / rowsPerPage + 1;
		}
	}

	public int PlanNum() {
		String hql = "select count(*) from Newstable";
		int rows = 0;
		Session session =  sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);

		return rows;
	}

	/**
	 * 条件查询后返回的计划总页数
	 */
	public int getPlanTotalPage(int rowsPerPage, String type, String search) {
		int rows = 0;
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(*) from Newstable p where p." + type
				+ " like :type";
		Query query = session.createQuery(hql);
		query.setString("type", "%" + search + "%");

		rows = ((Integer) query.iterate().next()).intValue();
		// System.out.println("rows:" + rows);
		if (rows % rowsPerPage == 0) {
			return rows / rowsPerPage;
		} else {
			return rows / rowsPerPage + 1;
		}
	}

	/**
	 * 条件查询后返回的计划数据总数
	 */
	public int getPlanNum(String type, String search) {
		int rows = 0;
		Session session =sessionFactory.getCurrentSession();
		String hql = "select count(*) from Newstable p where p." + type+ " like :type";
		Query query = session.createQuery(hql);
		query.setString("type", "%" + search + "%");

		rows = ((Integer) query.iterate().next()).intValue();
		// System.out.println("rows:" + rows);
		return rows;
	}
	
	@Override
	public List getUserNews(String sql,int page) {
		// TODO 自动生成的方法存根
		
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(sql);
		List<Newsrecommendtable> list=query.list();
		return list;
	}
	@Override
	public void updateUserInfo(Usertable usertable) {
		// TODO 自动生成的方法存根 
		Session session =this.sessionFactory.openSession();
		session.update(usertable);
		session.flush();
	}
	
	@Override
	public void deleteNews(Newstable newstable){
		Session session =this.sessionFactory.getCurrentSession();
		session.delete(newstable);
		session.flush();
	}
	@Override
	public void saveUserComments(Commentstable commentstable) {
		// TODO 自动生成的方法存根
		Session  session=this.sessionFactory.getCurrentSession();
		session.save(commentstable);
		//session.flush();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Commentstable> getUserComments(String Sql) {
		// TODO 自动生成的方法存根
		
		Session session =this.sessionFactory.getCurrentSession();
		return session.createQuery(Sql).list();
	}
	@Override
	public void deleteUserComments(Commentstable commentstable) {
		// TODO 自动生成的方法存根
		Session session =this.sessionFactory.getCurrentSession();
		session.delete(commentstable);
		session.flush();
	}
	
	@Override
	public void saveNews(Newstable newstable) {
		// TODO 自动生成的方法存根
		Session session =this.sessionFactory.getCurrentSession();
		session.save(newstable);
		session.flush();
	}
	
}
