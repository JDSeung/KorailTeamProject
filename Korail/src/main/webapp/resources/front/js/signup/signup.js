	var regPw =  /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	var regName = /^[가-힣]{2,10}$/;
	var regId = /^[a-z0-9_-]{6,15}$/;
$(function() {
	$("#zipCodedialog").dialog({
		autoOpen : false, // 자동으로 열리지않게
		modal : true, // 모달대화상자
		resizable : false, // 크기 조절 못하게
		height : 650,
		width : 650
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
	for (i = year; i > 1920; i--) {

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
	$("#idChk").click(function() {
		if(!valiId()){
			return;
		}
		$.ajax({
			url : "/korail/signup/idChk",
			type : "POST",
			data : $("#signupTb").serialize(),
			success : function(data) {
				chkData = data
				if (chkData == 0) {
					alert("해당 아이디는 사용가능합니다.");
				} else {
					alert("해당 아이디는 사용 불가능합니다.\n다른아이디를 입력하세요.");
					$("#userId").val('');
					$("#userId").focus();
				}
			}
		});
	});

	$("#userPw").keyup(function() {
		$('span[name=chk]').text('');
	});

	$("#userchkpw").keyup(function() {
		if ($("#userPw").val() != $("#userchkpw").val()) {
			$('span[name=chk]').html('암호가 일치하지 않습니다.').css("color", "red")
					.css("font-weight", "bold");
		}
		if ($("#userPw").val() == $("#userchkpw").val()) {
			$('span[name=chk]').html('');
		}
	});


	$("#okJoinBtn").click(function() {
			if(!valiId()){
				return;
			}
			if ($("#userPw").val() != $("#userchkpw").val()) {
				alert("암호가 일치 하지 않습니다.");
				$("#userPw").val('');
				$("#userchkpw").val('');
				$("#userPw").focus();
				return;
			}
			if ($("#userPw").val() == "" || $("#userchkpw").val() == "") {
				alert("암호를 입력해주세요.");
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
				data : $("#signupTb").serialize(),
				success : function(data) {
					data = data;
					alert("회원가입이 완료되었습니다.");
					location.href = "/korail";
				}
			});
		});
	$("#cencleBtn").click(function(){
		location.href = "/korail";
		alert("회원가입이 취소 되었습니다.");
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
