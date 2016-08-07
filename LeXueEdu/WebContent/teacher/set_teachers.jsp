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
      width:930px;
      height: 680px;
      background:#E8F4F5;
      left: 300px;
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
  <form  action="TeacherAction" name="form1" method="post">
    <table width="500px" style="border:2px solid #00beb7 ;border-radius:5px;" class="ui selectable celled table">
      <thead>
        <tr bgcolor="#00beb7" style="border-radius:5px;color:white">
        <td style="text-align:center" colspan=4><font size=5 style="font-family:黑体;"><%=session.getAttribute("u_id") %>号教员个人资料维护</font></td>
        </tr>
      </thead>
        <tbody>
        <tr>
        <td style="text-align:center" width="90px">姓名:</td>
        <td>
          <div class="ui input">
          <%if(session.getAttribute("name")==null){%>
        	  <input type="text" id="name" placeholder="请输入姓名"/>
          <% }else{ %>
            <input type="text" id="name" value="<%=session.getAttribute("name")%>"/>
            <%} %>
          </div>
        </td>
        <td width="100px">手机号:</td>
        <td><div class="ui input">
            <input type="text" id="tell" value="<%=session.getAttribute("tell")%>"/>
          </div></td>
        </tr>
        <tr>
          <td style="text-align:center">性别</td>
          <td>
            <div class="ui dropdown">
            <%if(session.getAttribute("sex")==null){%>
                <input type="hidden" id="sex" value="" id="sex"/>
                
                <div class="default text">性别</div>   <!-- 默认显示 -->
                 <i class="dropdown icon"></i>      <!-- 向下的箭头 -->
                    <div class="menu">
                          <div class="item" data-value="男">男</div>
                          <div class="item" data-value="女">女</div>
                        </div>
                        <% }else{ %> 
                <input type="hidden" id="sex" value="" id="sex"/>
                <div class="default text"><%=session.getAttribute("sex")%></div>   <!-- 默认显示 -->
                 <i class="dropdown icon"></i>      <!-- 向下的箭头 -->
                    <div class="menu">
                          <div class="item" data-value="男">男</div>
                          <div class="item" data-value="女">女</div>
                        </div>
                <%} %>
            </div>
          </td>
          <td>年龄:</td>
          <td>
            <div class="ui input">
             <%if(session.getAttribute("age")==null){%>
             <input type="text" id="age" placeholder="请输入年龄"/>
              <% }else{ %>
              <input type="text" id="age" value="<%=session.getAttribute("age")%>"/>
            <%} %>
            </div>
          </td> 
        </tr>
        <tr>
          <td style="text-align:center">身份证号:</td>
          <td>
            <div class="ui input">
             <%if(session.getAttribute("pid")==null){%>
              <input type="text" id="pid" placeholder="请输入身份证号"/>
               <% }else{ %>
              <input type="text" id="pid" value="<%=session.getAttribute("pid")%>"/>
            <%} %>
            </div>
          </td>
          <td>毕业学校:</td>
          <td>
            <div class="ui input">
             <%if(session.getAttribute("graduate_school")==null){%>
              <input type="text" id="graduate" placeholder="请输入学校"/>
                 <% }else{ %>
              <input type="text" id="graduate" value="<%=session.getAttribute("graduate_school")%>"/>
            <%} %>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align:center">专业</td>
          <td>
            <div class="ui input">
             <%if(session.getAttribute("specialty")==null){%>
            <input type="text" id="specialty" placeholder="请输入专业"/>
             <% }else{ %>
              <input type="text" id="specialty" value="<%=session.getAttribute("specialty")%>"/>
            <%} %>
            </div>
          </td>
          <td>学历:</td>
          <td>
            <div class="ui dropdown">
             <%if(session.getAttribute("education")==null){%>
                <input type="hidden" id="education" value=""/>
                <div class="default text">学历</div>   <!-- 默认显示 -->
                 <i class="dropdown icon"></i>      <!-- 向下的箭头 -->
                    <div class="menu">
                      <div class="item" data-value="大专">大专</div>
                      <div class="item" data-value="本科">本科</div>
                      <div class="item" data-value="硕士">硕士</div>
                      <div class="item" data-value="博士">博士</div>
                    </div>
                     <% }else{ %>
                     <input type="hidden" id="education" value=""/>
                     <div class="default text"><%=session.getAttribute("education")%></div>   <!-- 默认显示 -->
                     <i class="dropdown icon"></i>      <!-- 向下的箭头 -->
                    <div class="menu">
                      <div class="item" data-value="大专">大专</div>
                      <div class="item" data-value="本科">本科</div>
                      <div class="item" data-value="硕士">硕士</div>
                      <div class="item" data-value="博士">博士</div>
                    </div>
                      <%} %>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align:center">邮箱:</td>
          <td>
            <div class="ui input">
            <%if(session.getAttribute("email")==null){%>
              <input type="text" id="email" placeholder="请输入邮箱"/>
               <% }else{ %>
              <input type="text" id="email" value="<%=session.getAttribute("email")%>"/>
            <%} %>
            </div>
          </td>
          <td>民族</td>
          <td>
            <div class="ui dropdown">
              <%if(session.getAttribute("nation")==null){%>
              <input type="hidden" id="nation"/>
              <div class="default text">民族</div>
              <i class="dropdown icon"></i><!-- 向下的箭头 -->
              <div class="menu">
                <div class="item" data-value="汉族">汉族</div>
                <div class="item" data-value="满族">满族</div>
                <div class="item" data-value="蒙古族">蒙古族</div>
                <div class="item" data-value="回族">回族</div>
                <div class="item" data-value="白族">白族</div>
                <div class="item" data-value="藏族">藏族</div>
              </div>
               <% }else{ %>
               <input type="hidden" id="nation"/>
              <div class="default text"><%=session.getAttribute("nation")%></div>
              <i class="dropdown icon"></i><!-- 向下的箭头 -->
              <div class="menu">
                <div class="item" data-value="汉族">汉族</div>
                <div class="item" data-value="满族">满族</div>
                <div class="item" data-value="蒙古族">蒙古族</div>
                <div class="item" data-value="回族">回族</div>
                <div class="item" data-value="白族">白族</div>
                <div class="item" data-value="藏族">藏族</div>
              </div>
               <%} %>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align:center">自我介绍:</td>
          <td colspan=3>
            <div class="ui form">
              <div class="field">
                <%if(session.getAttribute("introduce")==null){%>
                <textarea id="introduce" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;"></textarea>
                 <% }else{ %>
 <textarea id="introduce" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;"><%=session.getAttribute("introduce")%></textarea>
                  <%} %>
              </div>
            </div>
          </td>
        </tr>
        <tr colspan=3>
          <td style="text-align:center">座右铭:</td>
          <td>
             <div class="ui form">
              <div class="field">
               <%if(session.getAttribute("motto")==null){%>
                <textarea id="motto" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;"></textarea>
                 <% }else{ %>
                 
 <textarea id="motto" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;"><%=session.getAttribute("motto")%></textarea>
                  
                  <%} %>
              </div>
            </div>
          </td>
        </tr>
        <tr colspan=3>
          <td style="text-align:center">家教经历</td>
          <td>
             <div class="ui form">
              <div class="field">
               <%if(session.getAttribute("experience")==null){%>
                <textarea id="experience" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;"></textarea>
                 <% }else{ %>
<textarea id="experience" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;"><%=session.getAttribute("experience")%></textarea>
                  <%} %>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align:center" colspan=4>
            <input type="button" value="确认更新" class="ui green button" onclick="update()"/>
            <input type="reset" value="取消重置" class="ui red button"/>
          </td>
        </tr>
        </tbody>
        
      </table>
      </form>
  </div>



<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/semantic.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $(".ui.dropdown").dropdown();
  });
  function update(){
	  var username=$("#name").val();
	  var pid=$("#pid").val();
	  var age=$("#age").val();
	  var sex=$("#sex").val();
	  var graduate_school=$("#graduate").val();
	  var specialty=$("#specialty").val();
	  var education=$("#education").val();
	  var email=$("#email").val();
	  var nation=$("#nation").val();
	  var experience=$("#experience").val();
	  var motto=$("#motto").val();
	  var introduce=$("#introduce").val();
	  var tell=$("#tell").val();
	  
	  
	  $.ajax({
	    	type:"post",
          	url:"TeacherAction",//需要用来处理ajax请求的action,LoginAction为处理的方法名，JsonAction为action名 
          	data:{//设置数据源
         	  username:username,
         	  pid:pid,
	      	  age:age,
	      	  sex:sex,
	      	  graduate_school:graduate_school,
	      	  specialty:specialty,
	      	  education:education,
	      	  email:email,
	      	  nation:nation,
	      	  experience:experience,
	      	  motto:motto,
	      	  introduce:introduce,
	      	  tell:tell
          },
         success:function(data){
         	alert("成功");
        }, 
         error:function(){ 
            alert("更新失败！");
          }//这里不要加"," 
	     });
}
  </script>
</body>
</html>