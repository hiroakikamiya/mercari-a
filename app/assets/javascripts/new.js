$(function(){
	
	function appendCategory(category){
		let options = ""
		category.forEach(function(child){
			options += `<option value="${child.id}">${child.name}</option>`
		})
		let html =`<select id="category" class= category-group>
								 <option value="">---</option>
									${options}
								</select>`
		$('#child-form').append(html)
	}

	$("#parent-form").on("change",function(){
		$("#child-form").empty()
		var parentValue = document.getElementById("parent-form").value;
		$.ajax({
			type: 'GET',
			url: '/items/new',
			data: {parent_id: parentValue},
			dataType: 'json'
		})
		.done(function(data){
			appendCategory(data)
		})
		.fail(function() {
			alert('error');
		})
	});
});

$(function(){
	
	function appendGrandchild(category){
		let options = ""
		category.forEach(function(grand){
			options += `<option value="${grand.id}">${grand.name}</option>`
		})
		let html =`<select class= category-group>
								 <option value="">---</option>
									${options}
								</select>`
		$('#grandchild-form').append(html)
	}

	$("#child-form").on("change",function(){
		var grandValue = document.getElementById("category").value;
		$.ajax({
			type: 'GET',
			url: '/items/search',
			data: {child_id: grandValue},
			dataType: 'json'
		})
		.done(function(data){
			appendGrandchild(data)
		})
		.fail(function() {
			alert('error');
		})
	});
});

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