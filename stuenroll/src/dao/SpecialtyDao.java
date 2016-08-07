package dao;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class SpecialtyDao {
	public List<Record> searchAll(){
	 String sql="select id,name FROM specialty";
	 List<Record> list=Db.find(sql);
	 return list;
	}
	public List<Record> analyse() {
		StringBuffer sql = new StringBuffer();

		sql.append("SELECT ");
		sql.append("	sp.id, ");
		sql.append("	sp. name, ");
		sql.append("( ");
		sql.append("	SELECT ");
		sql.append("		COUNT(DISTINCT o.id) ");
		sql.append("	FROM ");
		sql.append("		enroll e ");
		sql.append("	JOIN orgnization o ON o.id = e.orgnization_id ");
		sql.append("	WHERE ");
		sql.append("		specialty_id = sp.id ");
		sql.append(") AS 'orgnization_count', ");
		sql.append("( ");
		sql.append("	SELECT ");
		sql.append("		COUNT(*) ");
		sql.append("	FROM ");
		sql.append("		class ");
		sql.append("	WHERE ");
		sql.append("		specialty_id = sp.id ");
		sql.append(") AS 'class_num', ");
		sql.append("( ");
		sql.append("	SELECT ");
		sql.append("		COUNT(*) ");
		sql.append("	FROM ");
		sql.append("		enroll ");
		sql.append("	WHERE ");
		sql.append("		specialty_id = sp.id ");
		sql.append("	) AS 'enroll_count' ");
		sql.append("FROM ");
		sql.append("	enroll e ");
		sql.append("RIGHT JOIN specialty sp ON e.specialty_id = sp.id ");
		sql.append("GROUP BY ");
		sql.append("	sp.id ");

		List<Record> list = Db.find(sql.toString());
		return list;

	}
}
