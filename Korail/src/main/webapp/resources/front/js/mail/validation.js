var keyValue;

$(function() {
	var regEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	var unKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
	/*한글입력방지*/
	$("#email").keyup(function(){
		if(unKorean.test($("#email").val())){
			$(this).val( $(this).val().replace( unKorean, '' ) );
		}
	});
	
	/*인증번호 재발송*/
	$("#revalidationBtn").click(function() {
		$.ajax({
			url : "",
			type : "POST",
			data : $("#mailForm").serialize(),
			success : function(data) {
				keyValue = data;
				alert("해당메일로 인증번호가 재발송되었습니다.");
			}
		});
	});
	/*메일 팝업*/
	$("#maildialog").dialog({
		autoOpen : false, // 자동으로 열리지않게
		modal : true, // 모달대화상자
		resizable : false, // 크기 조절 못하게
		height : 480,
		width : 600
	});
	/*메일 인증 버튼 클릭시*/
	$("#validationBtn2").click(function() {
		$("#key").val('');
		if ($("#email").val() == "" || $("#email").val() == null) {
			alert("E-Mail을 입력해주세요.")
			return;
		}
		if(!regEmail.test($("#email").val())){
			alert("E-Mail형식이 잘못 되었습니다.\올바른 이메일 형식을 입력해 주십시오.")
			return;
		}
		$("#userEmail").val($("#email").val());
		$.ajax({
			url : "/korail/signup/overlapid",
			type : "POST",
			data : $("#mailForm").serialize(),
			success : function(data) {
				if (data == '1' || data == '2' || data =='') {
					sendMail();
					alert("가입가능한 이메일입니다.\n해당 메일로 인증번호가발송되었습니다.");
				} else {
					alert("입력하신 E-mail은 가입되어 있는 이메일입니다.");
				}
			}
		});
	});
	/*취소버튼 클릭시*/
	$("#cancelBtn").click(function() {
		 $("#maildialog").dialog("close");
	});
	$("#maildialog").dialog({
		beforeClose: function(event, ui) {
			$("#key").attr("readonly", true);
			$("#email").attr("readonly", false);
			$("#revalidationBtn").attr("disabled", true);
			$("#okBtn").attr("disabled", true);
			$("#key").val('');
			$("#userEmail").val($("#email").val());
			$("#email").val('');
			keyValue = '';
		}
	});
});

/*가입 가능 이메일 일 경우 메일 발송*/
function sendMail(){
	$.ajax({
		url : "/korail/signup/",
		type : "POST",
		data : $("#mailForm").serialize(),
		success : function(data) {
			keyValue = data;
			$("#key").attr("readonly", false);
			$("#email").attr("readonly", true);
			$("#revalidationBtn").attr("disabled", false);
			$("#okBtn").attr("disabled", false);
		}
	});
}

/*인증번호 검사*/
function check() {
	if ($("#key").val() != keyValue) {
		alert("인증번호를 정확히 입력해 주십시오.");
		return;
	}
	if ($("#key").val() == "" && $("#key").val() == null) {
		alert("인증번호를 입력해주세요.");
		return;
	}
	if ($("#key").val() == keyValue) {
		if(document.getElementById("hide")){
			$(".email").html($("#userEmail").val());
			$("#maildialog").dialog( "close" );
		}else if(document.getElementById("ghide")){
			$(".uemail").val($("#userEmail").val());
			$("#maildialog").dialog( "close" );
		}else{
			form_submit();
		}
		
	}
}

/*인증*/
function form_submit() {
	$('#mailForm').attr({
		"method" : "POST",
		'action' : 'agreement'
	});
	$("#userEmail").val($("#email").val());
	alert('이메일 인증이 완료되었습니다.');
	$('#mailForm').submit();
}

// 인증번호 입력 카운트다운

var checkTime = 180 // 필요한 초만큼 입력
function fnTimeCheck() {
	if (checkTime > 0) {
		if (checkTime == 180) {
			document.getElementById("#countTime").innerHTML = "3:00";
		} else {
			var m = Math.floor(checkTime / 60);
			var s = checkTime % 60;
			if (s < 10) {
				s = "0" + s;
			}
			var time = m + ":" + s;
			document.getElementById("#countTime").innerHTML = time;
		}
		checkTime = checkTime - 1;
		setTimeout("fnTimeCheck()", 1000);
	} else {
		document.getElementById("#countTime").innerHTML = "0:00";
		alert("입력시간을  초과했습니다.");

	}
}

// 시작시 호출 함수
function fnOnload() {
	fnTimeCheck();
}