<script type="text/javascript" language="JavaScript">

        // coordinates moved to js file

$(function() {
	var adjust_control = "burial_undertaker";
	var container_control = "background";

    $('#'+adjust_control).remove()

    $('#death_svg').append('<span id="'+adjust_control+'" class="overlay-link"> <i class="fa fa-check" aria-hidden="true" style="font-size: 8px;"></i></span>')
    // $('#death_svg').append('<span id="'+adjust_control+'" class="overlay-link dhivehi"> ދިވެހިރާއްޖެ </span>')
    
	var a = document.getElementById(adjust_control);
	var strobeLoaded = 0;

	$('#'+adjust_control).css('background-color', '#00BCD4')
	$('#'+adjust_control).css('opacity', '0.5')


	
 $(document).keyup(function(event){
   



	if( $("#loader").is(":hidden") && !strobeLoaded ){
		strobeLoaded = 1;
		if(a == null || a.offsetLeft == 0){
			strobeLeft=400;
			strobeTop=-395;
			strobeRight=699;
			strobeBottom=-154;
		}else{
			   getCoordsRelativeToImage(0,0)
			var b = document.getElementById(container_control).getBoundingClientRect();
			strobeLeft= a.offsetLeft;
			strobeTop= (a.offsetTop-b.top-window.paddingTop*1)*(b.bottom-b.top)/window.actualPicHeight;
			strobeRight= strobeLeft + a.offsetWidth;
			strobeTop= (a.offsetTop-b.top-window.paddingTop*1)*(b.bottom-b.top)/window.actualPicHeight;
		
		
		
		
			var picWidth=2560;
			var picHeight=1440;
			var picRatio=picWidth/picHeight;
			var bodyRatio=b.width/b.height;
			var paddingLeft=0;
			
			if(bodyRatio>picRatio){
				var zoom=b.height/picHeight;
				actualPicHeight =b.height;
				actualPicWidth = zoom*picWidth;
				paddingLeft =b.width-actualPicWidth;
				paddingLeft/=2;
			} else {
				var zoom=b.width/picWidth;
				actualPicWidth =b.width;
				actualPicHeight = zoom*picHeight;
				paddingTop =b.height-actualPicHeight;
				paddingTop/=2;
			}
			
			strobeTop=((a.offsetTop - paddingTop) / actualPicHeight)*(b.bottom-b.top);
			strobeBottom= ((a.offsetTop + a.offsetHeight - paddingTop) / actualPicHeight)*(b.bottom-b.top);
			// if(includeImagePadding)
			   //  left=$('#background').css('margin-left').replace('px', '')*1 + paddingLeft+actualPicWidth*a;
			// else
			   //  left=paddingLeft+actualPicWidth*a;
			// return [left, bot];
		}
			
	}






    // return;
     var b = document.getElementById(container_control).getBoundingClientRect();

     // // width
     // if(event.keyCode == 37 || event.keyCode == 39){
     //     var width = 532
     //     var fraction = (strobeRight - strobeLeft)/$('#'+adjust_control)[0].getBoundingClientRect().width;
     //     strobeRight = strobeLeft + width*fraction;
     // }

     // height
     if(event.keyCode == 38 || event.keyCode == 40){
         var height = 25
         var fraction = (strobeBottom - strobeTop)/$('#'+adjust_control)[0].getBoundingClientRect().height;
         strobeBottom = strobeTop + height*fraction;
     }

    
     if(event.keyCode == 37){
         if (event.altKey){
             strobeLeft-=100;
             strobeRight-=100;
         }
         else if (event.ctrlKey){
             strobeLeft-=10;
             strobeRight-=10;
         }
         else{
             strobeLeft--;
             strobeRight--;
         }
     }else if(event.keyCode == 39){
         if (event.altKey){
             strobeLeft+=100;
             strobeRight+=100;
         }
         else if (event.ctrlKey){
             strobeLeft+=10;
             strobeRight+=10;
         }
         else{
             strobeLeft++;
             strobeRight++;
         }
     }else if(event.keyCode == 38){
         if (event.altKey){
             strobeTop-=100;
             strobeBottom-=100;
         }
         else if (event.ctrlKey){
             strobeTop-=10;
             strobeBottom-=10;
         }
         else{
             strobeTop--;
             strobeBottom--;
         }
         // strobeBottom = strobeTop + 45/1.2380644741419802222222222222222;
     }else if(event.keyCode == 40){
         if (event.altKey){
             strobeTop+=100;
             strobeBottom+=100;
         }
         else if (event.ctrlKey){
             strobeTop+=10;
             strobeBottom+=10;
         }
         else{
             strobeTop++;
             strobeBottom++;
         }
         // strobeBottom = strobeTop + 45/1.2380644741419802222222222222222;
         var fraction = (strobeBottom - strobeTop)/19;
     }
    
     else if(event.keyCode == 188){
         if (event.altKey)
             strobeRight-=100;
         else if (event.ctrlKey)
             strobeRight-=10;
         else
             strobeRight--;
     }else if(event.keyCode == 191){
         if (event.altKey)
             strobeRight+=100;
         else if (event.ctrlKey)
             strobeRight+=10;
         else
             strobeRight++;
     }else if(event.keyCode == 76 || event.keyCode == 186){
         if (event.altKey)
             strobeBottom-=100;
         else if (event.ctrlKey)
             strobeBottom-=10;
         else
             strobeBottom--;
     }else if(event.keyCode == 190){
         if (event.altKey)
             strobeBottom+=100;
         else if (event.ctrlKey)
             strobeBottom+=10;
         else
             strobeBottom++;
     }else if(event.keyCode == 13){
         prompt("Copy to clipboard: Ctrl+C, Enter", "".concat('repositionElement("', adjust_control, '", ', strobeLeft, "/", (b.right-b.left), ", ", strobeTop, '/', (b.bottom-b.top), ', ', strobeRight, "/", (b.right-b.left), ", ", strobeBottom, '/', (b.bottom-b.top), ');'));
     }

     repositionElement(adjust_control, strobeLeft/(b.right-b.left), (strobeTop)/(b.bottom-b.top), 
                            (strobeRight)/(b.right-b.left), (strobeBottom)/(b.bottom-b.top));
 });
});

</script>  
