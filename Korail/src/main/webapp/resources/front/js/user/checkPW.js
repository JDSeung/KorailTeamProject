$(function(){
	console.log($("#chkPw").val());
	if($("#chkPw").val() == "false"){
		alert("비밀번호를 잘못입력하셨습니다.")
	}
	$("#pwBtn").click(function(){
		changePw();
	});
});
function changePw(){
	if($("#userPw").val()==""){
		alert("비밀번호를 입력하세요.");
		$("#userPw").focus();
		return false;
	}
	$("#checkPwForm").attr({
		"method":"POST",
		"action":"page"
	});
	$("#checkPwForm").submit();
}
function eKey(e){
	if(e.keyCode == 13 && e.srcElement.type != 'textarea'){
		if(!changePw()){
			return false;
		}
	}
}