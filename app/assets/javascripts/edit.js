$(function(){
  function appendOption(children){
    var html = `<option value="${children.name}" data-category="${children.id}">${children.name}</option>`;
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
    $('#child-new').append(childSelectHtml);
  }
  function appendGrandChildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='grandchild-form__wrapper' id= 'grandchildren_wrapper'>
                              <select class= category-select__box>
                                <option value="">---</option>
                                  ${insertHTML}
                              </select>
                            </div>`;
    $('#grandchild-new').append(grandchildSelectHtml);
  }
  $("#parent-edit").on('change', function(){
    var parentCategory = document.getElementById('parent-edit').value;
    var url = "/items/edit_category_children"
    $.ajax({
        url: url,
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
    })
    .done(function(children){
      $('#child-edit').remove();
      $('#grand-edit').remove();
      $('#child-new').empty();
      var insertHTML = '';
      children.forEach(function(child){
        insertHTML += appendOption(child);
      });
      appendChidrenBox(insertHTML);
    })
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
    })
  });
  $('#child-new').on('change', function(){
    var childId = $('#child-new option:selected').data('category');
    console.log(childId)
    var url = "/items/edit_category_grandchildren"
    $.ajax({
        url: url,
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
    })
    .done(function(grandchildren){
      $('#grand-new').remove();
      $('#grandchild-new').empty();
      var insertHTML = '';
      grandchildren.forEach(function(grandchild){
        insertHTML += appendOption(grandchild);
      });
      appendGrandChildrenBox(insertHTML);
    })
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
    })
  });
  $(function(){
    $('#grandchild-new').on('change', function(){
      var grandchildId = $('#grandchild-new option:selected').data('category');
      var url = "/items/edit_category_grandchild_id"
        $.ajax({
          url: url,
          type: 'GET',
          data: { grandchild_id: grandchildId },
          dataType: 'json'
        })
        .done(function(grand){
          $('.form_edit_category').val(grand.id);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
    });
  })
});
$(function () {
  $('.category-select__fake').click(function () {
      $('.category-select__wrapper').hide();
      $("#parent-edit").css("display", "block");
      $("#child-edit").css("display", "block");
      $('#child-edit').remove();
      $('#grand-edit').remove();
      $('#child-new').empty();
  });
});
