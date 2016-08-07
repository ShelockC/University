<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <meta charset="UTF-8">
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
    .teacher_right{
      position:absolute;
      width:940px;
      height: 680px;
      background:#E8F4F5;
      left: 300px;
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
} #nav{
  height:40PX;
  font-size: 24px;
  }
  #nav a{
  width:150px;
  
  }
    .teacher_right .right_thinks{
     width:700px;
      height:100px;
      line-height: 100px;
      text-align: center;
      font-size: 28px;
    }
    .right_count{
      font-size: 20px;
      padding-left: 36px;
    }
    .right_ul{
      width:700px;
      height:300px;
    }
    .setting-setp li{
      list-style:none;
      width:470px;
      height:130px;
      padding: 30px 100px;
    }
    .setting-setp li i{
      position: absolute;
      width:50px;
      height: 50px;
      background:#00BEB7;
      color:#fff;
      border-radius:50%;
      font-size: 24px;
      text-align: center;
      line-height: 50px;
      margin-left: -70px;
    }
    .setting-setp li .title{
      font-size: 16px;
      margin-bottom:15px;
    }
    .setting-setp li .title span{
      border:1px solid #00BEB7;
      padding:8px 10px;
    }
    .setting-setp li dd{
      float: left;
      margin: 0px 10px;
    }
    .t_line{/*竖线*/
    width:3px;
    height:410px;
    background:#BDBDBC;
    position:absolute;
    left:388px;
    top:377px;
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
    <div class="right_thinks">感谢您入驻好好学习家教平台,请完善您的基本资料</div>
    <div class="right_count"><p style="text-indent:2em;">您完善全部资料后我们将在24小时内进行审核，并与您联系，在通过审核之前，家长不能在网站上看到你，所以无法向你约课。</p>
    </div>
    <div class="right_ul">
      <div class="t_line"></div>
      <ul class="setting-setp">
        <li>
          <i>1</i>
          <div class="title"><span>个人资料</span></div>  
          <div class="list">
            <dd>个人信息</dd><dd>自我描述</dd><dd>教学经历</dd>
          </div>
        </li>
        <li>
          <i>2</i>
          <div class="title"><span>授课科目</span></div>
          <div class="list">
            <dd>科目添加</dd><dd>时间安排</dd><dd>地点安排</dd>
          </div>
        </li>
        <li>
          <i>3</i>
          <div class="title"><span>身份认证</span></div>
          <div class="list">
            <dd>头像认证</dd><dd>证件认证</dd><dd>学历认证</dd>
          </div>
        </li>
        <li>
          <i>4</i>
          <div class="title"><span>等待审核</span></div>
          <div class="list">
            <dd>请耐心等待，准备上线。</dd>
          </div>
        </li>
      </ul>
    </div>
  </div>



<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/semantic.min.js"></script>

</body>
</html>