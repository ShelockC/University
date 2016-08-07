package config;

import java.util.HashMap;

import dao.ChartDao;
import dao.EnrollDao;
import dao.ExcelDao;
import dao.OrgnizationDao;
import dao.SpecialtyDao;

public class Factory {
	private static HashMap map=new HashMap();
	static{
		map.put("SpecialtyDao",new SpecialtyDao());
		map.put("OrgnizationDao",new OrgnizationDao());
		map.put("EnrollDao",new EnrollDao());
		map.put("ChartDao", new ChartDao());
		map.put("ExcelDao", new ExcelDao());
	}
	public static Object getBean(String param){
		if(map.containsKey(param)){
			return map.get(param);
		}else{
			return null;
		}
	}
	
}
