$(function(){
	// 세션 확인 후 로그인 페이지로 이동
	if($("#loginCheck").val() == "false"){
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	}
	$("#btnLogin").click(function(){
		var adminId = $("#adminId").val();
		var adminPw = $("#adminPw").val();
		
		if(adminId == ""){
			alert("아이디를 입력하세요.");
			$("#adminId").focus();
			return;
		}
		if(adminPw == ""){
			alert("비밀번호를 입력하세요.");
			$("#adminPw").focus();
			return;
		}
		
		
		$("#loginForm").attr({
			"method":"POST",
			"action":"/admin/loginCheck"
		});
		$("#loginForm").submit();
	});
	
	$("#btn").click(function(){
		$("#form1").attr({
			"method":"GET",
			"action":"/admin"
		});
		$("#form1").submit();
	});
});
