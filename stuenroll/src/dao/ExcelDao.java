package dao;

import java.io.File;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import config.Factory;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;
import net.sf.jasperreports.engine.util.JRLoader;

public class ExcelDao {
	
	/*public List<Record> specialtyEx(){
		String sql="SELECT sp.id,sp.name, (SELECT COUNT(DISTINCT o.id) FROM enroll e JOIN orginzation o ON o.id=e.orginzation_id WHERE speciatly_id=sp.id)AS 'orgnization_count',(SELECT COUNT(*) FROM class WHERE specialty_id=sp.id)AS 'class_count',(SELECT COUNT(*) FROM enroll WHERE speciatly_id=sp.id)AS 'enroll_count' FROM enroll  e RIGHT JOIN specialty sp ON e.speciatly_id=sp.id GROUP BY sp.id";
		List<Record> list=Db.find(sql);
		//System.out.println(list);
		return list;
	}
	public List<Record> orgniztionEx(){
		String sql="SELECT o.id, o.name, ( SELECT	COUNT(DISTINCT sp.id)	FROM	class c JOIN specialty sp ON sp.id = c.specialty_id	WHERE orginzation_id = o.id) AS 'specialty_count',( SELECT	COUNT(*)	FROM	class	WHERE	orginzation_id = o.id)AS 'class_count',( SELECT	COUNT(*)	FROM	enroll	WHERE	orginzation_id = o.id)AS 'enroll_count' FROM enroll e RIGHT JOIN orginzation o ON e.orginzation_id = o.id GROUP BY	o.id";
		List<Record> list=Db.find(sql);
		return list;
	}*/
	public Record myapplyExcel(String pid){
		String sql="SELECT	e.name,e.sex,e.nation,e.pid,e.graduate_school,e.graduate_year,e.graduate_date,e.education,e.graduate_specialty,e.healthy,e.politics,e.birthday,e.address,e.household_address,e.tel,e.email,e.home_address,e.home_tel,e.place,sp.name AS 'name1',o.name AS 'name2' FROM	enroll e JOIN orgnization o JOIN specialty sp ON e.orgnization_id = o.id AND e.specialty_id=sp.id WHERE  e.pid = ?";
		return Db.findFirst(sql,pid);
					}
}
