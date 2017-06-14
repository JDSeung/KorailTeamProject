var keyValue;
/*
 * var regEmail =
 * /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
 * var emailAddr = $("#usermail").val();
 */
$(function() {
	$("#validationBtn2").click(function() {

		if ($("#usermail").val() == "" || $("#usermail").val() == null) {
			alert("E-Mail을 입력해주세요.")
		} else {
			$.ajax({
				url : "",
				type : "POST",
				data : $("#mailForm").serialize(),
				success : function(data) {
					keyValue = data;
					alert("인증번호 이메일이 발송되었습니다.");
				}
			});
			$("#key").attr("readonly", false);
			$("#revalidationBtn").attr("disabled", false);
			$("#okBtn").attr("disabled", false);
		}
	});
});

function check() {
	var authNum = keyValue.authNum;

	if ($("#key").val() != authNum) {
		alert("인증번호 가 틀렸습니다");
	}
	if ($("#key").val() == "" && $("#key").val() == null) {
		alert("인증번호를 입력해주세요.");
	}
	if ($("#key").val() == authNum) {
		form_submit();
	}
}
$(function() {
	$("#revalidationBtn").click(function() {
		$.ajax({
			url : "",
			type : "POST",
			data : $("#mailForm").serialize(),
			success : function(data) {
				keyValue = data;
				alert("인증번호 이메일이 재발송되었습니다.");
			}
		});
	});
});

function form_submit() {
	$('#mailForm').attr({
		"method" : "POST",
		'action' : 'agreement'
	});
	$('#mailForm').submit();
}
$(function() {
	$("#cencleBtn").click(function() {
		$("#maildialog").dialog("close"); // 다이얼로그창 오프
	});
});

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
