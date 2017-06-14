$(function(){
	$("#btnLogin").click(function(){
		var query = {
				id: $("#id").val(),
				password: $("#pw").val()
		};
		$.ajax({
			type:"GET",
			url:"success",
			data:query,
			success:function(data){
				
			}
		});
	});
});