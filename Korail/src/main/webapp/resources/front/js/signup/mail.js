$(function() {
	$("#maildialog").dialog({
		autoOpen : false, // 자동으로 열리지않게
		modal : true, // 모달대화상자
		resizable : false, // 크기 조절 못하게
		height : 430,
		width : 580
	});
	$("#validationBtn").on("click", function() {
		$("#maildialog").dialog("open"); // 다이얼로그창 오픈
	});
});