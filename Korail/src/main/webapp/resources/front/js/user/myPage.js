$(function(){
	/*비밀번호 변경*/
	$("#chpwbtn").click(function(){
		location.href="/korail/user/editpw";
	});
	/*회원정보수정*/
	$("#btnedit").click(function(){
		location.href="/korail/user/editinfo";
	});
	/*예매조회*/
	$("#btnsearch").click(function(){
		$("#userInfo").attr({
			"method" : "POST",
			"action" : "resinfolist"
		});
		$("#userInfo").submit();
	});
	/*회원탈퇴*/
	$("#btnsignOut").click(function(){
		$.ajax({
			url : "/korail/user/signout",
			type : "POST",
			success : function(resultData) {
				if(resultData==1){
					alert("회원 탈퇴가 완료되었습니다.");
					location.href="/korail/";
				}else if(resultData==0){
					alert("탑승전 예매내역이 있는 회원은 탈퇴가 불가능 합니다.");
				}else{
					alert("시스템 오류로 인한 예매취소가 실패하였습니다.\n잠시 후 다시 시도하여주십시오.");
				}
			}
		});
	});
});