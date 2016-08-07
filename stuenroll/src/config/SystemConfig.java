package config;


import java.util.Date;
import java.util.Timer;

import com.alibaba.druid.wall.WallConfig;
import com.alibaba.druid.wall.WallFilter;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.redis.RedisPlugin;
import com.jfinal.render.ViewType;

import controller.ChartController;
import controller.EnrollController;
import controller.ExcelController;
import controller.OrgnizationController;
import controller.SpecialtyController;
import controller.WelcomeController;

public class SystemConfig extends JFinalConfig{

	@Override
	public void configConstant(Constants constants) {
		constants.setDevMode(true);//开启开发者模式
		constants.setViewType(ViewType.JSP);//设置JSP和HTML作为网页界面
		
	}

	@Override
	public void configHandler(Handlers arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void configInterceptor(Interceptors arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void configPlugin(Plugins plugins) {
		DruidPlugin druidPlugin=new DruidPlugin("jdbc:mysql://localhost:8066/MyDB", "admin", "abc123456");
		
		WallFilter wall = new WallFilter();
		WallConfig config = new WallConfig();
		config.setStrictSyntaxCheck(false); // 关闭druid的SQL解析功能，这个功能会导致全局主键的失效
		wall.setConfig(config);
		druidPlugin.addFilter(wall);

		druidPlugin.setDriverClass("com.mysql.jdbc.Driver");//数据库驱动类
		druidPlugin.setInitialSize(5);//最小连接数
		druidPlugin.setMaxActive(20);//最大连接数
		druidPlugin.setTestOnBorrow(true);//每次使用数据库连接前先检测连接是否可用
		druidPlugin.setValidationQuery("select 1");//测试连接的SQL语句
		plugins.add(druidPlugin);//把连接池添加到JFinal框架
		
		ActiveRecordPlugin recordPlugin=new ActiveRecordPlugin(druidPlugin);//创建持久层对象并且使用Druid连接池
		plugins.add(recordPlugin);//把持久层对象添加到JFinal框架
		
		RedisPlugin redisPlugin = new RedisPlugin("enroll","localhost");//创建Redis插件
		plugins.add(redisPlugin);//把Redis插件添加到JFinal框架
	}

	@Override
	public void configRoute(Routes routes) {
		routes.add("/specialty",SpecialtyController.class);
		routes.add("/orgnization",OrgnizationController.class);
		routes.add("/enroll",EnrollController.class);
		routes.add("/chart",ChartController.class);
		routes.add("/welcome",WelcomeController.class);
		routes.add("/excel",ExcelController.class);
	}
	
	@Override
	public void afterJFinalStart() {
		Timer timer=new Timer();
		//启动定时器
		//timer.schedule(new RedisTask(),new Date("2016/1/11 10:04:00"));
		timer.scheduleAtFixedRate(new RedisTask(),new Date("2016/1/16 08:40:00"),24*3600*1000);
	}

}
