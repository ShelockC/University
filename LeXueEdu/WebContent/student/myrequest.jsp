<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <link rel="stylesheet" type="text/css" href="../css/semantic.min.css">
  <title>学员信息</title>
  <style type="text/css">
  	*{margin:0px;padding:0px;}
  	body{background-color: #fff;font-family: "微软雅黑";}
  	.teacher_top{
  		width:95%;
  		height:100px;
  		margin:0 auto;
  		text-align: center;
  		line-height: 100px;
  		font-size:34px;
  		color:teal;
  	}
    .left{
      float:left;
      width:190px;
      height:450px;
      margin-left: 100px;
      background:#06B1D8;
    }
    #leftbtn{
      margin-left:20px;
      margin-top:30px;
    }
    #teacherbtn button{
      width:150px;
      height:52px;
    }
    .student_right{
      float:left;
      width:1002px;
      height: 680px;
      background:#E8F4F5;
      margin-left: 45px;
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
	<div class="teacher_top">学员用户中心</div>
	<div class="ui teal four item inverted menu">
	  <a class="active item"></a>
	  <a class="item">学员设置</a>
	  <a class="item">账号设置</a>
	  <a class="item">我的主页</a>
	</div>
  <div class="left">
    <div id="leftbtn">
      <div id="teacherbtn" class="ui vertical basic buttons">
        <button class="ui button">个人中心</button>
        <button class="ui button">个人资料</button>
        <button class="ui button">我的订单</button>
        <button class="ui button">我的课程</button>
        <a href="MyRequestAction"><button class="ui button">我的需求</button></a>
        <button class="ui button">发布需求</button>
      </div>
    </div>
    <div class="ui divider"></div>
  </div>

  
  <div class="student_right">
   
  <form  action="RequestAction" name="form1" method="post">
    <table width="500px" style="border:2px solid #8080ff ;border-radius:5px;" class="ui selectable celled table">
      <thead>
        <tr bgcolor="#009ad6" style="border-radius:5px;">
        <td style="text-align:center" colspan=4><font size=5 style="font-family:黑体;">我的需求</font></td>
        </tr>
      </thead>
        <tbody>
        <tr>
        <td style="text-align:center" width="90px">姓名:</td>
        <td>
          <div class="ui input">
          <%if(request.getAttribute("s_name")==null){%>
        	  <input type="text" id="s_name" placeholder="还没有录入"/ disabled>
          <% }else{ %>
            <input type="text" id="s_name" value="<%=request.getAttribute("s_name")%>" disabled/>
            <%} %>
          </div>
        </td>
      
        <td style="text-align:center" width="90px">手机号:</td>
        <td><div class="ui input">
            <input type="text" id="tell" value="<%=session.getAttribute("tell")%>" disabled/>
          </div></td>
        </tr>
        <tr>
          <td style="text-align:center">年龄:</td>
          <td>
            <div class="ui input">
             <%if(request.getAttribute("s_age")==null){%>
             <input type="text" id="s_age" placeholder="还没有录入" disabled/>
              <% }else{ %>
              <input type="text" id="s_age" value="<%=request.getAttribute("s_age")%>" disabled/>
            <%} %>
            </div>
          </td> 
           <td style="text-align:center">身份证号:</td>
          <td>
            <div class="ui input">
             <%if(request.getAttribute("s_pid")==null){%>
              <input type="text" id="s_pid" placeholder="还没有录入" disabled/>
               <% }else{ %>
              <input type="text" id="s_pid" value="<%=request.getAttribute("s_pid")%>" disabled/>
            <%} %>
            </div>
          </td>
        </tr>
        <tr>
         <td style="text-align:center">性别</td>
          <td>
            <div class="ui input">
            <%if(request.getAttribute("s_sex")==null){%>
                <input type="text" id="s_sex" placeholder="还没有录入" disabled/>
                        <% }else{ %> 
               <input type="text" id="s_sex" value="<%=request.getAttribute("s_sex")%>" disabled/>
                <%} %>
            </div>
          </td>
       
         <td style="text-align:center">教师性别：</td>
          <td>
            <div class="ui input">
            <%if(request.getAttribute("s_requestSex")==null){%>
                 <input type="text" id="s_requestSex" placeholder="还没有录入" disabled/>
                        <% }else{ %> 
                <input type="text" id="s_requestSex" value="<%=request.getAttribute("s_requestSex")%>" disabled/>
                <%} %>
            </div>
          </td>
        </tr>
        <tr>
         <td style="text-align:center">地址</td>
          <td>
            <div class="ui input">
              <%if(request.getAttribute("s_address")==null){%>
              <input type="text" id="s_address" placeholder="还没有录入" disabled/>
               <% }else{ %>
               <input type="text" id="s_address" value="<%=request.getAttribute("s_address")%>" disabled/>
               <%} %>
            </div>
          </td>
         
            <td style="text-align:center">价格要求:</td>
          <td>
            <div class="ui input">
            <%if(request.getAttribute("s_requestMoney")==null){%>
               <input type="text" id="s_requestMoney" placeholder="还没有录入" disabled/>
               <% }else{ %>
              <input type="text" id="s_requestMoney" value="<%=request.getAttribute("s_requestMoney")%>" disabled/>
            <%} %>
            </div>
          </td>
        </tr>
        <tr>
     
           <td style="text-align:center">年级:</td>
          <td>
            <div class="ui input">
             <%if(request.getAttribute("s_grade")==null){%>
                <input type="text" id="s_grade" placeholder="还没有录入" disabled/>
                     <% }else{ %>
                <input type="text" id="s_grade" value="<%=request.getAttribute("s_grade")%>" disabled/>    
                      <%} %>
            </div>
          </td>
          <td style="text-align:center">邮箱:</td>
          <td>
            <div class="ui input">
            <%if(request.getAttribute("s_email")==null){%>
              <input type="text" id="s_email" placeholder="还没有录入" disabled/>
               <% }else{ %>
              <input type="text" id="s_email" value="<%=request.getAttribute("s_email")%>" disabled/>
            <%} %>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align:center">学生状态:</td>
          <td colspan=3>
            <div class="ui form">
              <div class="field">
                <%if(request.getAttribute("s_status")==null){%>
                <textarea id="status" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;" disabled></textarea>
                 <% }else{ %>
 <textarea id="status" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;" disabled><%=request.getAttribute("s_status")%></textarea>
                  <%} %>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align:center" colspan=4>
           <a href="set_request.jsp"> <input type="button" value="点我去编辑" class="ui blue button"/></a>
           
          </td>
        </tr>
        <thead>
        <tr bgcolor="#009ad6">
          <td style="text-align:center" colspan=4><font size=2>@版权所有</font></td>
        </tr>
        </thead>
        </tbody>
        
      </table>
      </form>
     
  </div>



<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../js/semantic.min.js"></script>

<script type="text/javascript">
  $(document).ready(function(){
    $(".ui.dropdown").dropdown();
  });
  function update(){
	  var name=$("#name").val();
	  //alert(name);
	  var pid=$("#pid").val();
	  var age=$("#age").val();
	  var sex=$("#sex").val();
	  var email=$("#email").val();
	  var grade=$("#grade").val();
	  var requestSex=$("#requestSex").val();
	  var address=$("#address").val();
	  var status=$("#status").val();
	  var requestMoney=$("#requestMoney").val();
	  var tell=$("#tell").val();
	  //alert(tell);
	  $.ajax({
	    	type:"post",
          	url:"RequestAction",//需要用来处理ajax请求的action,LoginAction为处理的方法名，JsonAction为action名 
          	data:{//设置数据源
         	  name:name,
         	  pid:pid,
	      	  age:age,
	      	  sex:sex,
	      	  email:email,
	      	  grade:grade,
	    	  requestSex:requestSex,
	    	  address:address,
	    	  status:status,
	    	  requestMoney:requestMoney,
	      	  tell:tell
          },
         success:function(){
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