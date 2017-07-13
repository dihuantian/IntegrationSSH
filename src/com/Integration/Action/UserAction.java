package com.Integration.Action;

import java.util.List;
import java.util.Map;

import com.Integration.Entities.Newsrecommendtable;
import com.Integration.Entities.Newstable;
import com.Integration.Entities.Usertable;
import com.Integration.Service.UserServicelmpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class UserAction extends NewsAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7959861565949944162L;
	private Integer id;
	private String userName;
	private String password;
	private String repetitionPassword;
	private List<Usertable> usertable;
	private UserServicelmpl userServicelmpl;
	private Usertable usertable2;
	private String verificationCode;
	private String LoginFlagInfo;
	private String registerFlagInfo;
	
	private int rowsPerPage = 10;// 每页显示几条

	private int page = 1; // 默认当前页

	private int totalPage;// 总共多少页

	private int planNum;// 总过多少条
	
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

	
	
	public List<Usertable> getUsertable() {
		return usertable;
	}
	public void setUsertable(List<Usertable> usertable) {
		this.usertable = usertable;
	}
	public Usertable getUsertable2() {
		return usertable2;
	}
	public void setUsertable2(Usertable usertable2) {
		this.usertable2 = usertable2;
	}
	public UserServicelmpl getUserServicelmpl() {
		return userServicelmpl;
	}
	public void setUserServicelmpl(UserServicelmpl userServicelmpl) {
		this.userServicelmpl = userServicelmpl;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getRepetitionPassword() {
		return repetitionPassword;
	}
	public void setRepetitionPassword(String repetitionPassword) {
		this.repetitionPassword = repetitionPassword;
	}
	
	public String loginPage(){
		return "LoginPage";
	}
	
	public String registerPage(){
		return "RegisterPage";
	}
	
	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}
	
	public String getLoginFlagInfo() {
		return LoginFlagInfo;
	}

	public void setLoginFlagInfo(String loginFlagInfo) {
		LoginFlagInfo = loginFlagInfo;
	}

	public String getRegisterFlagInfo() {
		return registerFlagInfo;
	}

	public void setRegisterFlagInfo(String registerFlagInfo) {
		this.registerFlagInfo = registerFlagInfo;
	}

	//用户注册界面
	public String registerUserPage(){	
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.put("registerFlagInfo", null);
		return "registerPage";
	}
	
	//用户登录界面
	public String userLoginPage(){
		return "input";
	}
	
	//注销用户登录
	public String LoginUserExit(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.put("LoginUserInfo", null);
		session.put("LoginFlagInfo", null);
		return "input";
	}

	//用户注册信息
	public String registerUser(){
		boolean rigisterCheck=false;
		rigisterCheck=this.userServicelmpl.saveUser(new Usertable(userName, password));
		Map<String, Object> session=ActionContext.getContext().getSession();
		if(rigisterCheck==true)
		{
			return "registerPage";
		}
			
		else
		{
			registerFlagInfo="用户已经存在,注册失败";
			session.put("registerFlagInfo", registerFlagInfo);
			return "input";	
		}
	}
	
	//用户登录信息
	public String loginVerify(){
		int Verify;
		Map<String, Object> session = ActionContext.getContext().getSession();
		System.out.println((String)session.get("RandomCode"));
		usertable2=(Usertable) session.get("LoginUserInfo");
		//一台电脑只允许一个用户登录
		if(usertable2==null)
		{
			Verify=userServicelmpl.getEntities(userName,password);
			if(verificationCode.equals((String)session.get("RandomCode")))
			{
				if(Verify==1)
				{
					String sql="from Newstable where author='"+userName+"'";
					list=newsServicelmpl.getAllNews(sql , page, rowsPerPage);
					totalPage=newsServicelmpl.getTotalPage(rowsPerPage);	
					session.put("userNewsList", list);
					session.put("userPersonalSpaceName", userName);
					return "SUCCESS";
				}
				else if(Verify==-1)
			    {
					LoginFlagInfo="用户不存在";
					session.put("LoginFlagInfo", LoginFlagInfo);
					return "input";
			    }
				else
				{
					LoginFlagInfo="用户密码错误";
					session.put("LoginFlagInfo", LoginFlagInfo);
					return "input";
				}
			}
			else
			{
				LoginFlagInfo="验证码码错误";
				session.put("LoginFlagInfo", LoginFlagInfo);
				return "input";
			}
		}
		else
		{
			LoginFlagInfo="用户已经登录,不允许再次登录";
			session.put("LoginFlagInfo", LoginFlagInfo);
			return "input";
		}
		
	}
	
	//用户登录信息保存
	public String userInfo(){	
		return "person";
	}
	
	//更新用户部分信息
	public String updateUser(){
		userServicelmpl.updateUser(usertable2);
		return "SUCCESS";
	}
	
	//用户的空间
	public String userPersonalSpace(){		
		String sql="from Newstable where author='"+userName+"'";
		list = newsServicelmpl.getAllNews(sql , page, rowsPerPage);
		totalPage=newsServicelmpl.getTotalPage(rowsPerPage);
		planNum=newsServicelmpl.getPlanNum();		
		Map<String, Object> session = (Map)ActionContext.getContext().getSession();
		session.put("userNewsList", null);
		session.put("userNewsList", list);
		session.put("userPersonalSpaceName", userName);
		System.out.println(userName);
		return "solo";
	}
}