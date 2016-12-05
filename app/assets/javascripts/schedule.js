//remove teacher column for mobile view

window.onload = function(){
  console.log('hello world')
	toggle();
};

$(window).resize(function(){
	toggle();
});

function toggle(){
	if( $(window).width() <= 443) {
		$('.teacher').hide();
	}
	else {
		$('.teacher').show();
	}
}
