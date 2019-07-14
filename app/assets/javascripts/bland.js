$(function() {
  $('.brandlist').mouseover(function() {
    $('.bland-list').css('display', 'block');
  });
  $('.bland-list__main__list').mouseover(function() {
    $('.bland-list').css('display', 'block');
  });
  $('.bland-list__main').mouseout(function() {
    $('.bland-list').css('display', 'none');
  });
  $('.brandlist').mouseout(function() {
    $('.bland-list').css('display', 'none');
  });
});

$(function() {
  $('.dolist').mouseover(function() {
    $('.do-list').css('display', 'block');
  });
  // $('.bland-list__main__list').mouseover(function() {
  //   $('.bland-list').css('display', 'block');
  // });
  $('.do-list').mouseout(function() {
    $('.do-list').css('display', 'none');
  });
  $('.dolist').mouseout(function() {
    $('.do-list').css('display', 'none');
  });
});
