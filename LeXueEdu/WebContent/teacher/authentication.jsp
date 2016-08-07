<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>教员认证</title>
	<link rel="stylesheet" type="text/css" href="css/semantic.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
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
      width:965px;
      height: 1200px;
      background:#E8F4F5;
      left: 300px;
    } .left{
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
  #nav{
  height:40PX;
  font-size: 24px;
  }
  #nav a{
  width:150px;
  
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
      border-top: 1px solid #e6e6e6;
      border-bottom: 1px solid #e6e6e6;
      padding-bottom: 10px;
      font-size: 28px;
    }
    .head{
      width:800px;
      height:300px;
      padding: 18px;
    }
    .head ul li{
      width:222px;
      height:277px;
      float:left;
      list-style: none;
      border-right: 1px dotted #e6e6e6;
    }
    .head ul{
      margin-left: 100px;
    }
    #sure{
      text-align: center;
      border-right: none;
      
    }
    #sure p{
      margin-top: -15px;
      font-size: 18px;
    }
    #file{
      width:100px;
    }
    #select p{
      margin-top: -58px;
    }
    .education{
      width:896px;
      height:66px;
      margin-top: 320px;
    }
    .education_title{
      border-top: 1px solid #e6e6e6;
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
        <div class="title">头像认证</div>
        <div class="head">
          <ul>
            <li id="select">
            <%if(session.getAttribute("path")!=null){%>
               <img src="<%=session.getAttribute("path") %>" width="200px" height="230px">
              <%} %>
              <p>
                <form action="AuthenticAction!head" method="post" enctype="multipart/form-data">
                    <input type="file" name="headimg" id="file" value="选择">
                    <input type="submit" value="上传" class="ui green button"/>
                </form>
              </p>
            </li>
            <li id="sure">
              <img src="images/5.jpg" width="200px" height="230px">
              <p>正确示例</p>
            </li>
          </ul>
        </div>
        <div class="subject">
          <div class="subject_title">证件认证</div>
            <div class="head">
            <ul>
              <li id="select">
                 <img src="images/3.jpg" width="200px" height="230px">
                <p>
                  <form action="AuthenticAction!pid" method="post" enctype="multipart/form-data">
                      <input type="file" name="pidimg" id="file" value="选择">
                      <input type="submit" value="上传" class="ui green button"/>
                  </form>
                </p>
              </li>
              <li id="sure">
                <img src="images/3.jpg" width="200px" height="230px">
                <p>正确示例</p>
              </li>
            </ul>
          </div>
        </div>

        <div class="education">
          <div class="education_title">学历认证</div>
           <div class="head">
            <ul>
              <li id="select">
                 <img src="images/2.jpg" width="200px" height="230px">
                <p>
                  <form action="AuthenticAction!education" method="post" enctype="multipart/form-data">
                      <input type="file" name="eduimg" id="file" value="选择">
                      <input type="submit" value="上传" class="ui green button"/>
                  </form>
                </p>
              </li>
              <li id="sure">
                <img src="images/2.jpg" width="200px" height="230px">
                <p>正确示例</p>
              </li>
            </ul>
          </div>
        </div>
  </div>
  </div>
</body>
</html>