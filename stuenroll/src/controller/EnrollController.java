package controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;

import config.Factory;
import dao.EnrollDao;

public class EnrollController extends Controller{
	private EnrollDao enrolldao = (EnrollDao) Factory.getBean("EnrollDao");

	public void searchAll() {
		String pid = getPara("pid");
		List<Record> list = enrolldao.searchAll(pid);//返回查找数据库对应pid的编号
		Cache cache = Redis.use("enroll");//返回查找Redis
		//if (list.isEmpty() == true && cache.hmget(pid, "name").get(0) == null) {
		if (list.isEmpty() && !cache.exists(pid)) {
			setAttr("result", true);
			renderJson();
		} else {
			if(!list.isEmpty()){
				System.out.println("该身份证号已存在数据库里!");
			}
			if(cache.exists(pid)){
				System.out.println("该身份证号已存在Cache里!");
			}
			setAttr("result", false);
			renderJson();
		}
	}
   public void searchPid(){
    	String pid = getPara("pid");
		Record result = enrolldao.searchPid(pid);
		System.out.println(result);
		if(result==null) {
			this.setAttr("error",null); 
		} else {
			this.setAttr("error", result);
		}
		renderJson();
    }
	public void register(){
		String name=getPara("name");
		String sex=getPara("sex");
		String nation=getPara("nation");
		String pid=getPara("pid");
		String GrSchool=getPara("graduate_school");
		String GrYear=getPara("graduate_year");
		String GrDate=getPara("graduate_date");
		String education=getPara("education");
		String GrSpecialty=getPara("graduate_specialty");
		String healthy=getPara("healthy");
		String politics=getPara("politics");
		String birthday=getPara("birthday");
		String address=getPara("address");
		String houseAddress=getPara("household_address");
		String tel=getPara("tel");
		String email=getPara("email");
		String home_address=getPara("home_address");
		String home_tel=getPara("home_tel");
		String specialty_id=getPara("specialty");
		String orgnization_id=getPara("orgnization_id");
		String place=getPara("place");
		String year=getPara("year");
		//String create_time=getPara("create_time");
		
		//TODO把数据写入到Redis高速缓存
		Cache cache=Redis.use("enroll");
		HashMap map=new HashMap();
		map.put("name",name);
		map.put("sex",sex);
		map.put("nation",nation);
		map.put("pid",pid);
		map.put("graduate_school",GrSchool);
		map.put("graduate_year",GrYear);
		map.put("graduate_date",GrDate);
		map.put("education",education);
		map.put("graduate_specialty",GrSpecialty);
		map.put("healthy",healthy);
		map.put("politics",politics);
		map.put("birthday",birthday);
		map.put("address",address);
		map.put("household_address",houseAddress);
		map.put("tel",tel);
		map.put("email",email);
		map.put("home_address",home_address);
		map.put("home_tel",home_tel);
		map.put("specialty_id",specialty_id);
		map.put("orgnization_id",orgnization_id);
		map.put("place",place);
		map.put("year",year);
		
		
		cache.hmset(pid,map);
		
		setAttr("result",true);
		renderJson();
	}
	
}
