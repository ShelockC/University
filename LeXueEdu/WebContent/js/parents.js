// 返回顶部
function return_top(){
	 var obtn = document.getElementById("btn");
    //获取页面可视区的高度
    var clientHeight=document.documentElement.clientHeight||document.body.clientHeight;
    var timer = null;
    var isTop = true;
        
    window.onscroll=function(){
      var osTop=document.documentElement.scrollTop||document.body.scrollTop;
    if (osTop >= clientHeight/3){//小bug clientHeight=2073,正确值为667
        obtn.style.display="block"; //显示按钮
    }else {
        obtn.style.display="none"; //隐藏按钮
    }
    if (!isTop){
        clearInterval(timer);
    }
        isTop = false;  
    };
    obtn.onclick = function(){
    //设置定时器
    timer = setInterval(function(){
        var osTop=document.documentElement.scrollTop||document.body.scrollTop;
        var ispeed = Math.floor(-osTop / 6);
    //获取滚动条距离顶部的高度
    document.documentElement.scrollTop=document.body.scrollTop=osTop+ispeed;
    isTop = true;
    if(osTop == 0){
        clearInterval(timer);
        }
    },30);
   }
}
return_top();