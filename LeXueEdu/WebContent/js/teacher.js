 function change(val, obj){
            if (val=='center') {
            	center.style.display='block';
            	list.style.display='none';
            	lesson.style.display='none';
                money.style.display='none';
                envelope.style.display='none';
            } else if(val=='list'){
            	list.style.display='block';
                center.style.display='none';
                lesson.style.display='none';
                money.style.display='none';
                envelope.style.display='none';
            } else if(val=='lesson'){
                lesson.style.display='block';
                center.style.display='none';
                list.style.display='none';
                money.style.display='none';
                envelope.style.display='none';
            } else if(val=='money'){
                money.style.display='block';
                center.style.display='none';
                list.style.display='none';
                lesson.style.display='none';
                envelope.style.display='none';  
            } else if(val=='envelope'){
                envelope.style.display='block';
                center.style.display='none';
                list.style.display='none';
                lesson.style.display='none';
                money.style.display='none';
            }
	   }