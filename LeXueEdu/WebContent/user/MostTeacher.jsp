<%@ page language="java" import="java.util.*,com.edu.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>乐学网首页</title>
	<link rel="stylesheet" type="text/css" href="css/education.css">
	<link rel="stylesheet" href="css/normal.css">
	<link rel="stylesheet" href="css/teach.css">
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

		<div class="left">
			<!-- 左侧上方条件筛选 -->
			<div class="left_t">
				<ul>
					<li>
						<strong>课程类别：</strong>
						<a class="on" href="#">全部</a>
						<a href="#">小学</a>
						<a href="#">小升初</a>
						<a href="#">初中</a>
						<a href="#">中考</a>
						<a href="#">高中</a>
						<a href="#">高考</a>
					</li>
					<li>
						<strong>老师性别：</strong>
						<a class="on" href="#">全部</a>
						<a href="#">男</a>
						<a href="#">女</a>
					</li>
					<li>
						<strong>授课地区：</strong>
						<a class="on" href="#">全部</a>
						<a href="#">西岗区</a>
						<a href="#">中山区</a>
						<a href="#">沙河口区</a>
						<a href="#">甘井子区</a>
						<a href="#">旅顺口区</a>
						<a href="#">金州区</a>
						<a href="#">开发区</a>
						<a href="#">瓦房店市</a>
						<a href="#">普兰店市</a>
						<a href="#">庄河市</a>
						<a href="#">长海县</a>
						<a href="#">高新园区</a>
					</li>
					<li>
						<strong>上课时间：</strong>
						<a class="on" href="#">全部</a>
						<a href="#">周一</a>
						<a href="#">周二</a>
						<a href="#">周三</a>
						<a href="#">周四</a>
						<a href="#">周五</a>
						<a href="#">周六</a>
						<a href="#">周日</a>
					</li>
					<li>
						<strong>老师身份：</strong>
						<a class="on" href="#">全部</a>
						<a href="#">教师</a>
						<a href="#">大学生</a>
					</li>
					<li>
						<strong>授课方式：</strong>
						<a class="on" href="#">全部</a>
						<a href="#">老师上门</a>
						<a href="#">学生上门</a>
						<a href="#">协商地点</a>
					</li>
				</ul>
			</div>
			<!-- 左侧中间选择排序 -->
			<div class="left_m">
				<a class="one" href="#">默认排序</a>
				<a class="two" href="#">价格↑↓</a>
				<div class="three">
					<a href="#">课时费：全部</a>
					<div class="three_on">
						<a href="#">全部</a>
						<a href="#">¥100-200</a>
						<a href="#">¥200-300</a>
						<a href="#">¥300-400</a>
						<a href="#">¥400-500</a>
					</div>
				</div>
				<div class="three">
					<a href="#">教龄：全部</a>
					<div class="three_on">
						<a href="#">全部</a>
						<a href="#">1-3年</a>
						<a href="#">3-6年</a>
						<a href="#">6-8年</a>
						<a href="#">8-10年</a>
						<a href="#">10-30年</a>
						<a href="#">30年以上</a>
					</div>
				</div>
				<div class="four">
					<a class="on" href="#"><span class="check"></span><span>评价最高</span></a>
					<a class="on" href="#"><span class="check"></span><span>课时数最多</span></a>
					<a class="on" href="#"><span class="check"></span><span>订单最多</span></a>
				</div>
			</div>	
			<!-- 左侧下方老师信息 -->
			<div class="left_b">
				<ul>
				<%
				ArrayList list=(ArrayList)request.getAttribute("list");
				for(int i=0;i<list.size();i++){
					//从al中取出UserBean
					TeacherBean tb=(TeacherBean)list.get(i);
					
				%>
					<li>
						<table>
							<tr>
								<td class="head">
									<img class="img" src="<%=tb.getImages() %>" alt="">
									<div id="touch">
										<a id="toTeacher" href="student/order.jsp?img=<%=tb.getImages() %>&name=<%=tb.getT_name() %>
									&money=<%=tb.getMoney() %>&subject=<%=tb.getSubject() %>
									&duce=<%=tb.getIntroduce() %>">预约老师</a>
									</div>
								</td>
								<td class="infermation">
									<a id="name" href="TeacherAction!TeacherInfo?tell=<%=tb.getTell() %>"><%=tb.getT_name() %></a>
									<img src="images/good.png" alt="">
									<div>
										<span class="str1">性别：</span>
										<span class="str2"><%=tb.getSex() %></span><br>
										<span class="str1">教授科目：</span>
										<span class="str2"><%=tb.getSubject() %></span>	<br>
										<span class="str1">辅导区域：</span>
										<span class="str2"><%=tb.getArea() %></span><br>
										<span class="str1">个人简介：</span>
										<span class="str2"><%=tb.getIntroduce().substring(0, 50) %><a href="TeacherAction!TeacherInfo?tell=<%=tb.getTell() %>">[更多]</a></span>
									</div>
								</td>
								<td>
									<strong>¥ </strong>
									<span class="price"><%=tb.getMoney() %></span>
									<strong> /小时</strong>
									<p><span class="id"></span>身份认证<span class="edu"></span>学历认证</p>
								</td>
							</tr>
						</table>
					</li>
					<%} %>
				</ul>			
			</div>
			<!-- 分页 -->
			<div class="left_page">
				<% //从request中得到pageNow
			    String now=request.getAttribute("pageNow").toString().trim();
		
				int pageNow=Integer.valueOf(now);
				if(pageNow!=1){
					out.println("<a href=TpageAction?pageNow="+(pageNow-1)+" class='item'>上一页</a>");
				}else{
					out.println("<a href=javascript:void(0); class='item'>上一页</a>");
				}
				//得到pageCount
				String s_pageCount=request.getAttribute("pageCount").toString().trim();
				int pageCount=Integer.parseInt(s_pageCount);
				if(pageNow!=pageCount){
					out.println("<a href=TpageAction?pageNow="+(pageNow+1)+" class='item'>下一页</a>");
				}else{
					out.println("<a href=javascript:void(0); class='item'>下一页</a>");
				}
			%>
			</div>
		</div>		

		<div class="right">
			<!-- 右侧最新入驻 -->
			<div class="right_one">
				<h2>最新入驻</h2>
				<ul>
					<li class="clearfix">
						<div>
							<img class="img" src="images/3.png" alt="">
						</div>
						<a href="#">小明 </a>
						<span>年龄：27</span><br>
						<span>☆ 座右铭：没有学生学不会，只有方法对不对。</span>
					</li>
					<li class="clearfix">
						<div>
							<img class="img" src="images/3.png" alt="">
						</div>
						<a href="#">小明 </a>
						<span>年龄：27</span><br>
						<span>☆ 座右铭：没有学生学不会，只有方法对不对。</span>
					</li>
					<li class="clearfix">
						<div>
							<img class="img" src="images/3.png" alt="">
						</div>
						<a href="#">小明 </a>
						<span>年龄：27</span><br>
						<span>☆ 座右铭：没有学生学不会，只有方法对不对。</span>
					</li>
					<li class="clearfix">
						<div>
							<img class="img" src="images/3.png" alt="">
						</div>
						<a href="#">小明 </a>
						<span>年龄：27</span><br>
						<span>☆ 座右铭：没有学生学不会，只有方法对不对。</span>
					</li>
				</ul>
			</div>
			<!-- 右侧常见问题 -->
			<div class="right_two">
				<h2>常见问题</h2>
				<ul>
					<li><a href="#">◇ 高二升高三应该注意哪些问题</a></li>
					<li><a href="#">◇ 怎样在短时间内快速记忆英语单词</a></li>
					<li><a href="#">◇ 学生应如何提高学习效率</a></li>
					<li><a href="#">◇ 如何提高对数学学习的兴趣</a></li>
					<li><a href="#">◇ 考前怎样缓解紧张的心情</a></li>
					<li><a href="#">◇ 怎样提高中考成绩</a></li>
				</ul>
			</div>
		</div>

	</div>
	<!-- 底部 -->
	<div class="bottom">
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