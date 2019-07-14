$(function(){
	$('.box-main__content__left__row-img img').hover(function(){
	$('.box-main__content__left__top-img img').attr('src', $(this).attr('src'));
		});
	});

	$(function() {
		$('.main-content__items__field__pickup__items-box').mouseover(function() {
			$('.main-content__items__field__pickup__items-box__sold').css('display', 'block');
		});
	});