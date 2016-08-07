package controller;

import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;

import config.Factory;
import dao.SpecialtyDao;

public class SpecialtyController extends Controller{
	private SpecialtyDao specialtyDao=(SpecialtyDao) Factory.getBean("SpecialtyDao");
	
	public void searchAll(){
		List<Record> list=specialtyDao.searchAll();
		setAttr("list",list);
		renderJson();
	}
}
