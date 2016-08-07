// JavaScript Document
 var count=1;

    setInterval(changeimg,100); 
    function changeimg(){
    	var img1=document.getElementById("tittle1"); 
		var img2=document.getElementById("tittle2"); 
    	count++;
    	if(count==7){
    		count=1;
    	}
    	img1.src=count+".png";
		img2.src=count+".png";
    }
	function imgbig(e){
		var big1=document.getElementById("big");
		var img=document.getElementById("img");
		big1.style.display="block";
		img.src="image/p"+e+".png";
		}
		function imgout(){
			var big1=document.getElementById("big");
			big1.style.display="none";
			}