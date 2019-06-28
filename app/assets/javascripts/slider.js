$(window).load(function() {
	$('.slider').fadeIn(100); 
$(function() {
  $('.slider').slick({
      arrows: false,
      dots: true,
      autoplay: true,
      autoplaySpeed: 3500,
			speed: 800,
			fade: true
	});
});

  $('.slick-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});