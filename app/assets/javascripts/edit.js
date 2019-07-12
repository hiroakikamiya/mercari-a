$(function(){
  function appendOption(children){
    var html = `<option value="${children.name}" data-category="${children.id}">${children.name}</option>`;
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
    $('#child-new').append(childSelectHtml);
  }
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='grandchild-form__wrapper' id= 'grandchildren_wrapper'>
                              <select class= category-group>
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
    var childId = document.getElementById('child-new').value;
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
      appendGrandChidrenBox(insertHTML);
    })
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
    })
  });
  // $(function(){
  //   $('#grandchild-form').on('change', function(){
  //     var grandchildId = $('#grandchild-form option:selected').data('category');
  //       $.ajax({
  //         url: 'get_grandchild_ids',
  //         type: 'GET',
  //         data: { grandchild_id: grandchildId },
  //         dataType: 'json'
  //       })
  //       .done(function(grand){
  //         $('.form_id').val(grand.id);

  //       })
  //       .fail(function(){
  //         alert('カテゴリー取得に失敗しました');
  //       })
  //   });
  // })
});