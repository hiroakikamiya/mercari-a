$(function(){
  $('#category-box').mouseover(function () {
    $(".category-index").css("display", "block");
  });
});
$(function(){
  $(".category-index").mouseout(function () {
    $(".category-index").css("display", "none");
  });
});
$(function(){
  $('.category-index').mouseover(function () {
    $(".category-index").css("display", "block");
  });
});
$(function(){
  $('#parents-box').mouseover(function () {
    $("#children-box").css("display", "block");
  });
});
$(function(){
  $('#children-box').mouseover(function () {
    $("#grandchildren-box").css("display", "block");
  });
});
$(function(){
  $("#grandchildren-box").mouseout(function () {
    $("#grandchildren-box").css("display", "none");
  });
});
$(function(){
  $("#parents-list").hover(function(){
    var parentCategory = document.getElementById('#parents-list').val;
    console.log(parentCategory)
    var url = "/items/edit_category_children"
    $.ajax({
        url: url,
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
    })
  });
});

