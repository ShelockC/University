package com.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.edu.dao.Conn;

public class UserDB {
	private Connection conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	
	public boolean regester(String tell){//判断注册用户是否已注册
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="select tell from user where tell="+tell;
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
		 	while(rs.next()){
		   		//说明用户名存在
		   		if(rs.getString(1).equals(tell)){
		   			//注册失败
		   			tt=true;
		   			return tt;
		   		}
		 	}
		 	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return tt;
	}
	public boolean InsertUser(String tell,String password,String role){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="insert into user(tell,password,role)values('"+tell+"','"+password+"','"+role+"')";
		try {
			ps=conn.prepareStatement(sql);
			int i=ps.executeUpdate();
			if(i>0){
				tt=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tt;
	}
	public boolean Insert(String tell,String role){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="";
		if(role.equals("教员")){
			sql="insert into teacher(tell)values('"+tell+"')";
		}
		if(role.equals("学员")){
			sql="insert into student(tell)values('"+tell+"')";
		}
		if(!sql.equals("")){
			try {
				ps=conn.prepareStatement(sql);
				int i=ps.executeUpdate();
				if(i>0){
					tt=true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				this.close();
			}
			
		}
		
		return tt;
	}
	
	
	
	public boolean UpdatePW(String tell,String password){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="update user set password='"+password+"' where tell='"+tell+"'";
		try {
			ps=conn.prepareStatement(sql);
			int i=ps.executeUpdate();
			if(i>0){
				tt=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tt;
	}
	public List<String> login(String usertell,String password){//用户登陆
		List<String> user = new ArrayList<String>();// 利用ArrayList类实例化List集合  
		conn=Conn.getConnect();
		System.out.println("=========================");
		String sql="select id,tell,password,role from user where tell='"+usertell+"'";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				int id=rs.getInt("id");
				String tell=rs.getString("tell");
				String upassword=rs.getString("password");
				String rolt=rs.getString("role");
				user.add(id+"");
				user.add(tell);
				user.add(upassword);
				user.add(rolt);
				if(tell.equals(usertell)&&upassword.equals(password)){
					return user;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return null;
	}
	public String username(String id,String role){	//根据注册的角色查询不同表
		conn=Conn.getConnect();
		String s_sql="";
		String name="";
		if(role.equals("student")){
			s_sql="select s_name from student where u_id='"+id+"'";
		}
		else if(role.equals("teacher")){
			s_sql="select t_name from teacher where u_id='"+id+"'";
		}
		try {
			ps=conn.prepareStatement(s_sql);
			rs=ps.executeQuery();
			while(rs.next()){
				name=rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		
		return name;
	}
	
	
	
	
	//关闭资源
	public void close(){
		try {
			if(rs!=null){
				rs.close();
				rs=null;
			}
			if(ps!=null){
				ps.close();
				ps=null;
			}
			if(conn!=null){
				conn.close();
				conn=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}