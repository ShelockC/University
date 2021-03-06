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
</head>
<%if(request.getAttribute("list")!=null){ %>
  <body>
  <%}else{ %>
   <body onload="javascript:location.href='IndexAction'">
  <%} %>
    <!-- 顶部开始 -->
    <div class="header">
        <ul>
        	<li>
        	   <img src="images/1.png">
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
    		<li><a href="#">[登录]</a></li>
    		<li><a href="#">[注册]</a></li>
    	 <%} %>	
    		
    	</ul>
    </div><!-- 顶部结束 -->

    <!-- 中间内容开始 -->
    <div  class="center-content">
        <ul>
        	<li>
        	   <a href="TpageAction?pageNow=1">找老师</a>
        	</li>
        	<li class="page">
        	  <a  href="education.jsp">首页</a>
        	</li>
        	<li>
        	  <a  href="introduct.html">平台介绍</a>
        	</li>
        	<li>
        	  <a  href="parents.html">家长指南</a>
        	</li>
        </ul>
        <!-- 轮播图开始 -->
    	<div id="photo">    	   
    	    <div id="photo-three">
    	    	<img src="images/104.jpg">
    	    </div>

    	    <div id="photo-two">
    	    	<img src="images/102.jpg">
    	    </div>
    	    <div id="photo-one">
    	    	<img src="images/103.jpg">
    	    </div>
    	    <ul>
    	    	<li id="one"></li>
    	    	<li id="two"></li>
    	    	<li id="three"></li>
    	    </ul>
    	</div> <!-- 轮播图结束-->

    	<!-- 科目分类开始 -->
    	<!-- 导航开始 -->
        <div class="object-list">
        	<ul>
        		<li class="small">
        		     <i id="small_hover"></i>
        			 <a href="#" class="stage first-a">小学</a>
        			 <a href="#" class="stage">小升初</a></br>
        			 <a href="#" class="object">语文</a>
        			 <a href="#">数学</a>
        			 <a href="#">英语</a>
        			 <a href="#">数奥</a>
        		</li>
        		<li class="middle">
        		       <i></i>
        			   <a href="#" class="stage first-a">初中</a>
        			   <a href="#" class="stage">中考</a></br>
        			   <a href="#" class="object">数学</a>
        			   <a href="#">英语</a>
        			   <a href="#">物理</a>
        			   <a href="#">化学</a>
        		</li>
        		<li class="high">
        		        <i></i>
        		    	<a href="#" class="stage first-a">高中</a>
        		    	<a href="#" class="stage">高考</a></br>
        		    	<a href="#" class="object">语文</a>
        		    	<a href="#">数学</a>
        		    	<a href="#">英语</a>
        		    	<a href="#">地理</a>
        		</li>
        	</ul>
        </div><!-- 导航结束 -->
        <!-- 内容开始 -->
        <div class="object-content">
           <!-- 小学开始 -->
           <ul   class="small-object">
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">一年级</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">作文</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">二年级</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">作文</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">三年级</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">作文</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">四年级</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">作文</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">五年级</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">作文</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">六年级</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">作文</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">小升初</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">作文</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           </ul><!-- 小学结束 -->
           <!-- 初中开始 -->
           <ul   class="middle-object">
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">初一</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">政治</a></li>
           	 		<li><a href="#">物理</a></li>
           	 		<li><a href="#">化学</a></li>
           	 		<li><a href="#">地理</a></li>
           	 		<li class="middle-li-one"><a href="#">历史</a></li>
           	 		<li class="middle-li-two"><a href="#">生物</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">初二</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">政治</a></li>
           	 		<li><a href="#">物理</a></li>
           	 		<li><a href="#">化学</a></li>
           	 		<li><a href="#">地理</a></li>
           	 		<li class="middle-li-one"><a href="#">历史</a></li>
           	 		<li class="middle-li-two"><a href="#">生物</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">初三</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">政治</a></li>
           	 		<li><a href="#">物理</a></li>
           	 		<li><a href="#">化学</a></li>
           	 		<li><a href="#">地理</a></li>
           	 		<li class="middle-li-one"><a href="#">历史</a></li>
           	 		<li class="middle-li-two"><a href="#">生物</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">中考</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">政治</a></li>
           	 		<li><a href="#">物理</a></li>
           	 		<li><a href="#">化学</a></li>
           	 		<li><a href="#">地理</a></li>
           	 		<li class="middle-li-one"><a href="#">历史</a></li>
           	 		<li class="middle-li-two"><a href="#">生物</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           </ul><!-- 初中结束 -->
           <!-- 高中开始 -->
            <ul   class="high-object">
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">高一</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">政治</a></li>
           	 		<li><a href="#">物理</a></li>
           	 		<li><a href="#">化学</a></li>
           	 		<li><a href="#">地理</a></li>
           	 		<li class="high-li-one"><a href="#">历史</a></li>
           	 		<li class="high-li-two"><a href="#">生物</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">高二</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">政治</a></li>
           	 		<li><a href="#">物理</a></li>
           	 		<li><a href="#">化学</a></li>
           	 		<li><a href="#">地理</a></li>
           	 		<li class="high-li-one"><a href="#">历史</a></li>
           	 		<li class="high-li-two"><a href="#">生物</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">高三</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">政治</a></li>
           	 		<li><a href="#">物理</a></li>
           	 		<li><a href="#">化学</a></li>
           	 		<li><a href="#">地理</a></li>
           	 		<li class="high-li-one"><a href="#">历史</a></li>
           	 		<li class="high-li-two"><a href="#">生物</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           	 <li>
           	 	<ul class="object-one">
           	 		<li><a href="#">高考</a></li>
           	 		<li><a href="#">语文</a></li>
           	 		<li><a href="#">数学</a></li>
           	 		<li><a href="#">英语</a></li>
           	 		<li><a href="#">政治</a></li>
           	 		<li><a href="#">物理</a></li>
           	 		<li><a href="#">化学</a></li>
           	 		<li><a href="#">地理</a></li>
           	 		<li class="high-li-one"><a href="#">历史</a></li>
           	 		<li class="high-li-two"><a href="#">生物</a></li>
           	 		<li><a href="#">奥数</a></li>
           	 		<li><a href="#">陪读</a></li>
           	 	</ul>
           	 </li>
           </ul><!-- 高中结束 -->
        	
        </div><!-- 科目分类结束 -->

        <!-- 介绍每个端开始 -->
        <div class="introduce">
        	<ul>
        		<li>
        		   <a href="#">
        		   	  <span>找到好老师</span></br>
        		   	  <span>当然乐学网</span></br>
        		   	  <span class="know">了解家长端</span>
        		   	  <img src="images/12.jpg">
        		   </a>
        		</li>
        		<li>
        		   <a href="#">
        		   	  <span>让老师成为</span></br>
        		   	  <span>自由职业者</span></br>
        		   	  <span class="know">了解老师端</span>
        		   	  <img src="images/13.jpg">
        		   </a>
        		</li>
        		<li>
        		   <a href="#">
        		   	  <span>用O2O重构</span></br>
        		   	  <span>课外辅导价格链</span></br>
        		   	  <span class="know">了解平台端</span>
        		   	  <img src="images/14.jpg">
        		   </a>
        		</li>
        		<li>
        		   <a href="#">
        		   	  <span>基于移动互联网</span></br>
        		   	  <span>随时随地对接需求</span></br>
        		   	  <span class="know">了解手机客户端</span>
        		   	  <img src="images/15.png">
        		   </a>
        		</li>
        	</ul>
        </div><!-- 介绍每个端结束 -->

        <!-- 平台流程开始 -->
        <div class="platform">
            <h3>平台流程</h3>
           <!--  <p class="line"></p> -->
            <ul class="icon">
            	<li class="one"></li>
            	<li class="two"></li>
            	<li class="three"></li>
            	<li class="four"></li>
            </ul>
            <ul class="process">
            	<li>
            		<p>1、搜索老师</p>
            		<p>通过网页或客户端登入平台查找所需老师，查看详细资料，选择心仪老师。</p>
            	</li>
            	<li>
            		<p>2、双方沟通</p>
            		<p>在老师主页与老师在线进行沟通交流，达成共识即可进行约课。</p>
            	</li>
            	<li>
            		<p>3、下单约课</p>
            		<p>双方沟通完成后，填写约课订单并完成支付，课酬将由平台担保。</p>
            	</li>
            	<li>
            		<p>4、约定上课</p>
            		<p>在约定时间和地点，老师对学生进行授课 ，授课完成后，双方相互评价</p>
            	</li>
            </ul>
        	
        </div><!-- 平台流程结束 -->

        <!-- 老师列表开始 -->
        <div class="teacher">
        	<h3>老师列表</h3>
       		<table>
             <%
				ArrayList list=(ArrayList)request.getAttribute("list");
             if(list!=null){
             %>
             <tr>
             <%
				for(int i=0;i<2;i++){
					//从al中取出UserBean
					TeacherBean tb=(TeacherBean)list.get(i);
				%>
                 <td class="head">
                  <img class="img" src="<%=tb.getImages() %>" alt="">
                </td>
                <td class="infermation">
                  <a id="name" href="TeacherAction!TeacherInfo?tell=<%=tb.getTell() %>"><%=tb.getT_name().substring(0,1) %>老师</a>
                  <img src="images/good.png" alt="">
                  <div class="infer">
                    <span class="str1">性别：</span>
                    <span class="str2"><%=tb.getSex() %></span><br>
                    <span class="str1">教授科目：</span>
                    <span class="str2"><%=tb.getSubject() %></span>  <br>
                    <span class="str1">辅导区域：</span>
                    <span class="str2"><%=tb.getArea() %></span><br>
                    <span class="str1">个人简介：</span>
                    <span class="str2"><%=tb.getIntroduce().substring(0,60) %><a href="TeacherAction!TeacherInfo?tell=<%=tb.getTell() %>">[更多]</a></a></span>
                  </div>
                </td>
                <%} %>
               </tr>
               <tr>
               	<%
				for(int i=2;i<4;i++){
					//从al中取出UserBean
					TeacherBean tb=(TeacherBean)list.get(i);
				%>
                 <td class="head">
                  <img class="img" src="<%=tb.getImages() %>" alt="">
                </td>
                <td class="infermation">
                  <a id="name" href="teacher1.html"><%=tb.getT_name().substring(0,1) %>老师</a>
                  <img src="images/good.png" alt="">
                  <div class="infer">
                    <span class="str1">性别：</span>
                    <span class="str2"><%=tb.getSex() %></span><br>
                    <span class="str1">教授科目：</span>
                    <span class="str2"><%=tb.getSubject() %></span>  <br>
                    <span class="str1">辅导区域：</span>
                    <span class="str2"><%=tb.getArea() %></span><br>
                    <span class="str1">个人简介：</span>
                    <span class="str2"><%=tb.getIntroduce().substring(0, 50) %><a href="#">[更多]</a></span>
                  </div>
                </td>
                <%} %>
               </tr>
				<%} %>
				</table>
             	<div style="width:100%;height:52px;text-align:center;line-height:52px;font-size:20px;color:blue;"><a href="TpageAction?pageNow=1">查看更多认证家教</a>
             </div>
             
        </div> <!-- 老师列表结束 -->




        <!-- 成功案例开始 -->
        <div class="success-case">
            <h3>成功案例</h3>
        	<ul>
        		<li>
        		    <i class="photo-one"></i>
        			<span>
        			   在请他教找老师真的很靠谱，比以前在机构找老师相比省去一大笔费用，请他教是真心的好！
					</span>
					<span class="person">家长林女士</span>
        		</li>
        		<li>
        			<i class="photo-two"></i>
        			<span>
        			   <!-- <i class="symbol">“</i> -->
        			   经过朋友推荐来了请他教，这里有大量的优秀老师可以选择，很快我就找到了满意的老师，体验非常棒！
        			   <!-- <i class="symbol">”</i> -->
					</span>
					<span class="person">家长李先生</span>
        		</li>
        		<li>
        			<i class="photo-three"></i>
        			<span>
        			   <!-- <i class="symbol">“</i> -->
        			   在乐学网找老师真的很靠谱，比以前在机构找老师相比省去一大笔费用，请他教是真心的好！
        			   <!-- <i class="symbol">”</i> -->
					</span>
					<span class="person">顾老师</span>
        		</li>
        		<li>
        			<i class="photo-four"></i>
        			<span>
        			   <!-- <i class="symbol">“</i> -->
        			 在乐学网找老师真的很靠谱，比以前在机构找老师相比省去一大笔费用，请他教是真心的好！
        			   <!-- <i class="symbol">”</i> -->
					</span>
					<span class="person">张老师</span>
        		</li>
        	</ul>
        </div><!-- 案例结束 -->

        <!-- 四大保障开始 -->
        <div class="security">
            <h3>四大保障</h3>
        	<ul class="icon-security">
        		<li class="one"></li>
        		<li class="two"></li>
        		<li class="three"></li>
        		<li class="four"></li>
        	</ul>
        	<ul class="word">
        		<li>
        			<p>真实</p>
        			<p>8重教师认证，防范虚假包装，</br>帮助家长找到好老师</p>
        		</li>
        		<li>
        			<p>安全</p>
        			<p>平台托管学费，上课后家长确认</br>付款，保证资金安全。</p>
        		</li>
        		<li>
        			<p>保密</p>
        			<p>采用阿里云平台，全球领先的云</br>平台保障老师与家长的隐私。</p>
        		</li>
        		<li>
        			<p>专业</p>
        			<p>国内优秀移动互联技术团队精心</br>打造，快速响应平台更新。</p>
        		</li>
        	</ul>
        </div><!-- 四大保障结束 -->

        <!-- 四大优势开始 -->
      <div class="advantage">
            <h3>四大优势</h3>
        	<ul class="icon">
        		<li class="one"></li>
        		<li class="two"></li>
        		<li class="three"></li>
        		<li class="four"></li>
        	</ul>
        	<ul class="word">
        		<li>
        			<p>家长更省 老师更赚</p>
        			<p>省去中介环节，老师与家长直接</br>对接，永久免一切中介费用。</p>
        		</li>
        		<li>
        			<p>双向评价 累积信用</p>
        			<p>授课后，家长可对老师教学进行</br>评价，老师也可评价学生。</p>
        		</li>
        		<li>
        			<p>手机应用 随时随地</p>
        			<p>手机客户端登录，完成所有操</br>作，家长与老师随时随地对接。</p>
        		</li>
        		<li>
        			<p>附近名师 一搜即得</p>
        			<p>利用LBS技术，可通过地图查找</br>附近老师，教学更方便。</p>
        		</li>
        	</ul>
        </div><!-- 四大优势结束 -->

    </div><!-- 中间内容结束-->

  <!-- 底部开始 -->
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
    </div><!-- 底部结束 -->


    <!-- 回到顶部 -->
    <a href="javascript:;" id="btn" title="回到顶部"></a>

    <!-- 客服 -->
    <div class="service" id="service">
    	<ul class="service_ul">
    		<li class="photo_one" id="photo_one">
    			<a href="#">
    				<img src="images/31.png">
    				<span>在线服务</span>
    			</a>
    		</li>
    		<li class="photo_two">
    			<a href="#">
    				<img src="images/30.png">
    				<span>老师咨询</span>
    			</a>
    		</li>
    		<li class="photo_three">
    			<a href="#">
    				<img src="images/33.png">
    				<span>家长咨询1</span>
    			</a>
    		</li>
    		<li class="photo_four">
    			<a href="#">
    				<img src="images/30.png">
    				<span>家长咨询2</span>
    			</a>
    		</li>
    		<li class="photo_five">
    			<a href="#">
    				<img src="images/32.png">
    				<span>合作咨询</span>
    			</a>
    		</li>
    	</ul>
    </div>


    <script   src="js/jquery-1.9.0.js"     type="text/javascript"></script>
    <script   src="js/jquery-1.8.2.js"    type="text/javascript"></script>
    <script   src="js/education.js"  type="text/javascript"></script>
    
</body>
</html>