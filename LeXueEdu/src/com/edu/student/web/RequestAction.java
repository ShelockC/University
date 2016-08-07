package com.edu.student.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.edu.dao.StudentDB;
import com.edu.dao.TeacherDB;

public class RequestAction extends ActionSupport implements ServletRequestAware{
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
		String tel=(String)session.getAttribute("tell");
		System.out.print(tel);
		System.out.print("bbb");
		String name=request.getParameter("name");
		
		System.out.print("bbb");
		String sex=request.getParameter("sex");
		//String name=request.getParameter("name");
		String pid=request.getParameter("pid");
		String age=request.getParameter("age");
		String email=request.getParameter("email");
		String grade=request.getParameter("grade");
		System.out.print("bbb");
		String requestSex=request.getParameter("requestSex");
		String address=request.getParameter("address");
		String requestMoney=request.getParameter("requestMoney");
		String status=request.getParameter("status");
		String tell=request.getParameter("tell");
		//System.out.print("bbb");
		System.out.print(tell);
		//送入数据库  注册成功  跳转到个人信息管理界面
	    boolean tt=db.UpdateStudent(name,pid,age,sex,email,grade,requestSex,address,status,requestMoney,tell);
		if(tel!=null){
				System.out.println(tel);
			 List<String> student=db.Select(tel);
			 System.out.println(student);
			 if(student!=null){
				//将姓名 id传入session;
				 System.out.print(student.get(0));
				 ActionContext.getContext().getSession().put("name",student.get(0));
				 ActionContext.getContext().getSession().put("pid",student.get(1));
				 ActionContext.getContext().getSession().put("age",student.get(2));
				 ActionContext.getContext().getSession().put("sex",student.get(3));
				 ActionContext.getContext().getSession().put("email",student.get(4));
				 ActionContext.getContext().getSession().put("grade",student.get(5));
				 ActionContext.getContext().getSession().put("requestSex",student.get(6));
				 ActionContext.getContext().getSession().put("address",student.get(7));
				 ActionContext.getContext().getSession().put("status",student.get(8));
				 ActionContext.getContext().getSession().put("requestMoney",student.get(9));
				 
			 }
			
	 }	
		 return "success";

}
}
