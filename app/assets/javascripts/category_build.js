$(function(){
  function appendOption(category){
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='child-form__wrapper' id= 'children_wrapper'>
                        <select class= category-select__box>
                          <option value="">---</option>
                            ${insertHTML}
                        </select>
                      </div>`;
    $('#child-form').append(childSelectHtml);
  }
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='grandchild-form__wrapper' id= 'grandchildren_wrapper'>
                              <select class= category-select__box>
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
          data: { grandchild_id: grandchildId },
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
