//remove teacher column for mobile view

window.onload = function(){
  console.log('\n\n    @tristan.ag \nwww.tristangruener.com\n     愛で建てられた\n       (•‿•)')

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
