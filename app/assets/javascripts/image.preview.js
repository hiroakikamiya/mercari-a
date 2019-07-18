$(function(){
  $(".sell-upload-box__change").click(function() {
    $(".sell-upload-box__preview").hide();
    $(".sell-upload-box__change").hide();
    $(".sell-upload-box__delete").hide();
    $(".image-form__hidden").css('display', 'block');
  });
});
$(function() {
  $(document).on('change','.sell-upload-box__delete__btn0',function(){
  $('#item_images_attributes_0_remove_image').prop('checked', true);
  });
});
$(function() {
  $(document).on('change','.sell-upload-box__delete__btn1',function(){
  $('#item_images_attributes_1_remove_image').prop('checked', true);
  });
});
$(function() {
  $(document).on('change','.sell-upload-box__delete__btn2',function(){
  $('#item_images_attributes_2_remove_image').prop('checked', true);
  });
});
$(function() {
  $(document).on('change','.sell-upload-box__delete__btn3',function(){
  $('#item_images_attributes_3_remove_image').prop('checked', true);
  });
});
$(function() {
  $(document).on('change','.sell-upload-box__delete__btn4',function(){
  $('#item_images_attributes_4_remove_image').prop('checked', true);
  });
});