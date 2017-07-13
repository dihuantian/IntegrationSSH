package com.Integration.Action;

import java.util.List;

import com.Integration.Entities.Newstable;


public class DeleteNews extends NewsAction{
	
	public Newstable newstable;
	private int newId;
	private int commentsId;
	
	public int getCommentsId() {
		return commentsId;
	}

	public void setCommentsId(int commentsId) {
		this.commentsId = commentsId;
	}

	public int getNewId() {
		return newId;
	}

	public void setNewId(int newId) {
		this.newId = newId;
	}

	public Newstable getNewstable() {
		return newstable;
	}

	public void setNewstable(Newstable newstable) {
		this.newstable = newstable;
	}

	public String deleteNews(){		
		
		newsServicelmpl.deleteNews(newsServicelmpl.getNewsContent(newId).get(0));
		return "deleteNews";
	}
	
	public String deleteNewsComments(){
		
		String Sql="from Commentstable where commentsId="+commentsId;
		newsServicelmpl.deleteUserComments(Sql);	
		return "Commentstable";
	}
	
}
