var regPw =  /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
$(function(){
	/*한글입력방지*/
	/*비밀번호 변경 버튼 클릭시*/
	$("#btnspw").click(function() {
		if(!valiPw()){
			return;
		}
		$.ajax({
			url : "/korail/user/changepw",
			type : "POST",
			data : $("#cPwForm").serialize(),
			success : function(data) {
				if (data == 1) {
					alert("비밀번호 변경되었습니다.\n변경된 비밀번호로 로그인 하십시오.");
					location.href ="/korail/login/"
				}
			}
		});
	});
	
	
});
function valiPw(){
	if ($("#userPw").val() == "" || $("#userPw").val() == null) {
		alert("비밀번호를 입력해 주십시오.");
		$("#userPw").focus();
		return false;
	}
	if ($("#userPwchk").val() == "" || $("#userPwchk").val() == null) {
		alert("비밀번호 확인을 입력해 주십시오.")
		$("#userPwchk").focus();
		return false;
	}
	if ($("#userPw").val().length < 6 || !regPw.test($("#userPw").val())) {
		alert("비밀번호는 문자, 숫자, 특수문자의 조합으로 6~20자리로 입력해주세요.");
		$("#userPw").val('');
		$("#userPwchk").val('');
		$("#userPw").focus();
		return false;
	}
	if ($("#userPw").val() != $("#userPwchk").val()) {
		alert("비밀번호가 일치 하지 않습니다.");
		$("#userPw").val('');
		$("#userPwchk").val('');
		$("#userPw").focus();
		return false;
	}
	return true;
}
