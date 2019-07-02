$(function(){
	var category_form = $("item_id");
	function appendCategory(category){
		var html =`<%= f.collection_select :id, @children, :id, :name %>`
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
			console.log(data);
			})
		})
	.fail(function() {
		alert('error');
		})
	})
});