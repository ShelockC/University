$(document).ready(function(){
	$("#a").click(function(){
		
		$('.ui.basic.modal')
		  .modal('show');
		})
	
	$("#close_icon").click(function(){
		$('.ui.basic.modal')
		  .modal('hide');
	});
	$("#pid").focus(function(){
		var msg = $('.showError').innerHTML;
		if( msg != null || msg != 
			""){
			$('.showError').css('display','none');
		}
	});
	$("#submit").click(function(){
		var pid = $("#pid").val();
		var regPid = new RegExp("^[0-9]{17}([0-9]|[X])$");//校验身份证号
		var rsPid = (pid.length == 18 && regPid.test(pid)); 
		if(rsPid){
			$.ajax({
				url:"/stuenroll/enroll/searchPid",
				data:{
					"pid":pid
				},
				success:function(response){
				
					var error = response.error;
					if(error != null){
						$.ajax({
							url:"/stuenroll/excel/MyapplyExcel",
							data:{
								"pid":pid
							},
							success:function(response){
								
							}	
						});
						
							$('.ui.basic.modal')
							  .modal('hide');
							
					} else {
						showErr($("#searchfield"),"不存在该身份证号，请核实重新填入");
					}
		}
				
			});
			
		} else {
			showErr($("#searchfield"),"请输入18位有效身份证号码");
		}
	});
});
var showErr = function(e,msg){
	e.append("<div class='showError'>"+msg+"</div>");
}
