<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    .teacher_right{
      position:absolute;
      width:940px;
      height: 400px;
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
    .sty{
      width:300px;
      height:40px;
    }
    span{
      
      font-size: 16px;
      margin-top: -18px;
      text-align: right;
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
       <form>
        <div class="title">密码修改</div>
        <div>
       
            <div class="ui input" style="margin-top:20px">
           
              <span>&nbsp;旧 密 码：</span><input type="password" class="sty" placeholder="请输入旧密码"/>
            </div>
        </div>
        <div>
            <div class="ui input">
              <span>&nbsp;新 密 码：</span><input type="password" class="sty" id="pw1" placeholder="请输入新密码"/>
            </div>
        </div>
        <div>
          <div class="ui input">
              <span>确认密码：</span><input type="password" class="sty" id="pw2" placeholder="确认密码"/>
          </div>
        </div>
       <input type="button" value="确认修改" class="ui green button" style="margin-left:100px" onclick="update()"/>
       <input type="reset" value="取消重置" class="ui red button"/>
       </form>
     </div>
  </div>



<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/semantic.min.js"></script>

<script type="text/javascript">
  $(document).ready(function(){
    $(".ui.dropdown").dropdown();
  });
  function update(){
	  var p1=$("#pw1").val();
	  var p2=$("#pw2").val();
	 
	  //alert(tell);
	  if(p1==p2){
	  $.ajax({
	    	type:"post",
          	url:"PasswordAction",
          	data:{//设置数据源
         	 password:p1
          },
         success:function(){
         	alert("修改成功");
        }, 
         error:function(){ 
            alert("修改失败！");
          }//这里不要加"," 
	     });
	  }
	  else alert("两次密码输入不一致请重新输入！")
}

</script>
</body>
</html>