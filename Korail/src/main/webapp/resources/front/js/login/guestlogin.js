var unKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
var regEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
$(function() {
	/*한글입력방지*/
	$("#userId").keyup(function(){
		if(unKorean.test($("#userId").val())){
			$(this).val( $(this).val().replace( unKorean, '' ) );
		}
	});
	// 세션 확인 후 로그인 페이지로 이동
	if ($("#loginCheck").val() == "0") {
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		$("#loginCheck").val('');
	}
	/*로그인 버튼 클릭시*/
	$("#guestLogin").click(function() {
		if(!valiInfo()){
			return;
		}
		$("#loginForm").attr({
			"method" : "POST",
			"action" : "guestlogin/login"
		});
		$("#loginForm").submit();
	});
});
function valiInfo(){
	if ($("#userId").val() == "") {
		alert("아이디를 입력해주세요.");
		$("#userId").val('');
		$("#userId").focus();
		return false;
	}
	if(!regEmail.test($("#userEmail").val())){
		alert("E-Mail형식이 잘못 되었습니다.\올바른 이메일 형식을 입력해 주십시오.");
		$("#userEmail").val('');
		$("#userEmail").focus();
		return;
	}
	var userPw = $("#userPw").val();
	if (userPw == "") {
		alert("비밀번호를 입력하세요.");
		$("#userPw").focus();
		return false;
	}
	return true;
}
