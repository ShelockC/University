//JQuery主方法
$(document).ready(function(){
	var year=new Date().getFullYear();//系统年份
	for(var i=0;i<6;i++){
		$("#yearList").append("<div class='item' data-value='"+(year-i)+"'>"+(year-i)+"</div>")
	}
    //发Ajax请求获取申报专业数据
	$.ajax({
		url:"/stuenroll/specialty/searchAll",
		data:{
			
		},
		success:function(response){
			//alert(response.list.length);
			var list=response.list;//得到数据
			for(var i=0;i<list.length;i++){
				var one=list[i];
				var id=one.id;
				var name=one.name;
				$("#specialtyList").append("<div class='item' data-value='"+id+"'>"+name+"</div>");
			}
		}
	});
	$.ajax({
		url:"/stuenroll/orgnization/searchAll",
		data:{
			
		},
		success:function(response){
			//alert(response.list.length);
			var list=response.list;//得到数据
			for(var i=0;i<list.length;i++){
				var one=list[i];
				var id=one.id;
				var name=one.name;
				$("#orgnizationList").append("<div class='item' data-value='"+id+"'>"+name+"</div>");
			}
		}
	});
	$(".ui.dropdown").dropdown();//激活下拉列表的选项
	
	$("#save").click(function(){
		//alert(1241325);
		var name=$("#name").val();
		//alert(name);
		var regName=new RegExp("^[\\u4e00-\\u9fa5]{2,8}$");//只能为中文
		//alert(regName);
		var rsName=regName.test(name);
		//alert(rsName);
		if(rsName==false){
			$("#name").css("color","red");
			alert("姓名填写错误");
		}
		else{
			$("#name").css("color","black");
		}
		
		var sex=$("#sex").val();
		var rsSex=(sex!=null&&sex!="");//不为空
		if(rsSex==false){
			alert("请选中性别");
		}
		
		 var nation=$("#nation").val();
		var reNation=(nation!=null&&nation!="");//不为空
		if(reNation==false){
			alert("请选中民族");
		}

		
		
		var graduate_school=$("#graduate_school").val();
		var regGrSchool=new RegExp("^[\\u4e00-\\u9fa5]{2,8}$");//只能为中文
		var rsGrSchool=regGrSchool.test(graduate_school);
		if(rsGrSchool==false){
			$("#graduate_school").css("color","red");
			alert("毕业学校填写错误");
		}else{
			$("#graduate_school").css("color","black");
		}
		
		var graduate_year=$("#graduate_year").val();
		var reGrYear=(graduate_year!=null&&graduate_year!="");//不为空
		if(reGrYear==false){
			alert("请选中毕业年份");
		}
		
		var graduate_date=$("#graduate_date").val();
		//alert(graduate_date);
		var reGrDate=new RegExp("\\d{4}-\\d{1,2}-\\d{1,2}");
		var rsGrDate=reGrDate.test(graduate_date);
		if(rsGrDate==false){
			$("#graduate_date").css("color","red");
			alert("毕业日期填写错误");
		}else{
			$("#graduate_date").css("color","black");
		}
		
		var education=$("#education").val();
		var reEducation=(education!=null&&education!="");//不为空
		if(reEducation==false){
			alert("请选中毕业学历");
		}
		
		var graduate_specialty=$("#graduate_specialty").val();
		var reGrSpecialty=(graduate_specialty!=null&&graduate_specialty!="");//不为空
		if(reGrSpecialty==false){
			alert("请选中所学专业");
		}
		
		var healthy=$("#healthy").val();
		var reHealthy=(healthy!=null&&healthy!="");//不为空
		if(reHealthy==false){
			alert("请选中健康状况");
		}
		
		var politics=$("#politics").val();
		var rePolitics=(politics!=null&&politics!="");//不为空
		if(rePolitics==false){
			alert("请选中政治面貌");
		}
		
		var birthday=$("#birthday").val();
		//alert(birthday);
		var reBirthday=new RegExp("\\d{4}-\\d{1,2}-\\d{1,2}");
		var rsBirthday=reBirthday.test(birthday);
		if(rsBirthday==false){
			$("#birthday").css("color","red");
			alert("出生日期填写错误");
		}else{
			$("#birthday").css("color","black");
		}
		
		var address=$("#address").val();
		//alert("现居住地:"+address);
		var reAddress=new RegExp("^[\\u4E00-\\u9FA5A-Za-z0-9_]+$");
		//alert(reAddress);
		var rsAddress=reAddress.test(address);
		if(rsAddress==false){
			$("#address").css("color","red");
			alert("现居住地填写错误");
		}else{
			$("#address").css("color","black");
		}
		
		var household_address=$("#household_address").val();
		//alert("户籍地址填写错误:"+household_address);
		var reHouseAddress=new RegExp("^[\\u4E00-\\u9FA5A-Za-z0-9_]+$");
		var rsHouseAddress=reHouseAddress.test(household_address);
		if(rsHouseAddress==false){
			$("#household_address").css("color","black");
			alert("户籍地址填写错误");
		}else{
			$("#household_address").css("color","black");
		}
		
		
		var tel=$("#tel").val();
		//alert(tel);
		var reTel=new RegExp("^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$");
		//alert(reTel);
		var rsTel=reTel.test(tel);
		//alert(rsTel);
		if(rsTel==false){
			$("#tel").css("color","red");
			alert("移动电话填写错误");
		}else{
			$("#tel").css("color","black");
		}
		
		var email=$("#email").val();
		//alert(email);
		var reEmail=new RegExp("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$");
		//alert(reEmail);
		var rsEmail=reEmail.test(email);
		if(rsEmail==false){
			$("#email").css("color","red");
			alert("电子信箱填写错误");
		}else{
			$("#email").css("color","black");
		}
		
		var home_address=$("#home_address").val();
		//alert("家庭住址:"+household_address);
		var reHomeAddress=new RegExp("^[\\u4E00-\\u9FA5A-Za-z0-9_]+$");
		var rsHomeAddress=reHomeAddress.test(home_address);
		if(rsHomeAddress==false){
			$("#home_address").css("color","red");
			alert("家庭住址填写错误");
		}else{
			$("#home_address").css("color","black");
		}
		
		var home_tel=$("#home_tel").val();
		var reHomeTel=new RegExp("^((\\d{3,4}-)|\\d{3,4}-)?\\d{7,8}$");
		var rsHomeTel=reHomeTel.test(home_tel);
		if(rsHomeTel==false){
			$("#home_tel").css("color","red");
			alert("家庭电话填写错误");
		}else{
			$("#home_tel").css("color","black");
		}
		
		var specialty=$("#specialty").val();
		var reSpecialty=(specialty!=null&&specialty!="");//不为空
		if(reSpecialty==false){
			alert("请选中申报专业");
		}
		
		var place=$("#place").val();
		var rePlace=(place!=null&&place!="");//不为空
		if(rePlace==false){
			alert("请选中培训地点");
		}
		
		var orgnization_id=$("#orgnization_id").val();
		var reOrgnization_id=(orgnization_id!=null&&orgnization_id!="");//不为空
		if(reOrgnization_id==false){
			alert("请选中培训机构");
		}
		var rsPid1;
		var pid=$("#pid").val();
		//alert(pid);
		var rePid=new RegExp("^\\d{15}$|^\\d{18}$|^\\d{17}(\\d|X|x)$");
		//alert(rePid);
		var rsPid=rePid.test(pid);
		//alert(rsPid);
		if(rsPid==false){
			$("#pid").css("color","red");
			alert("身份证号填写错误");
		}else {
			$.ajax({
				url : "/stuenroll/enroll/searchAll",
				data : {
					"pid" : pid,
				},
				async:false,
				success : function(response) {
					rsPid1 = response.result;
					//alert(rsPid1);
					if (rsPid1 == false) {
						alert("身份证号已存在");	
					}
				}
			});
		}
		if(rsPid1&&rsName&&rsSex&&rsPid&&reNation&&rsGrSchool&&reGrYear&&rsGrDate&&reEducation&&reGrSpecialty&&reHealthy&&rePolitics&&rsBirthday&&rsAddress&&rsHouseAddress&&rsTel&&rsEmail&&rsHomeAddress&&rsHomeTel&&reSpecialty&&rePlace&&reOrgnization_id){//都为true
			$.ajax({
				url:"/stuenroll/enroll/register",
				data:{
					"name":name,
					"sex":sex,
					"nation":nation,
					"pid":pid,
					"graduate_school":graduate_school,
					"graduate_year":graduate_year,
					"graduate_date":graduate_date,
					"education":education,
					"graduate_specialty":graduate_specialty,
					"healthy":healthy,
					"politics":politics,
					"birthday":birthday,
					"address":address,
					"household_address":household_address,
					"tel":tel,
					"email":email,
					"home_address":home_address,
					"home_tel":home_tel,
					"specialty":specialty,
					"orgnization_id":orgnization_id,
					"place":place,
					"year":year
					//"craete_time":date.getTime()
				},
				success:function(response){
					//alert(response.result);
					alert("提交成功！");
				}
			});
		}
	});
});