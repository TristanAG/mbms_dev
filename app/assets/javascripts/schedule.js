




window.onload = function(){
  //console.log('\n\n    @tristan.ag \nwww.tristangruener.com\n マジック | フォーカス\n       (•‿•)')
  console.log('\n\n@Tristan_AG 愛 健康 (•‿•)\n意図 | フォーカス | マジック')

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
