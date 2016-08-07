package dao;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class EnrollDao {
	public List<Record> searchAll(String pid){
		String sql="SELECT id FROM enroll WHERE pid=?";
		List<Record> list=Db.find(sql, pid);
		return list;
	}
	public void insert(String name,String sex,String nation,String pid,String graduate_school,String graduate_year,
			String graduate_date,String graduate_specialty,String education,String healthy,String politics,
			String birthday,String address,String household_address,String home_address,String tel,
			String home_tel,String email,String orgnization_id,
			String specialty_id,String place,int year){
		   // System.out.println("Inserter");
		   StringBuffer sql=new StringBuffer();
		   sql.append("insert into enroll(id,name,sex,nation,pid,graduate_school,graduate_year,graduate_date,"
		   		+ "graduate_specialty,education,healthy,politics,birthday,address,household_address,home_address,"
		   		+ "tel,home_tel,email,orgnization_id,state_id,specialty_id,place,year,create_time) ");//最后必须加空格
		   sql.append("values(NEXT value FOR MYCATSEQ_ENROLL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1,?,?,?,now())");
		   Db.update(sql.toString(),name,sex,nation,pid,graduate_school,graduate_year,graduate_date,
				   graduate_specialty,education,healthy,politics,birthday,address,household_address,home_address,
				   tel,home_tel,email,orgnization_id,specialty_id,place,year);
		   
	   }
	public Record searchPid(String pid) {
		String sql = "SELECT * FROM enroll  WHERE  pid = ?";
		return Db.findFirst(sql,pid);
	}
}
