$(function(){
	var category_form = $("#child-form");
	function appendCategory(category){
		var html =`<select class= category-group>
							${category.name}
								</select>`
		category_form.append(html);
	}

$("#item_id").on("change",function(){
	var parentValue = document.getElementById("item_id").value;
	$.ajax({
		type: 'GET',
		url: '/items/new',
		data: {parent_id: parentValue},
		dataType: 'json'
	})

	.done(function(data){
		data.forEach(function(data){
			appendCategory(data);
			})
		})
	.fail(function() {
		alert('error');
		})
	})
});