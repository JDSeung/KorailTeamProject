var regEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
var unKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
$(function(){
	/*한글입력방지*/
	$("#userEmail").keyup(function(){
		if(unKorean.test($("#userEmail").val())){
			$(this).val( $(this).val().replace( unKorean, '' ) );
		}
	});
	/*메일 인증 버튼 클릭시*/
	$("#btnsid").click(function() {
		if ($("#userEmail").val() == "" || $("#userEmail").val() == null) {
			alert("E-Mail을 입력해주세요.")
			return;
		}
		if(!regEmail.test($("#userEmail").val())){
			alert("E-Mail형식이 잘못 되었습니다.\올바른 이메일 형식을 입력해 주십시오.")
			return;
		}
		$.ajax({
			url : "/korail/user/checkmail",
			type : "POST",
			data : $("#sIdForm").serialize(),
			success : function(data) {
				if (data == 1) {
					sendMail();
					alert("해당 메일로 인증번호가발송되었습니다.");
				} else {
					alert("입력하신 E-mail은 가입되어 있지 않습니다.");
				}
			}
		});
	});
});

/*가입 가능 이메일 일 경우 메일 발송*/
function sendMail(){
	$.ajax({
		url : "/korail/user/searchid",
		type : "POST",
		data : $("#sIdForm").serialize(),
		success : function(data) {
		}
	});
}