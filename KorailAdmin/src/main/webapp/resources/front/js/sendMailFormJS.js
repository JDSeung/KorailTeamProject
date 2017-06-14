$(document).ready(function() {
	$(function() {
		$("#dialog").dialog({
			autoOpen : false
		});
		$("#button").on("click", function() {
			$("#dialog").dialog("open");
		});
	});
	// Validating Form Fields.....
	$("#submit").click(function(e) {
		var email = $("#email").val();
		var name = $("#name").val();
		var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		if (email === '' || name === '') {
			alert("다 적어야 나간다");
			e.preventDefault();
		} else if (!(email).match(emailReg)) {
			alert("이메일 똑띠 적어라");
			e.preventDefault();
		} else {
			alert("전송 성공");
		}
	});
});