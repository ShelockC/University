package controller;


import config.Factory;

import dao.ExcelDao;
import java.io.*;
import java.util.*;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.ExporterOutput;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.InterningXmlVisitor;

public class ExcelController extends Controller{
	private ExcelDao excelDao=(ExcelDao) Factory.getBean("ExcelDao");
public void applyExcel()throws Exception, JRException {
	
	HashMap parameter = new HashMap();
		parameter.put("name", "");
		parameter.put("sex", "");
		parameter.put("nation", "");
		parameter.put("pid", "");
		parameter.put("graduate_school", "");
		parameter.put("graduate_year", "");
		parameter.put("graduate_date", "");
		parameter.put("education", "");
		parameter.put("graduate_specialty", "");
		parameter.put("healthy", "");
		parameter.put("politics", "");
		parameter.put("brithday", "");
		parameter.put("address", "");
		parameter.put("household_address", "");
		parameter.put("tel", "");
		parameter.put("emile", "");
		parameter.put("home_address", "");
		parameter.put("home_tel", "");
		parameter.put("specialty_id", "");
		parameter.put("orginzation_id", "");
		parameter.put("training_place", "");
		parameter.put("view", "");
		parameter.put("remarks", "");
		parameter.put("sign", "");
			
		HashSet set = new HashSet();
		set.add("Hello");
		
		JRBeanCollectionDataSource source = new JRBeanCollectionDataSource(set);
		JasperReport jasperReport=(JasperReport) JRLoader.loadObject(new FileInputStream("d:/报名表.jasper"));
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameter, source);
			
		ArrayList list=new ArrayList();
		list.add(jasperPrint);
		
		JRDocxExporter exporter=new JRDocxExporter();
		exporter.setParameter(JRExporterParameter.JASPER_PRINT_LIST, list);
		exporter.setParameter(JRExporterParameter.OUTPUT_FILE, new File("d:/报名表.docx"));
		exporter.exportReport();
		renderFile(new File("d:/报名表.docx"));//下载报名表
	}	
public void MyapplyExcel() throws Exception, JRException{
	String pid = this.getPara("pid");
	Record record=excelDao.myapplyExcel(pid);
	HashMap parameter = new HashMap();
	parameter.put("name", record.get("name")+"");
	parameter.put("sex", record.get("sex")+"");
	parameter.put("nation", record.get("nation")+"");
	parameter.put("pid", record.get("pid")+"");
	parameter.put("graduate_school",record.get("graduate_school")+"");
	parameter.put("graduate_year", record.get("graduate_year")+"");
	parameter.put("graduate_date", record.get("graduate_date")+"");
	parameter.put("education", record.get("education")+"");
	parameter.put("graduate_specialty", record.get("graduate_specialty")+"");
	parameter.put("healthy", record.get("healthy")+"");
	parameter.put("politics", record.get("politics")+"");
	parameter.put("brithday", record.get("birthday")+"");
	parameter.put("address", record.get("address")+"");
	parameter.put("household_address", record.get("household_address")+"");
	parameter.put("tel", record.get("tel")+"");
	parameter.put("emile", record.get("email")+"");
	parameter.put("home_address", record.get("home_address")+"");
	parameter.put("home_tel", record.get("home_tel")+"");
	parameter.put("specialty_id", record.get("name1")+"");
	parameter.put("orginzation_id", record.get("name2")+"");
	parameter.put("training_place", record.get("place")+"");
	parameter.put("view", "");
	parameter.put("remarks", "");
	parameter.put("sign", "");
		
	HashSet set = new HashSet();
	set.add("Hello");
	
	JRBeanCollectionDataSource source = new JRBeanCollectionDataSource(set);
	JasperReport jasperReport=(JasperReport) JRLoader.loadObject(new FileInputStream("d:/报名表.jasper"));
	JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameter, source);
		
	ArrayList list=new ArrayList();
	list.add(jasperPrint);
	JRDocxExporter exporter=new JRDocxExporter();
	exporter.setParameter(JRExporterParameter.JASPER_PRINT_LIST, list);
	exporter.setParameter(JRExporterParameter.OUTPUT_FILE, new File("d:/我的报名表.docx"));
	exporter.exportReport();
	renderFile(new File("d:/我的报名表.docx"));//下载我的报名表
}

}


	




