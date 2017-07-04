var unKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
var regId = /^[a-z0-9_-]{6,15}$/;
$(function() {
	/*비회원 예매 조회*/
	$("#guestResSearch").click(function(){
		location.href="/korail/login/guestlogin";
	});
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
	$("#loginBtn").click(function() {
		if(!valiInfo()){
			return;
		}
		$("#loginForm").attr({
			"method" : "POST",
			"action" : "user"
		});
		$("#loginForm").submit();
	});
	/*회원가입 버튼 클릭시*/
	$("#signup").click(function() {
		location.href = "/korail/signup/"
	});
	/*ID찾기 버튼 클릭 시*/
	$("#btnid").click(function(){
		location.href = "/korail/user/searchid"
	});
	/*PW찾기 버튼 클릭시*/
	$("#btnpw").click(function(){
		location.href = "/korail/user/searchpw"
	});
	/*비회원 예매 버튼 클릭시*/
	$("#guestRes").click(function(){
	      location.href = "/korail/login/guest"
   });
});
function valiInfo(){
	if ($("#userId").val() == "") {
		alert("아이디를 입력해주세요.");
		$("#userId").val('');
		$("#userId").focus();
		return false;
	}
	if (!regId.test($("#userId").val())) {
		alert("아이디는 6~15자 이내만 가능합니다.");
		$("#userId").val('');
		$("#userId").focus();
		return false;
	}
	var userPw = $("#userPw").val();
	if (userPw == "") {
		alert("비밀번호를 입력하세요.");
		$("#userPw").focus();
		return false;
	}
	return true;
}
