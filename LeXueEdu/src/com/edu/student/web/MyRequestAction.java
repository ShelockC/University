package com.edu.student.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.edu.dao.StudentDB;

public class MyRequestAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private HttpSession session;
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	 public String excute(){
	 session = ServletActionContext.getRequest().getSession();
		StudentDB db=new StudentDB();
		String tell=(String)session.getAttribute("tell");
		System.out.print(tell);
		System.out.print("bbb");
		List<String> student=db.Select(tell);
		request.setAttribute("s_name",student.get(0));
		request.setAttribute("s_pid",student.get(1));
		request.setAttribute("s_age",student.get(2));
		request.setAttribute("s_sex",student.get(3));
		request.setAttribute("s_email",student.get(4));
		request.setAttribute("s_grade",student.get(5));
		request.setAttribute("s_requestSex",student.get(6));
		request.setAttribute("s_address",student.get(7));
		request.setAttribute("s_status",student.get(8));
		request.setAttribute("s_requestMoney",student.get(9));
		 return "success";
}
}
