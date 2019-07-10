$(function(){
  function appendOption(category){
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='child-form__wrapper' id= 'children_wrapper'>
                        <select class= category-group>
                          <option value="">---</option>
                            ${insertHTML}
                        </select>
                      </div>`;
    $('#child-form').append(childSelectHtml);
  }
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='grandchild-form__wrapper' id= 'grandchildren_wrapper'>
                              <select class= category-group>
                                <option value="">---</option>
                                  ${insertHTML}
                              </select>
                            </div>`;
    $('#grandchild-form').append(grandchildSelectHtml);
  }

  $("#parent-form").on('change', function(){
    var parentCategory = document.getElementById('parent-form').value;
    if (parentCategory != '---'){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  });
  $('#child-form').on('change', function(){
    var childId = $('#child-form option:selected').data('category');
    if (childId != "---"){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
    }
  });
  $(function(){
    $('#grandchild-form').on('change', function(){
      var grandchildId = $('#grandchild-form option:selected').data('category');
        $.ajax({
          url: 'get_grandchild_ids',
          type: 'GET',
          data: { grand_id: grandchildId },
          dataType: 'json'
        })
        .done(function(grand){
          $('.form_id').val(grand.id);

        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
    });
  })
});
// 販売利益計算の部分だよ
$(function(){
  $("#price-input").on('keyup',function(e){
    e.preventDefault();
    var input = $("#price-input").val();
    if( 300 <= input && input <= 9999999) {
      var fee = Math.floor(input / 10);
      var total = (input - fee);
      $("#fee").text(fee + "円");
      $("#total").text(total + "円");
    }
    else{
      $("#fee").text("ー");
      $("#total").text("ー");
    }
  });
});
// 画像の複数投稿フォームだよ
// $(document).on("turbolinks:load", function() {
//   var dropzone = $(".item__img__dropzone__input");
//   var dropzone2 = $(".item__img__dropzone2__input2");
//   var appendzone = $(".item__img__dropzone2")
//   var input_area = $(".input-area");
//   var preview = $("#preview");
//   var preview2 = $("#preview2");

//   // 新規追加画像を格納する配列（ビュー用）
//   var images = [];
//   // 新規追加画像を格納する配列（DB用）
//   var new_image_files = [];

//   $("#new_item .item__img__dropzone, #new_item .item__img__dropzone2").on("change", 'input[type= "file"].upload-image', function() {

//     var file = $(this).prop("files")[0];
//     new_image_files.push(file)
//     var reader = new FileReader();

//     var img = $(`<div class= "add_img"><div class="img_area"><img class="image"></div></div>`);

//     var btn_wrapper = $('<div class="btn_wrapper"><a class="btn_edit">編集</a><a class="btn_delete">削除</a></div>');

//     // 画像に編集・削除ボタンをつける
//     img.append(btn_wrapper);

//     reader.onload = function(e) {
//       img.find("img").attr({
//         src: e.target.result
//       });
//     };

//     reader.readAsDataURL(file);
//     images.push(img);

//     // 画像が４枚以下のとき
//     if (images.length <= 4) {
//       $('#preview').empty();
//       $.each(images, function(index, image) {
//         image.data('image', index);
//         preview.append(image);
//       })
//       dropzone.css({
//         'width': `calc(100% - (20% * ${images.length}))`
//       })

//       // 画像が５枚のとき１段目の枠を消し、２段目の枠を出す
//     } else if (images.length == 5) {
//       $("#preview").empty();
//       $.each(images, function(index, image) {
//         image.data("image", index);
//         preview.append(image);
//       });
//       appendzone.css({
//         display: "block"
//       });
//       dropzone.css({
//         display: "none"
//       });
//       preview2.empty();

//       // 画像が６枚以上のとき
//     } else if (images.length >= 6) {
//       // 配列から６枚目以降の画像を抽出
//       var pickup_images = images.slice(5);

//       $.each(pickup_images, function(index, image) {
//         image.data("image", index + 5);
//         preview2.append(image);
//         dropzone2.css({
//           width: `calc(100% - (20% * ${images.length - 5}))`
//         });
//       });

//       // 画像が１０枚になったら枠を消す
//       if (images.length == 10) {
//         dropzone2.css({
//           display: "none"
//         });
//       }
//     }

//     var new_image = $(
//       `<input multiple= "multiple" name="item_images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`
//     );
//     input_area.append(new_image);
//   });


//   // 削除ボタンを押した時
//   $("#new_item .item__img__dropzone, #new_item .item__img__dropzone2").on('click', '.btn_delete', function() {

//     // 削除ボタンを押した画像を取得
//     var target_image = $(this).parent().parent();

//     // 削除画像のdata-image番号を取得
//     var target_image_num = target_image.data('image');

//     // 対象の画像を削除
//     target_image.remove();

//     // 対象の画像を削除した新たな配列を生成
//     images.splice(target_image_num, 1);
//     new_image_files.splice(target_image_num, 1);

//     if(images.length == 0) {
//       $('input[type= "file"].upload-image').attr({
//         'data-image': 0
//       })
//     }

//     // 削除後の配列の中身の数で条件分岐
//     // 画像が４枚以下のとき
//     if (images.length <= 4) {
//       $('#preview').empty();
//       $.each(images, function(index, image) {
//         image.data('image', index);
//         preview.append(image);
//       })
//       dropzone.css({
//         'width': `calc(100% - (20% * ${images.length}))`,
//         'display': 'block'
//       })
//       appendzone.css({
//         'display': 'none'
//       })

//       // 画像が５枚のとき１段目の枠を消し、２段目の枠を出す
//     } else if (images.length == 5) {
//       $('#preview').empty();
//       $.each(images, function(index, image) {
//         image.data('image', index);
//         preview.append(image);
//       })
//       appendzone.css({
//         'display': 'block',
//       })
//       dropzone2.css({
//         'width': '100%'
//       })
//       dropzone.css({
//         'display': 'none'
//       })
//       preview2.empty();

//       // 画像が６枚以上のとき

//     } else {
//       // １〜５枚目の画像を抽出
//       var pickup_images1 = images.slice(0, 5);

//       // １〜５枚目を１段目に表示
//       $('#preview').empty();
//       $.each(pickup_images1, function(index, image) {
//         image.data('image', index);
//         preview.append(image);
//       })

//       // ６枚目以降の画像を抽出
//       var pickup_images2 = images.slice(5);

//       // ６枚目以降を２段目に表示
//       $.each(pickup_images2, function(index, image) {
//           image.data('image', index + 5);
//           preview2.append(image);
//           dropzone2.css({
//             'display': 'block',
//             'width': `calc(100% - (20% * ${images.length - 5}))`
//           })
//         })
//     }
//   })


//   $('.new_item').on('submit', function(e){
//     // 通常のsubmitイベントを止める
//     e.preventDefault();
//     // images以外のform情報をformDataに追加
//     var formData = new FormData($(this).get(0));

//     // imagesがない場合は便宜的に空の文字列を入れる
//     if (new_image_files.length == 0) {
//       formData.append("new_images[images][]", " ")
//     // imagesがある場合はformDataに追加する
//     } else {
//       new_image_files.forEach(function(file){
//         formData.append("new_images[images][]", file)
//       });
//     }

//     $.ajax({
//       url:         '/items',
//       type:        "POST",
//       data:        formData,
//       contentType: false,
//       processData: false,
//     })
//   });
// });