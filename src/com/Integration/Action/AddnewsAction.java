package com.Integration.Action;

import java.util.Date;
import java.util.Map;

import com.Integration.Entities.Commentstable;
import com.opensymphony.xwork2.ActionContext;

import java.text.SimpleDateFormat;

public class AddnewsAction extends DeleteNews{
	
	private Commentstable commentstable;	
	private java.util.Date data;
	private SimpleDateFormat time;

	public Commentstable getCommentstable() {
		return commentstable;
	}

	public void setCommentstable(Commentstable commentstable) {
		this.commentstable = commentstable;
	}

	//�����������
	public String addNewsComments(){		
		newsServicelmpl.addUserComments(commentstable);		
		return "Commentstable";
	}
	
	//���������addNewsComments
	public String addNews(){
		
		newsServicelmpl.addNews(newstable);	
		System.out.println(newstable.getNewImage());
		return "solo";
	}
	
	//�������ſռ�
	public String fabuNews(){
		data=new Date();
		time=new SimpleDateFormat("yyyy-MM-dd");
		String datatime=time.format(data);
		Map<String, Object> session=ActionContext.getContext().getSession();
		session.put("SystemTime", datatime);
		return "fabuNews";
	}
	
}
