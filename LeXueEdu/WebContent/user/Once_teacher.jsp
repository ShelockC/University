<%@ page language="java" import="java.util.*,com.edu.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>老师首页</title>
	<base href="<%=basePath%>">
	<link type="text/css" rel="stylesheet" href="user/teacher1.css">
	<link type="text/css" rel="stylesheet" href="user/teacher2.css">
	<script src="js/jquery-2.0.3.min.js" type="text/javascript"></script>
</head>
<body>
	<!-- 搜索栏 -->
	<div class="header">
        <ul>
        	<li>
        	   <img src="images/logo.png" />
        	</li>
        	<li>		
    	       <span>大连</span>
    	       <input type="text" placeholder="搜索您感兴趣的科目或老师">
    	       <a href="#">搜 索</a>
        	</li>
        </ul>
    	<ul>
    	<%
		    String name=(String)session.getAttribute("name");
		    String role=(String)session.getAttribute("role");
		    if(name!=null){
    	%>
    	<%
    		if(role.equals("教员")){
    	%>
    		<li><a href="teacher/set_teacher.jsp">您好<%=name %></a></li>
    		<li><a href="login.html">│退出</a></li>
    	<%
    		}else{
    	%>
    		<li><a href="student/set_request.jsp">您好<%=name %></a></li>
    		<li><a href="login.html">│退出</a></li>
    	<%
    		}
    		}else{
    	%>
    		<li><a href="login.html">[登录]</a></li>
    		<li><a href="register.html">[注册]</a></li>
    	 <%} %>	
    	</ul>
    </div>
	<!-- 导航栏 -->
    <div  class="center-content">
        <ul>
        	<li>
        	   <a href="TpageAction?pageNow=1">找老师</a>
        	</li>
        	<li>
        	  <a  href="education.jsp">首页</a>
        	</li>
        	<li>
        	  <a  href="introduct.html">平台介绍</a>
        	</li>
        	<li>
        	  <a  href="parents.html">家长指南</a>
        	</li>
        </ul>
    </div>

	<div class="middle  clearfix">	
		
		<%
	       TeacherBean tb=(TeacherBean)request.getAttribute("listinfo");
			if(tb!=null){
		%>
	
	   <div class="main">
	   <div class="mid">
	       <div class="mid1"><img src="<%=tb.getImages() %>" /><h5><img src="user/images/star.jpg"/></h5></div>
	       <div class="mid2">
	          <div class="info"><label><%=tb.getT_name() %></label><span>&nbsp;&nbsp;&nbsp;<%=tb.getSex() %></span><span><img src="user/images/local.jpg"/><%=tb.getGraduate_school() %></span> <span><%=tb.getSpecialty() %></span><span></span><p>年龄：<%=tb.getAge() %></p>
	          <!--<div id="btn" style="margin-top:-70px;margin-left:400px">
	          <a id="toTeacher" href="student/order.jsp?img=<%=tb.getImages() %>&name=<%=tb.getT_name() %>
									&money=<%=tb.getMoney() %>&subject=<%=tb.getSubject() %>
									&duce=<%=tb.getIntroduce() %>">预约老师</a>
	          </div>  -->
	          <div id="touch">
										<a id="toTeacher" href="student/order.jsp?img=<%=tb.getImages() %>&name=<%=tb.getT_name() %>
									&money=<%=tb.getMoney() %>&subject=<%=tb.getSubject() %>
									&duce=<%=tb.getIntroduce() %>">预约老师</a>
									</div>
	          </div>
	          <div class="data">
	              <div><h4>编号：</h4><h4><%=tb.getU_id() %></h4></div>
	              <div><h4>民族：</h4><h4><%=tb.getNationality() %></h4></div>
	              <div><h4>学历：</h4><h4><%=tb.getEducation() %></h4></div>
	              <div><h4>评价总数</h4><h4>276条</h4></div>
	              <div class="rig"><h4>好评率</h4><h4>100%</h4></div>
	          </div>
	       </div>
	       <div class="mid3">
	          <img src="user/images/renzheng.jpg"/>
	       </div>
	    </div>
	       <!-- 评价 -->
	       <div class="foott">
	          <div class="left">
	              <div class="nav">
	                 <a class="nav-item active" href="#teacher-info" id="teacher-info1">基本资料</a>
	                 <a class="nav-item" href="#teacher-past" id="teacher-past1">过往经历</a>
	                 <a class="nav-item" href="#teacher-success" id="teacher-success1">自我介绍</a>
	                 <a class="nav-item" href="#teacher-list" id="teacher-list1">座右铭</a>
	                 <a class="nav-item" href="#teacher-credit" id="teacher-credit1">约课记录</a>
	              </div>
	              <div name="teacher-info" id="teacher-info">
	                  <ul class="info1">
	                  <li>所在区域：<%=tb.getArea()%><%=tb.getAddress() %></li>
	                  <li>可授课时间：<%=tb.getTeach_time() %></li>
	                  <li>授课科目：<font style="font-size:13px"><%=tb.getSubject() %></font></li>
	                  <li>薪水要求：<%=tb.getMoney() %></li>
	                  </ul>
	              </div>
	              
	              <div name="teacher-past" id="teacher-past">
	                 <ul><%=tb.getExperience() %></ul>
	              </div>
	              <div name="teacher-success" id="teacher-success">
	                 <ul><%=tb.getIntroduce() %></ul>
	              </div>
	              <div name="teacher-list" id="teacher-list">
	                <ul><%=tb.getMotto() %></ul>
	              </div>
	              <div name="teacher-credit" id="teacher-credit">
	                <ul><%=tb.getMotto() %></ul>
	              </div>
	          </div>
	          
	          <div class="right1">
	              <div class="header1">授课区域</div>
	              <div class="content1"><img src="user/images/staticmap.jpg"></div>
	          </div>
	          <div class="right2">
	              <div class="header1">课表安排</div>
	              <div class="content2"></div>
	          </div>
	          <div class="right3">
	              <div class="header1">推荐家教</div>
	              <div class="content3">
	                 <label>小学数学家教</label>
	                 <label>小学英语家教</label>
	                 <label>初中数学家教</label>
	                 <label>初中英语家教</label>
	                 <label>初中物理家教</label>
	                 <label>初中化学家教</label>
	                 <label>高中数学家教</label>
	              </div>
	          </div>
	    </div>
	    <!-- foot -->
	  </div>
        <%
		}	
		%>
		
	</div>
	<!-- 底部 -->
	<div class="bottom" style="margin-top:1453px;">
      <ul class="bottom-left">
        <li>
          <ul>
            <li class="titles">关于乐学网</li>
            <li><a href="#">联系我们</a></li>
            <li><a href="#">加入我们</a></li>
            <li><a href="#">友情链接</a></li>
          </ul>
        </li>
        <li>
          <ul>
            <li class="titles">帮助中心</li>
            <li><a href="#">意见反馈</a></li>
            <li><a href="#">投诉中心</a></li>
            <li><a href="#">服务说明</a></li>
          </ul>
        </li>
        <li>
          <ul>
            <li class="titles">平台特色</li>
            <li><a href="#">安全可靠</a></li>
            <li><a href="#">四大保障</a></li>
            <li><a href="#">四大优势</a></li>
          </ul>
        </li>
        <li>
          <ul>
            <li class="titles">关注我们</li>
            <li><a href="#">官方微信</a></li>
            <li><a href="#">新浪微博</a></li>
            <li><a href="#">腾讯微博</a></li>
          </ul>
        </li>
      </ul>
      <ul class="bottom-right">
        <li class="phone"></li>
        <li class="code">4008-310-100</li>
        <li>周一至周日 9:00-23:00</li>
        <li>（仅收市话费）</li>
      </ul>
      <p>Copyright ©2014-2016 乐学网版权所有 - 闽ICP备14021129号-1 闽公网安备35020002830833号</p>
    </div>

	<!-- 回到顶部 -->
	<a href="javascript:;" id="btn" title="回到顶部"></a>

	<script   src="js/teach.js"  type="text/javascript"></script>
</body>
</html>