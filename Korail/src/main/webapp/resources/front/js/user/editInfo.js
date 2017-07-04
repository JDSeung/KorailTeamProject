$(function(){
	/*비밀번호 변경 클릭시*/
	$("#chpwbtn").click(function(){
		location.href="/korail/user/editpw";
	});
	
	/*수정 버튼 클릭시*/
	$("#editBtn").click(function(){
		if($("#uemail").val() != $(".email").html()){
			$("#uemail").val($(".email").html())
		}
		$.ajax({
			url : "edituserinfo",
			type : "POST",
			data : $("#signupTb").serialize(),
			success : function(resultData) {
				if(resultData==1){
					alert("회원 정보 수정이 완료되었습니다.")
					$("#signupTb").attr({
						"method":"POST",
						"action":"/korail/user/page"
					});
					$("#signupTb").submit();
				}
			}
		});
		
	});
	/*취소 버튼클릭시 마이페이지이동*/
	$("#cencleBtn").click(function(){
		$("#signupTb").attr({
			"method":"POST",
			"action":"/korail/user/page"
		});
		$("#signupTb").submit();
	});
	/*메일 팝업*/
	$("#maildialog").dialog({
		autoOpen : false, // 자동으로 열리지않게
		modal : true, // 모달대화상자
		resizable : false, // 크기 조절 못하게
		height : 480,
		width : 600
	});
	/*우편번호 팝업*/
	$("#zipCodedialog").dialog({
		autoOpen : false, // 자동으로 열리지않게
		modal : true, // 모달대화상자
		resizable : false, // 크기 조절 못하게
		height : 650,
		width : 650
	});
	/*메일 버튼 클릭시*/
	$("#chmailbtn").on("click", function() {
		$("#maildialog").dialog("open"); // 다이얼로그창 오픈
	});
	/*우편번호 다이얼로그창 끄면 데이터 초기화*/
	$("#zipCodedialog").dialog({
		beforeClose: function(event, ui) {
			$("#searchData").val('');
			$("table.roadtbl").addClass("hidetbl");
			$("#roadList").empty();
		}
	});
	$("#zipBtn").on("click", function() {
		$("#zipCodedialog").dialog("open"); // 다이얼로그창 오픈
	});
	$("#dorozip").on("click", function() {
		$("#zipCodedialog").dialog("open"); // 다이얼로그창 오픈
	});
	$("#doroaddrVil").on("click", function() {
		$("#zipCodedialog").dialog("open"); // 다이얼로그창 오픈
	});
});