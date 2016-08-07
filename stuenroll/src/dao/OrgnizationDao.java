package dao;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class OrgnizationDao {
	public List<Record> searchAll(){
		 String sql="select id,name FROM orgnization";
		 List<Record> list=Db.find(sql);
		 return list;
		}
	public List<Record> analyse() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT ");
		sql.append("	o.id, ");
		sql.append("	o. name, ");
		sql.append("( ");
		sql.append("	SELECT ");
		sql.append("		COUNT(DISTINCT sp.id) ");
		sql.append("	FROM ");
		sql.append("		enroll e ");
		sql.append("	JOIN specialty sp ON sp.id = e.orgnization_id ");
		sql.append("	WHERE ");
		sql.append("		orgnization_id = o.id ");
		sql.append(") AS 'specialty_count', ");
		sql.append("( ");
		sql.append("	SELECT ");
		sql.append("		COUNT(*) ");
		sql.append("	FROM ");
		sql.append("		class ");
		sql.append("	WHERE ");
		sql.append("		orgnization_id = o.id ");
		sql.append(") AS 'class_num', ");
		sql.append("( ");
		sql.append("	SELECT ");
		sql.append("		COUNT(*) ");
		sql.append("	FROM ");
		sql.append("		enroll ");
		sql.append("	WHERE ");
		sql.append("		orgnization_id = o.id ");
		sql.append("	) AS 'enroll_count' ");
		sql.append("FROM ");
		sql.append("	enroll e ");
		sql.append("RIGHT JOIN orgnization o ON e.orgnization_id = o.id ");
		sql.append("GROUP BY ");
		sql.append("	o.id ");

		List<Record> list = Db.find(sql.toString());
		return list;

	}
}
