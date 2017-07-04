var regEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
var unKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
var regId = /^[a-z0-9_-]{6,15}$/;
$(function(){
	/*한글입력방지*/
	$("#userEmail").keyup(function(){
		if(unKorean.test($("#userEmail").val())){
			$(this).val( $(this).val().replace( unKorean, '' ) );
		}
	});
	$("#userId").keyup(function(){
		if(unKorean.test($("#userId").val())){
			$(this).val( $(this).val().replace( unKorean, '' ) );
		}
	});
	/*메일 인증 버튼 클릭시*/
	$("#btnspw").click(function() {
		if(!valiId()){
			return;
		}
		$.ajax({
			url : "/korail/user/searchpw",
			type : "POST",
			data : $("#sPwForm").serialize(),
			success : function(data) {
				if (data == 1) {
					location.href="/korail/user/editpw"
				} else {
					alert("입력하신 정보를 찾을 수 없습니다.");
				}
			}
		});
	});
});
function valiId(){
	if ($("#userEmail").val() == "" || $("#userEmail").val() == null) {
		alert("E-Mail을 입력해주세요.");
		$("#userEmail").focus();
		return false;
	}
	if(!regEmail.test($("#userEmail").val())){
		alert("E-Mail형식이 잘못 되었습니다.\n올바른 이메일 형식을 입력해 주십시오.");
		$("#userEmail").val('');
		$("#userEmail").focus();
		return false;
	}
	if ($("#userId").val() == "" || $("#userId").val() == null) {
		alert("아이디를 입력해주세요.")
		$("#userId").focus();
		return;
	}
	if (!regId.test($("#userId").val())) {
		alert("아이디는 6~15자 이내만 가능합니다.");
		$("#userId").val('');
		$("#userId").focus();
		return false;
	}
	return true;
}