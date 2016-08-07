package dao;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class ChartDao {
	public Record chartmonth(){
		String sql="SELECT (SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 1 AND YEAR (create_time) = YEAR(NOW()))AS 'Jan',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 2 AND YEAR (create_time) = YEAR(NOW()))AS 'Feb',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 3 AND YEAR (create_time) = YEAR(NOW()))AS 'Mar',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 4 AND YEAR (create_time) = YEAR(NOW()))AS 'Apr',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 5 AND YEAR (create_time) = YEAR(NOW()))AS 'May',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 6 AND YEAR (create_time) = YEAR(NOW()))AS 'Jun',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 7 AND YEAR (create_time) = YEAR(NOW()))AS 'Jul',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 8 AND YEAR (create_time) = YEAR(NOW()))AS 'Aug',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 9 AND YEAR (create_time) = YEAR(NOW()))AS 'Sep',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 10 AND YEAR (create_time) = YEAR(NOW()))AS 'Oct',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 11 AND YEAR (create_time) = YEAR(NOW()))AS 'Nov',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 12 AND YEAR (create_time) = YEAR(NOW()))AS 'Dec' "
				+ "FROM test WHERE id=1";
//		
		 Record list1=Db.findFirst(sql);
		 return list1;
		}
	
	public Record chartstudent(){
		String sql="SELECT (SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 1 AND YEAR (create_time) = YEAR(NOW())AND state_id!=1)AS 'Jan',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 2 AND YEAR (create_time) = YEAR(NOW())AND state_id!=1)AS 'Feb',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 3 AND YEAR (create_time) = YEAR(NOW())AND state_id!=1)AS 'Mar',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 4 AND YEAR (create_time) = YEAR(NOW())AND state_id!=1)AS 'Apr',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 5 AND YEAR (create_time) = YEAR(NOW())AND state_id!=1)AS 'May',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 6 AND YEAR (create_time) = YEAR(NOW())AND state_id!=1)AS 'Jun',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 7 AND YEAR (create_time) = YEAR(NOW())AND state_id!=1)AS 'Jul',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 8 AND YEAR (create_time) = YEAR(NOW())AND state_id!=1)AS 'Aug',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 9 AND YEAR (create_time) = YEAR(NOW())AND state_id!=1)AS 'Sep',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 10 AND YEAR (create_time) = YEAR(NOW())AND state_id!=1)AS 'Oct',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 11 AND YEAR (create_time) = YEAR(NOW())AND state_id!=1)AS 'Nov',"
				+ "(SELECT COUNT(*) FROM enroll WHERE MONTH(create_time) = 12 AND YEAR (create_time) = YEAR(NOW())AND state_id!=1)AS 'Dec' "
				+ "FROM test WHERE id=1";
//		
		 Record list2=Db.findFirst(sql);
		 return list2;
		}
	
	public Record chartclass(){
		String sql="SELECT (SELECT COUNT(*) FROM class WHERE MONTH(create_time) = 1 AND YEAR (create_time) = YEAR(NOW()))AS 'Jan',"
				+ "(SELECT COUNT(*) FROM class WHERE MONTH(create_time) = 2 AND YEAR (create_time) = YEAR(NOW()))AS 'Feb',"
				+ "(SELECT COUNT(*) FROM class WHERE MONTH(create_time) = 3 AND YEAR (create_time) = YEAR(NOW()))AS 'Mar',"
				+ "(SELECT COUNT(*) FROM class WHERE MONTH(create_time) = 4 AND YEAR (create_time) = YEAR(NOW()))AS 'Apr',"
				+ "(SELECT COUNT(*) FROM class WHERE MONTH(create_time) = 5 AND YEAR (create_time) = YEAR(NOW()))AS 'May',"
				+ "(SELECT COUNT(*) FROM class WHERE MONTH(create_time) = 6 AND YEAR (create_time) = YEAR(NOW()))AS 'Jun',"
				+ "(SELECT COUNT(*) FROM class WHERE MONTH(create_time) = 7 AND YEAR (create_time) = YEAR(NOW()))AS 'Jul',"
				+ "(SELECT COUNT(*) FROM class WHERE MONTH(create_time) = 8 AND YEAR (create_time) = YEAR(NOW()))AS 'Aug',"
				+ "(SELECT COUNT(*) FROM class WHERE MONTH(create_time) = 9 AND YEAR (create_time) = YEAR(NOW()))AS 'Sep',"
				+ "(SELECT COUNT(*) FROM class WHERE MONTH(create_time) = 10 AND YEAR (create_time) = YEAR(NOW()))AS 'Oct',"
				+ "(SELECT COUNT(*) FROM class WHERE MONTH(create_time) = 11 AND YEAR (create_time) = YEAR(NOW()))AS 'Nov',"
				+ "(SELECT COUNT(*) FROM class WHERE MONTH(create_time) = 12 AND YEAR (create_time) = YEAR(NOW()))AS 'Dec' "
				+ "FROM test WHERE id=1";
//		
		 Record list3=Db.findFirst(sql);
		 return list3;
		}
	
	public List<Record> chartpie(){
		String sql="SELECT sp.id,sp.name,"
				+ "(SELECT COUNT(*) FROM enroll e JOIN orgnization o ON o.id = e.orgnization_id"
				+ " WHERE specialty_id = sp.id)AS 'specialty_count' "
				+ "FROM enroll e RIGHT JOIN specialty sp ON e.specialty_id = sp.id GROUP BY sp.id";
		List<Record> list=Db.find(sql);
		return list;
	}
	
	public Record chartrate(){
		String sql="SELECT COUNT(*)FROM enroll "
				+ "WHERE state_id = 1 AND YEAR (create_time) = YEAR(now())FROM test WHERE id=1;";
		Record list=Db.findFirst(sql.toString());
		return list;
	}
	
	public Record charttable1(){
		String sql="SELECT(SELECT COUNT(*) FROM enroll WHERE DATE(create_time) BETWEEN DATE_SUB(DATE(NOW()),INTERVAL 10 DAY) AND DATE(NOW()))AS 'tendays1',"
				+ " (SELECT COUNT(*) FROM enroll WHERE DATE(create_time) BETWEEN DATE_SUB(DATE(NOW()),INTERVAL 30 DAY) AND DATE(NOW())) AS 'one_month1',"
				+ " (SELECT COUNT(*) FROM enroll WHERE DATE(create_time) BETWEEN DATE_SUB(DATE(NOW()),INTERVAL 90 DAY) AND DATE(NOW())) AS 'three_month1',"
				+ " (SELECT COUNT(*) FROM enroll WHERE DATE(create_time) BETWEEN DATE_SUB(DATE(NOW()),INTERVAL 180 DAY) AND DATE(NOW())) AS 'six_month1', "
				+ "(SELECT COUNT(*) FROM enroll WHERE DATE(create_time) < DATE_SUB(DATE(NOW()),INTERVAL 180 DAY) AND DATE(NOW()))AS 'more_month1' FROM test WHERE id=1";
		Record list=Db.findFirst(sql.toString());
		return list;
	}
	
	public Record charttable2(){
		String sql="SELECT(SELECT COUNT(*) FROM enroll WHERE DATE(create_time) BETWEEN DATE_SUB(DATE(NOW()),INTERVAL 10 DAY) AND DATE(NOW())AND state_id!=1)AS 'tendays2',"
				+ " (SELECT COUNT(*) FROM enroll WHERE DATE(create_time) BETWEEN DATE_SUB(DATE(NOW()),INTERVAL 30 DAY) AND DATE(NOW())AND state_id!=1) AS 'one_month2',"
				+ " (SELECT COUNT(*) FROM enroll WHERE DATE(create_time) BETWEEN DATE_SUB(DATE(NOW()),INTERVAL 90 DAY) AND DATE(NOW())AND state_id!=1) AS 'three_month2',"
				+ " (SELECT COUNT(*) FROM enroll WHERE DATE(create_time) BETWEEN DATE_SUB(DATE(NOW()),INTERVAL 180 DAY) AND DATE(NOW())AND state_id!=1) AS 'six_month2', "
				+ "(SELECT COUNT(*) FROM enroll WHERE DATE(create_time) < DATE_SUB(DATE(NOW()),INTERVAL 180 DAY) AND DATE(NOW())AND state_id!=1)AS 'more_month2' FROM test WHERE id=1";
		Record list=Db.findFirst(sql.toString());
		return list;
	}
	
}
