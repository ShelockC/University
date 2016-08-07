package controller;
import java.util.HashMap;
import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;

import config.Factory;
import dao.ChartDao;

public class ChartController extends Controller{
	private ChartDao chartDao=(ChartDao) Factory.getBean("ChartDao");
	
	public void chartmonth(){
		Record list1= chartDao.chartmonth();
		Record list2= chartDao.chartstudent();
		Record list3= chartDao.chartclass();
		
		setAttr("list1",list1);
		setAttr("list2",list2);
		setAttr("list3",list3);
		renderJson();
	}
	
	public void chartpie(){
		List<Record> list= chartDao.chartpie();
		setAttr("list",list);
		renderJson();
	}

	public void chartrate(){
		Record list= chartDao.chartrate();
		setAttr("list",list);
		renderJson();
	}
	
	public void charttable1(){
		Record list= chartDao.charttable1();
		setAttr("list",list);
		renderJson();
	}
	
	public void charttable2(){
		Record list= chartDao.charttable2();
		setAttr("list",list);
		renderJson();
	}
	
}

