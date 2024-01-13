	window.actualPicHeight = 0
	window.actualPicWidth = 0
	window.paddingTop=0;

  function set_body_height(picWidth, picHeight, fitToWindow) { // set body height = window height
	if(fitToWindow){
	    $('body').height($(window).height());
		var picRatio=picWidth/picHeight;
		var windowRatio=$(window).width()/$(window).height();

		if(windowRatio > picRatio){
		    $('#background').width('');
		    $('#background').height($(window).height());
		}else{
		    $('#background').width($(window).width());
		    $('#background').height('');
		}
	} 
  }

  function initialize_reposition(picWidth, picHeight, fitToWindow = true) {
    window.picWidth = picWidth
    window.picHeight = picHeight
    set_body_height(picWidth, picHeight, fitToWindow);
	$('body').append('<span id="health_check" class=""></span>');
	
    repositionElementsInterval = setInterval(function(){
		// check if repositioned correctly
		var health_check = document.getElementById("health_check");
		if(health_check){
			var oldRectObject = health_check.getBoundingClientRect();
			repositionElement("health_check", 0.5, 0.5, 1, 1);
			var newRectObject = health_check.getBoundingClientRect();
			if( newRectObject.bottom == oldRectObject.bottom){
				$('#loader').hide()
				clearInterval(repositionElementsInterval);
			}
		}

		repositionElements();
	}, 100);

	window.onresize = function(event) {
	    set_body_height(picWidth, picHeight, fitToWindow);
		repositionElements();
	};
  }

	function getCoordsRelativeToImage(a,b, includeImagePadding) {
		var rectObject = document.getElementById("background").getBoundingClientRect();
		var picWidth=2560;
		var picHeight=1440;
		var picRatio=picWidth/picHeight;
		var bodyRatio=rectObject.width/rectObject.height;
		var paddingLeft=0;
		
		if(bodyRatio>picRatio){
			var zoom=rectObject.height/picHeight;
			actualPicHeight =rectObject.height;
			actualPicWidth = zoom*picWidth;
			paddingLeft =rectObject.width-actualPicWidth;
			paddingLeft/=2;
		}
		else{
			var zoom=rectObject.width/picWidth;
			actualPicWidth =rectObject.width;
			actualPicHeight = zoom*picHeight;
			paddingTop =rectObject.height-actualPicHeight;
			paddingTop/=2;
		}
		
		bot=paddingTop+actualPicHeight*b;
		if(includeImagePadding)
			left=$('#background').css('margin-left').replace('px', '')*1 + paddingLeft+actualPicWidth*a;
		else
			left=paddingLeft+actualPicWidth*a;
		return [left, bot];
	}

    function repositionElement(adjust_control, left, top, right, bottom, textfit = false, includeImagePadding = false) {
        if(document.getElementById(adjust_control) != null){ 
            document.getElementById(adjust_control).style.position="absolute";
            strobeTopLeft =getCoordsRelativeToImage(left, top, includeImagePadding);
            document.getElementById(adjust_control).style.left ="".concat(strobeTopLeft[0], "px");
            document.getElementById(adjust_control).style.top ="".concat(strobeTopLeft[1], "px");
            strobeBottomRight =getCoordsRelativeToImage(right, bottom, includeImagePadding);
            document.getElementById(adjust_control).style.width  ="".concat(strobeBottomRight[0]-strobeTopLeft[0], "px");
            document.getElementById(adjust_control).style.height ="".concat(strobeBottomRight[1]-strobeTopLeft[1], "px");
            
            if(textfit && !document.firstRun)
                textFit(document.getElementById(adjust_control), {maxFontSize: 13, multiLine: true});
        }
    }

