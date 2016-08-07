<%@ page language="java" import="java.util.*,com.edu.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
 <base href="<%=basePath%>">
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <link rel="stylesheet" type="text/css" href="css/semantic.min.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <title>教员信息</title>
  <style type="text/css">
  	*{margin:0px;padding:0px;}
  	body{background-color: #fff;font-family: "微软雅黑";}
  	.teacher_top{
  		width:100%;
        height:140px;
        position: relative;
  	}
  	.teacher_top img{
  width:150px;
  height:140px;
  margin-left: 150px;
}
#logo_1{
  position: absolute;
}
#logo_1 h1{
  position: absolute;
  height:140px;
  line-height: 140px;
  left:350px;
  width:200px;
  top:0px;
  font-family: "微软雅黑";
  color:#00BEB7;
}
.logo_2{
  position: absolute;
  font-size:16px;
  font-weight:bold;
  right:60px;
  height:40px;
  width:15%;
  line-height:40px;
  cursor: pointer;
  background:#00BEB7;
  padding:0px 20px;
 
}
.logo_2 span{
  color:white;
  margin-right: 9px;
}
 #nav{
  height:40PX;
  font-size: 24px;
  }
  #nav a{
  width:150px;
  
  }
 .left{
  background:#F5F5F5;
  position:absolute;
  width:200px;
  height:1000px;
  color:white;
  font-size: 24px;
  font-family: "微软雅黑";
  left:60px;
}
.left li{
  list-style: none;
  line-height:70px;
  text-decoration:none;
  height:70px;
  color:#6A6C6F;
  font-weight: bold;
  cursor: pointer;
  text-align: center;
  width:200px;
  border-bottom: 1px solid #E6E6E6;
  border-left:5px solid #E6E6E6;
}
.left li a{
  height:70px;
  color:#595959;
}
.left li:hover{
  /*background:silver;*/
  border-left: 5px solid #00BEB7;
}


    .teacher_right{
      position:absolute;
      width:940px;
      height: 1000px;
      background:#E8F4F5;
      left: 300px;
    }
    .address{
      width:896px;
      height:66px;
      margin-left: 46px;
      line-height: 76px;
    }
    .title{
      border-bottom: 1px solid #e6e6e6;
      padding-bottom: 10px;
      font-size: 28px;
    }
    .liveaddress{
      border-top: 1px solid #e6e6e6;
      font-size: 18px;
    }
    #ress{
      margin-left: 10px;
    }
    .subject{
      border-top: 1px solid #e6e6e6;
      width:896px;
      height:66px;
      line-height: 76px;
    }
    .subject .subject_title{
      border-bottom: 1px solid #e6e6e6;
      padding-bottom: 10px;
      font-size: 28px;
    }
    
  </style>
</head>
<body>
	<div class="teacher_top"> 
	<div id="logo_1"><img src="images/logo.png"><h1>用户中心</h1>
        </div>
        <div class="logo_2">
            <span class="glyphicon glyphicon-user">欢迎你</span>
            <span class="glyphicon glyphicon-off">注销</span>
        </div>
	</div>
	<div class="ui teal four item inverted menu" id="nav">
	  <a href="education.jsp" class="item">首页</a>
	  <a href="teacher/set_teachers.jsp" class="item">教员设置</a>
	  <a href="teacher/setmobile.jsp" class="item">账号设置</a>
	  <a class="item">我的主页</a>
	</div>
  	<div class="left">
    <ul id="mytab" class="nav nav-tabs" role="tablist">
    <li class="active">
       <a class="glyphicon glyphicon-cog" href="teacher/set_teacher.jsp">个人中心</a></li>
    <li>    
       <a class="glyphicon glyphicon-th-list" href="teacher/set_teachers.jsp">个人资料</a></li>
    <li>  
       <a class="glyphicon glyphicon-book" href="TaddressAction!selectAddress">授课信息 </a></li>
    <li> 
       <a class="glyphicon glyphicon-envelope" href="AuthenticAction!displayimg">验证信息</a></li>
       <li> 
       <a class="glyphicon glyphicon-time" href="teacher/set_timeMoney.jsp">时间安排</a></li>
       <li> 
       <a class="glyphicon glyphicon-usd" href="AuthenticAction!displayimg" >我的订单</a></li>
       <li> 
       <a class="glyphicon glyphicon-list-alt" href="AuthenticAction!displayimg">我的评价</a></li>
       <li> 
       <a class="glyphicon glyphicon-pencil" href="teacher/setmobile.jsp">密码修改</a></li>
    </ul>
    </div>

  
  <div class="teacher_right">
     <div class="address">
        <div class="title">授课区域</div>
        <%
        if(request.getAttribute("area")!=null&&request.getAttribute("address")!=null){
	        String area=request.getAttribute("area").toString(); 
	        String address=request.getAttribute("address").toString();
	    %>
	    <div class="title" style="font-size:18px;">现授课区域为：<%=area %>&nbsp;&nbsp;|&nbsp;&nbsp;居住地址是:<%=address %></div>
	     <%}%>
	     
	     
      <form action="TaddressAction!UpdateAddress">
        <div>授课城市：<span>大连</span>&nbsp;&nbsp;&nbsp;&nbsp;
        	授课区域：
        	<span>
        		<div class="ui dropdown" id="ress">
                <input type="hidden" id="area" value="" name="area"/>
                <div class="default text">区域</div>   <!-- 默认显示 -->
                 <i class="dropdown icon"></i>      <!-- 向下的箭头 -->
                    <div class="menu">
                      	<div class="item" data-value="普兰店市">普兰店市</div>
		                <div class="item" data-value="瓦房店市">瓦房店市</div>
		                <div class="item" data-value="庄河市">庄河市</div>
		                <div class="item" data-value="长海县">长海县</div>
		                <div class="item" data-value="沙河口区">沙河口区</div>
		                <div class="item" data-value="西岗区">西岗区</div>
		                <div class="item" data-value="中山区">中山区</div>
		                <div class="item" data-value="甘井子区">甘井子区</div>
		                <div class="item" data-value="高新园区">高新园区</div>
		                <div class="item" data-value="大连开发区">大连开发区</div>
		                <div class="item" data-value="金州区">金州区</div>
		                <div class="item" data-value="旅顺口区">旅顺口区</div>
                    </div>
            </div>
        	</span>
        </div>
        <div class="liveaddress">
          <span>现居住地址:</span>
            <div class="ui input">
            <input type="text" id="address" placeholder="请输入具体地址" name="address"/>
            </div>
            <input type="submit" value="确认更新" class="ui green button" id="sub" />
        </div>
	</form>






        <div class="subject">
        
          <div class="subject_title">授课科目</div>
          
 <form action="TaddressAction!Addlesson">
          <div class="ui dropdown" id="ress">
                <input type="hidden" id="grage" value="" name="grade"/>
                <div class="default text">年级</div>   <!-- 默认显示 -->
                 <i class="dropdown icon"></i>      <!-- 向下的箭头 -->
                    <div class="menu">
                      <div class="item" data-value="一年级">一年级</div>
                      <div class="item" data-value="二年级">二年级</div>
                      <div class="item" data-value="三年级">三年级</div>
                      <div class="item" data-value="四年级">四年级</div>
                      <div class="item" data-value="五年级">五年级</div>
                      <div class="item" data-value="五年级">五年级</div>
                      <div class="item" data-value="初一">初一</div>
                      <div class="item" data-value="初二">初二</div>
                      <div class="item" data-value="初三">初三</div>
                      <div class="item" data-value="高一">高一</div>
                      <div class="item" data-value="高二">高二</div>
                      <div class="item" data-value="高三">高三</div>
                    </div>
            </div>
            <div class="ui dropdown" id="ress" style="margin-left:62px;">
                <input type="hidden" id="ject" value="" name="subject"/>
                <div class="default text" style="margin-left:50px">科目</div>   <!-- 默认显示 -->
                 <i class="dropdown icon"></i>      <!-- 向下的箭头 -->
                    <div class="menu">
                      	<div class="item" data-value="语文">语文</div>
						<div class="item" data-value="数学">数学</div>
						<div class="item" data-value="英语">英语</div>
						<div class="item" data-value="物理">物理</div>
						<div class="item" data-value="化学">化学</div>
						<div class="item" data-value="生物">生物</div>
						<div class="item" data-value="政治">政治</div>
						<div class="item" data-value="历史">历史</div>
						<div class="item" data-value="地理">地理</div>
						<div class="item" data-value="奥数">奥数</div>
						<div class="item" data-value="科学">科学</div>
						<div class="item" data-value="陪读">陪读</div>
						<div class="item" data-value="信息技术">信息技术</div>
                    </div>
            </div>
            <input type="submit" value="添加" class="ui green button" style="margin-left:140px;"/>
         </form>     
             
             
             <div>
                <table style="border:1px solid #00beb7;width:600px;" class="ui selectable celled table">
                  <tr align="center"  bgcolor="#00beb7" style="color:white">
                    <td width="150px">编号</td><td width="150px">年级</td><td width="150px">科目</td><td width="150px">删除</td>
                  </tr>
                 <% 
                 String []color={"white","white","white"};
               if(request.getAttribute("lesson")!=null){
                ArrayList lesson=(ArrayList)request.getAttribute("lesson");
                
         			for(int i=0;i<lesson.size();i++){
         			//从al中取出UserBean
         			LessionBean lb=(LessionBean)lesson.get(i);
                 %>
                  <tr align="center" bgcolor="<%=color[i%3]%>" class="animated zoomIn">
                  	<td ><%=lb.getId() %></td>
                    <td><%=lb.getGrade() %></td>
                    <td><%=lb.getSubject() %></td>
                    <td><a onclick="return dell(<%=lb.getId() %>);" href=TaddressAction!Dellesson?id=<%=lb.getId() %>><img alt="删除" src="images/del.gif">删除</a></td>
                  </tr>
                  <%} }%> 
                </table>
             </div>
        </div>
     </div>
  </div>

<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/semantic.min.js"></script>

<script type="text/javascript">
function dell(s){
	return window.confirm("你真的要删除"+s+"吗？");
}
  $(document).ready(function(){
    	$(".ui.dropdown").dropdown();
    	
  });
</script>
</body>
</html>