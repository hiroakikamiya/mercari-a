$(function(){
  $(".sell-upload-box__change").click(function() {
    $(".sell-upload-box__preview").hide();
    $(".sell-upload-box__change").hide();
    $(".image-form__hidden").css('display', 'block');
  });
});
$(function () {
  $(".sell-upload-box__change").on("click", function () {
      $("#image-form").val();
  });
});
