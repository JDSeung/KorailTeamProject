$(function() {
	// 전체선택 체크박스 클릭
	$("#allChk").click(function() {
		// 만약 전체 선택 체크박스가 체크된상태일경우
		if ($("#allChk").prop("checked")) {
			// 해당화면에 전체 checkbox들을 체크해준다
			$("input[type=checkbox]").prop("checked", true);
			// 전체선택 체크박스가 해제된 경우
		} else {
			// 해당화면에 모든 checkbox들의 체크를해제시킨다.
			$("input[type=checkbox]").prop("checked", false);
		}
	});
});

$(function() {
	$("#okBtn")
			.click(
					function() {
						if ($("input:checkbox[name=chk1]").is(":checked") == true
								&& $("input:checkbox[name=chk2]")
										.is(":checked") == true) {
							$('#goEnterinfo').attr({
								"method" : "POST",
								'action' : 'enterInfo'
							});
							$('#goEnterinfo').submit();
						} else {
							alert("이용약관 및 개인정보 수집에 동의 하셔야 합니다.");
							return false;
						}
					})
});