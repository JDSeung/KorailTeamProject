$(function(){
	$("#btnlist").click(function(){
		$("#pagingInfo").attr({
			"method":"GET",
			"action":"/korail/noticeboard/"
		});
		$("#pagingInfo").submit();
	});
});