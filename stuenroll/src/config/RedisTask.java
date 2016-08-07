package config;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TimerTask;

import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;

import dao.EnrollDao;

public class RedisTask extends TimerTask{
	public void run(){
		EnrollDao enrollDao=(EnrollDao) Factory.getBean("EnrollDao");
		Cache cache=Redis.use("enroll");
		Set<String> set=cache.keys("*");//缓存的所有Key
		//根据每一个Key获得对应的报名数据
		Iterator<String> iterator=set.iterator();//"吸管"
		while(iterator.hasNext()){//集合中有数据则为true则取出
			String key=iterator.next();//一个key值
			List<String> list=cache.hmget(key,"name","sex","nation","pid",
					"graduate_school","graduate_year","graduate_date","education",
					"graduate_specialty","healthy","politics","birthday","address",
					"household_address","tel","email","home_address","home_tel",
					"specialty_id","orgnization_id","place","year");//根据key查数据
			System.out.print(list);
			//TODO调用DAO把数据保存到数据库里面
			int i=0;
			String name =list.get(i);
			String sex =list.get(i+1);
			String nation =list.get(i+2);
			String pid =list.get(i+3);
			String graduate_school =list.get(i+4);
			String graduate_year =list.get(i+5);
			String graduate_date =list.get(i+6);
			String education=list.get(i+7);
			String graduate_specialty=list.get(i+8);
			String healthy =list.get(i+9);
			String politics =list.get(i+10);
			String birthday =list.get(i+11);
			String address =list.get(i+12);
			String household_address =list.get(i+13);
			String tel =list.get(i+14);
			String email =list.get(i+15);
			String home_address =list.get(i+16);
			String home_tel =list.get(i+17);
			String specialty_id =list.get(i+18);
			String orgnization_id =list.get(i+19);
			String place =list.get(i+20);
			int year =Integer.parseInt(list.get(i+21));
			//String create_time =list.get(i+22);
			
			//System.out.println(list.get(i+2));
			enrollDao.insert(name,sex,nation,pid,graduate_school,graduate_year,graduate_date,
					   graduate_specialty,education,healthy,politics,birthday,address,household_address,home_address,
					   tel,home_tel,email,orgnization_id,specialty_id,place,year);
			cache.del(key);//数据保存到数据库之后删除Redis里面的这条数据/**/
			//System.out.println("2");
			
			
		}
	}
	

}
