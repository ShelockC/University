package com.edu.web;

import javax.servlet.http.HttpSession;


import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.edu.dao.UserDB;

public class RegisterAction extends ActionSupport{

	 private HttpSession session;
	 public String excute(){
			session = ServletActionContext.getRequest().getSession();
			UserDB db=new UserDB();
			String role= (String) session.getAttribute("role");
			String usertell = (String) session.getAttribute("tell");
			String password = (String) session.getAttribute("password");
			 //送入数据库  注册成功  跳转到个人信息管理界面
			 boolean tt=db.InsertUser(usertell, password, role);
			 
			 if(tt){
				 boolean t=db.Insert(usertell, role);
				 if(t){
					 return "success";
				 }else{
					 return "false";
				 }
			 }else{
				 return "false";
			 }
	 }
	 
}