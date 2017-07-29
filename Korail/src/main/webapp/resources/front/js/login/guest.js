	var regPw =  /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	var regName = /^[가-힣]{2,10}$/;
	var regId = /^[a-z0-9_-]{6,15}$/;
$(function(){
	
	/*메일 버튼 클릭시*/
	$("#chmailbtn").on("click", function() {
		$("#maildialog").dialog("open"); // 다이얼로그창 오픈
	});
	
	$("#zipBtn").on("click", function() {
		$("#zipCodedialog").dialog("open"); // 다이얼로그창 오픈
	});
	
	$("#okguestBtn").click(function(){
		if(!valiId()){
			return;
		}
		if ($("#userPw").val() != $("#userchkpw").val()) {
			alert("비밀번호가 일치 하지 않습니다.");
			$("#userPw").val('');
			$("#userchkpw").val('');
			$("#userPw").focus();
			return;
		}
		if ($("#userPw").val() == "" || $("#userchkpw").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#userPw").val('');
			$("#userchkpw").val('');
			$("#userPw").focus();
			return;
		}
		if ($("#userPw").val().length < 6 || !regPw.test($("#userPw").val())) {
			alert("비밀번호는 문자, 숫자, 특수문자의 조합으로 6~20자리로 입력해주세요.");
			$("#userPw").val('');
			$("#userchkpw").val('');
			$("#userPw").focus();
			return;
		}
		if (!regName.test($("#userName").val()) || $("#userName").val() == "") {
			alert("한글이름만 가능합니다.");
			$("#userName").val('');
			$("#userName").focus();
			return;
		}
		if ($("#userphone1").val() == ""
				|| $("#userphone2").val() == ""
				|| $("#userphone3").val() == "") {
			alert("전화번호를 입력해주세요.");
			$("#userphone1").val('');
			$("#userphone2").val('');
			$("#userphone3").val('');
			$("#userphone1").focus();
			return;
		}
		if ($("#dorozip").val() == "" || $("#doroaddrVil").val() == "" || $("#doroaddrDit").val() == "") {
			alert("주소를 입력해주세요.");
			return;
		}
		$.ajax({
			url : "/korail/signup/sign",
			type : "POST",
			data : $("#guestTb").serialize(),
			success : function(data) {
				if(data == 1){
					alert("정보 입력이 완료되었습니다.");
					guestLogin();
				}else{
					alert("시스템 오류로 인한 정보 입력이 실패하였습니다.\n잠시 후 다시 시도하여주십시오.");
				}
			}
		});
	});
	
	$("#datepicker").button();
	$("#datepicker").datepicker({
		showOn : "button",
		maxDate : "0",
		buttonImage : "/korail/resources/front/img/h_calendar.png",
		buttonImageOnly : true,
		onSelect : function(dateText, inst) {
			altField: '#getdate';
			var calyear = dateText.substr(6, 4);
			var calmonth = dateText.substr(0, 2) - 1;
			var calday = dateText.substr(3, 2) - 1;
			initDate(calyear, calmonth, calday);
		}
	});

	/* 데이트피커클릭시 */
	$('.ui-datepicker-trigger').click(function() {
		var calyear = $('#cmbYear').val();
		var calmonth = $('#cmbMonth').val();
		var calday = $('#cmbDay').val();
		var date = new Date(calyear, calmonth - 1, calday, 0, 0, 0, 0);
		$("#datepicker").datepicker("setDate", date);
	});
	var Now = new Date();
	var year = Now.getFullYear();
	for (i = year; i >= 1920; i--) {

		var option = $("<option value = '" + i + "'>" + i + "</option>");
		$('#cmbYear').append(option);
	}
	for (i = 1; i <= 12; i++) {
		var option = $("<option value = '" + i + "'>" + i + "</option>");
		$('#cmbMonth').append(option);
	}
	for (i = 1; i <= 31; i++) {
		var option = $("<option value = '" + i + "'>" + i + "</option>");
		$('#cmbDay').append(option);
	}
	setDate();
	
	$("#userPw").keyup(function() {
		if($('#chk').val() == ''){
			$('#chk').html('비밀번호를 입력 바랍니다.').css("color", "red")
			.css("font-weight", "bold");
		}else{
			$('#chk').html('비밀번호가가 일치하지 않습니다.').css("color", "red")
			.css("font-weight", "bold");
		}
	});

	$("#userchkpw").keyup(function() {
		if ($("#userPw").val() != $("#userchkpw").val()) {
			$('#chk').html('비밀번호가가 일치하지 않습니다.').css("color", "red")
					.css("font-weight", "bold");
		}
		if ($("#userPw").val() == $("#userchkpw").val()) {
			$('#chk').html('비밀번호가 일치합니다.').css("color", "#256cc6").css("font-weight", "bold");
		}
	});
	
	
});
function valiId(){
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
	return true;
}
/*이메일 변경 금지를 위해 클릭시 다얼로그창 오픈*/
function emailChk(){
	$("#maildialog").dialog("open"); // 다이얼로그창 오픈
}
function guestLogin(){
	$("#guestTb").attr({
		"method" : "POST",
		"action" : "/korail/login/guestinfo"
	});
	$("#guestTb").submit();
}

/* 날짜 가져오기 */
function setDate() {
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth();
	var day = date.getDate() - 1;
	initDate(year, month, day);
}

/* 날짜 cmb에 입력하기 */
function initDate(cbyear, cbmonth, cbday) {
	$("#cmbYear option:eq('" + cbyear + "')").prop("selected", true);
	$("#cmbMonth option:eq('" + cbmonth + "')").prop("selected", true);
	$("#cmbDay option:eq('" + cbday + "')").prop("selected", true);
}

/* 날짜 추가 */
function fn_GetDay() {
	var day = 32 - new Date($('#cmbYear').val(), $('#cmbMonth').val() - 1, 32)
			.getDate();
	for (i = 1; i <= day; i++) {
		var option = $("<option value = '" + i + "'>" + i + "</option>");
		$('#cmbDay').append(option);
	}
};
function emailChk(){
	$("#maildialog").dialog("open"); // 다이얼로그창 오픈
}
