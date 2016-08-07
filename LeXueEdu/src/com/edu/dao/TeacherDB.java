package com.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.edu.bean.LessionBean;
import com.edu.bean.TeacherBean;

public class TeacherDB {
	private Connection conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	
	private int pageSize=4;//一页显示几条记录
	private int rowCount=0;//共有几条记录(查表)
	private int pageCount=0;//共有几页(计算)
	
	public int getPageCount(){//得到总页数
		conn=Conn.getConnect();
		String sql="select count(*) from teacher";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				rowCount=rs.getInt(1);
			}
			//计算pageCount,这里的算法很多，可以自己设计
			if(rowCount%pageSize==0){
				pageCount=rowCount/pageSize;
			}else{
				pageCount=rowCount/pageSize+1;
			}
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return pageCount;
	}
	public ArrayList getTeacherPage(int pageNow){//------分页给定页数的数据------------
		ArrayList list=new ArrayList();
		conn=Conn.getConnect();
		String sql="select * from teacher where authentication='1' limit ?,?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1,4*pageNow-4);
			ps.setInt(2,pageSize);
			rs=ps.executeQuery();
			while(rs.next()){
				TeacherBean bean=new TeacherBean();
				bean.setId(rs.getInt(1));
				bean.setU_id(rs.getInt(2));
				bean.setPid(rs.getString(3));
				bean.setImages(rs.getString(4));
				bean.setT_name(rs.getString(5));
				bean.setSex(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setNationality(rs.getString(8));
				bean.setTell(rs.getString(9));
				bean.setPassword(rs.getString(10));
				bean.setEmail(rs.getString(11));
				bean.setMotto(rs.getString(12));
				bean.setIntroduce(rs.getString(13));
				bean.setGraduate_school(rs.getString(14));
				bean.setSpecialty(rs.getString(15));
				bean.setEducation(rs.getString(16));
				bean.setAddress(rs.getString(17));
				bean.setAuthentication(rs.getString(18));
				bean.setExperience(rs.getString(19));
				bean.setMoney(rs.getString(20));
				bean.setTeach_time(rs.getString(21));
				bean.setSubject(rs.getString(22));//得到所查询的科目
				bean.setArea(rs.getString(23));//得到授课区域
				list.add(bean);
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return list;
	}
	
	//插入所授科目数据
	
	//查询所授科目
	public String subject(String tell){
			conn=Conn.getConnect();
			String tt="";
			String sql="select grade,subject from lesson where tell=?";
			String grade="";String subject="";
			try {
				ps=conn.prepareStatement(sql);
				ps.setString(1,tell);
				rs=ps.executeQuery();
				if(rs.next()){
					while(rs.next()){
						grade=rs.getString(1);
						subject=rs.getString(2);
						tt=tt+grade+subject+"|";
					}
				}else{
					tt="暂未设置";
				}
			sql="update teacher set subject='"+tt+"' where tell="+tell;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			
			System.out.println(tt);
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return tt;
		}
	
	
	
	//查询教授区域和地址
	public List<String> getAddress(String tell){
		List<String> teacher = new ArrayList<String>();// 利用ArrayList类实例化List集合  
		conn=Conn.getConnect();
		System.out.println("=========================");
		String sql="select area,address from teacher where tell='"+tell+"'";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				String area=rs.getString("area");
				String address=rs.getString("address");
				teacher.add(area);
				teacher.add(address);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return teacher;
	}
	//修改教授区域和地址
	public boolean UpdateAddress(String area,String address,String tell){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="update teacher set area='"+area+"',address='"+address+"' where tell='"+tell+"'";
		try {
			ps=conn.prepareStatement(sql);
			int i=ps.executeUpdate();
			if(i>0){
				tt=true;
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tt;
	}
	
	
	//查询可授课表
	public ArrayList getLession(String tell){
		conn=Conn.getConnect();
		ArrayList lesson=new ArrayList();
		String sql="select id,grade,subject from lesson where tell='"+tell+"' ORDER BY id DESC";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				LessionBean lb=new LessionBean();
				lb.setId(rs.getInt(1));
				lb.setGrade(rs.getString(2));
				lb.setSubject(rs.getString(3));
				lesson.add(lb);
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return lesson;
	}
	//添加可授课表
	public boolean setLession(String tell,String grade,String subject){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="insert into lesson(tell,grade,subject)values('"+tell+"','"+grade+"','"+subject+"')";
		try {
			ps=conn.prepareStatement(sql);
			int i=ps.executeUpdate();
			if(i>0){
				tt=true;
				subject(tell);//添加成功及时插入teacher表
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tt;
	}
	//删除授课信息
	public boolean dellLession(String id,String tell){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql="delete from lesson where id="+id;
		try {
			ps=conn.prepareStatement(sql);
			int i=ps.executeUpdate();
			if(i>0){
				tt=true;
				subject(tell);//添加成功及时插入teacher表
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return tt;
	}
	//查询头像
	public String selectImg(String tell){
		String tt="";
		conn=Conn.getConnect();
		String sql="select images from teacher where tell="+tell;
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				tt=rs.getString(1);
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tt;
	}
	
	//更新头像------------------------------------------------------
	public boolean Updateimg(String path,String tell){
		boolean tt=false;
		conn=Conn.getConnect();
		try {
				String sql="update teacher set images='"+path+"' where tell="+tell;
				ps=conn.prepareStatement(sql);
				int i=ps.executeUpdate();
				if(i>0){
					tt=true;
				}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return tt;
	}
	
	/*
	 * 2016-7-12添加start
	 * 
	 * */
	public TeacherBean getTeacherInfo(String tell){
		conn=Conn.getConnect();
		//ArrayList list=new ArrayList();
		TeacherBean bean=new TeacherBean();
		String sql="select * from teacher where tell="+tell;
		conn=Conn.getConnect();
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				bean.setId(rs.getInt(1));
				bean.setU_id(rs.getInt(2));
				bean.setPid(rs.getString(3));
				bean.setImages(rs.getString(4));
				bean.setT_name(rs.getString(5));
				bean.setSex(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setNationality(rs.getString(8));
				bean.setTell(rs.getString(9));
				bean.setPassword(rs.getString(10));
				bean.setEmail(rs.getString(11));
				bean.setMotto(rs.getString(12));
				bean.setIntroduce(rs.getString(13));
				bean.setGraduate_school(rs.getString(14));
				bean.setSpecialty(rs.getString(15));
				bean.setEducation(rs.getString(16));
				bean.setAddress(rs.getString(17));
				bean.setAuthentication(rs.getString(18));
				bean.setExperience(rs.getString(19));
				bean.setMoney(rs.getString(20));
				bean.setTeach_time(rs.getString(21));
				bean.setSubject(rs.getString(22));//得到所查询的科目
				bean.setArea(rs.getString(23));//得到授课区域
			
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		/*
		 * 20167-12添加end
		 * 
		 * */
		
		return bean;
	}
		
	    public boolean UpdateTeacher(String pid,String username,String sex,String age,String nation,String email,String motto,String introduce,String graduate_school,String specialty,String education,String experience,String tell){
		boolean tt=false;
		conn=Conn.getConnect();
		String sql = "update teacher set pid='"+pid+"',t_name='"+username+"',sex='"+sex+"',age='"+age+"',nationality='"+nation+"',email='"+email+"',motto='"+motto+"',introduce='"+introduce+"',graduate_school='"+graduate_school+"',specialty='"+specialty+"',education='"+education+"',experience='"+experience+"'  where tell='"+tell+"'";  
        //String sql="update teacher set pid='"+pid+"'where id=1";
		try {
			ps=conn.prepareStatement(sql);
			/*ps.setString(1, pid);  
	        ps.setString(2, username);  
	        ps.setString(3, sex);  
	        ps.setString(4, age); 
	        ps.setString(5, nation);  
	        ps.setString(6, email);  
	        ps.setString(7, motto);  
	        ps.setString(8, introduce); 
	        ps.setString(9, specialty);  
	        ps.setString(10, education);  
	        ps.setString(11, experience);  
	        ps.setString(12, tell);  */
			//System.out.println(tt);
			int i=ps.executeUpdate();
			if(i>0){
				tt=true;
				System.out.print(tt);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tt;
	}
	    public List<String> Select(String tell){
	    	List<String> teacher = new ArrayList<String>();// 利用ArrayList类实例化List集合  
			conn=Conn.getConnect();
			String sql = "select * from teacher where tell='"+tell+"'";
			//System.out.println("21212");
	        try {
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				//System.out.println("fsdfsd");
				while(rs.next()){
					//System.out.println("bb");
					String username=rs.getString("t_name");
					String pid=rs.getString("pid");
					String sex=rs.getString("sex");
					String age=rs.getString("age");
					String nation=rs.getString("nationality");
					String email=rs.getString("email");
					String motto=rs.getString("motto");
					String introduce=rs.getString("introduce");
					String graduate_school=rs.getString("graduate_school");
					String specialty=rs.getString("specialty");
					String education=rs.getString("education");
					String experience=rs.getString("experience");
					System.out.println(username);
					teacher.add(username);
					teacher.add(pid);
					teacher.add(age);
					teacher.add(sex);
					teacher.add(nation);
					teacher.add(email);
					teacher.add(motto);
					teacher.add(introduce);
					teacher.add(graduate_school);
					teacher.add(specialty);
					teacher.add(education);
					teacher.add(experience);
					}
	        }catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return teacher;
	    }
	    public boolean SetTimeMoney(String teach_time,String money,String tell){
			boolean tt=false;
			conn=Conn.getConnect();
			String sql = "update teacher set money='"+money+"',teach_time='"+teach_time+"' where tell='"+tell+"'";  
	        //String sql="update teacher set pid='"+pid+"'where id=1";
			try {
				ps=conn.prepareStatement(sql);
				int i=ps.executeUpdate();
				if(i>0){
					tt=true;
					System.out.print(tt);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return tt;
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
//	  		public static void main(String[] args) {
//	  			TeacherDB db=new TeacherDB();
//	  			db.subject(1+"");
//	  		}
}

