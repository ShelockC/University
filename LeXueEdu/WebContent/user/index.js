$(document).ready(function(){
		 $.ajax({
             type:"post",
             url:"RegionAction",//需要用来处理ajax请求的action,LoginAction为处理的方法名，JsonAction为action名 
             data:{//设置数据源 
             },
           	dataType:"json",//设置需要返回的数据类型 
            success:function(data){
                var d = eval("{"+data+"}");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构 
                //得到的d是一个形如{"key":"value","key1":"value1"}的数据类型，然后取值出来 
                for(var i=0;i<d.length;i++){
                	$("#r_list").append("<option>"+d[i]+"</option>");
                }
           },
         error:function(){ 
               alert("区域数据加载失败！");
             }//这里不要加"," 
        });
		 $.ajax({
             type:"post",
             url:"GradeAction",//需要用来处理ajax请求的action,LoginAction为处理的方法名，JsonAction为action名 
             data:{//设置数据源 
             },
           	dataType:"json",//设置需要返回的数据类型 
            success:function(data){
            	 var d = eval("{"+data+"}");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构 
                 //得到的d是一个形如{"key":"value","key1":"value1"}的数据类型，然后取值出来 
                 for(var i=0;i<d.length;i++){
                 	$("#g_list").append("<option>"+d[i]+"</option>");
                 }
                
           }, 
         error:function(){ 
               alert("系统异常，请稍后重试！");
             }//这里不要加"," 
        });
		 $.ajax({
             type:"post",
             url:"SubjectAction",//需要用来处理ajax请求的action,LoginAction为处理的方法名，JsonAction为action名 
             data:{//设置数据源 
             },
           	dataType:"json",//设置需要返回的数据类型 
            success:function(data){
            	 var d = eval("{"+data+"}");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构 
                 //得到的d是一个形如{"key":"value","key1":"value1"}的数据类型，然后取值出来 
                 for(var i=0;i<d.length;i++){
                 	$("#s_list").append("<option>"+d[i]+"</option>");
                 }
           }, 
         error:function(){ 
               alert("系统异常，请稍后重试！");
             }//这里不要加"," 
        });
	});