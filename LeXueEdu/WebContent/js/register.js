 $(function(){
	var correct="<span class='Cimg'><span>";
	var error="<span class='Eimg'><span>";
	var pw="<span class='pw'>请填写6到16位任意字符！<span>";
	$('#register input.txt').focus(function(){
			$(this).removeClass('error').addClass('focus');
			$(this).parent().find("span").remove();
			$(this).parent().find(".judge").css({"display":"none"});
	}).blur(function(){
			$(this).parent().removeClass('focus').remove("span");
			var regex = new RegExp($(this).attr('regex'));
			//
			console.log($(this).val());
			if(!regex.test($(this).val())){
				$(this).addClass('error');
				$(this).parent().append(error);
				$(this).parent().find(".judge").css({"display":"block"});
			}else{
				$(this).addClass('focus');
				$(this).parent().append(correct);
				if($(this).attr("id")=="password1"){
					
					if($(this).val()!=$("#register #password").val()){
						$(this).addClass('error');
						$(this).parent().append(error);
						$(this).parent().find(".judge").css({"display":"block"});
					}
						
				}
			}
	});
});