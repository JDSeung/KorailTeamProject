$(function() {
	CKEDITOR.replace('faqContent', {// 해당 이름으로 된 textarea에 에디터를 적용
		width : "98%",
		height : "95%",
		resize_enabled : false
	});

	/* 취소버튼클릭시 */
	$("#btnlist").click(
			function() {
				curruntPage = $("#curruntPage").val();
				totalPage = $("#totalPage").val();
				ispublic = $("#ispublic").val();
				faqNo = $("#faqNo").val();
				location.href = "/admin/boardmgr/faq/faqdetail?curruntPage="
						+ curruntPage + "&faqNo=" + faqNo + "";
			});
	/* 수정버튼 클릭시. */
	$("#btnedit").click(function() {
		$("#faqContent").val(CKEDITOR.instances.faqContent.getData());
		$.ajax({
			url : 'edit',
			type : 'GET',
			data : $("#pagingInfo").serialize(),
			success : function(result) {
				if (result == 1) {
					alert("FAQ게시물이 수정되었습니다.");
					location.href = "/admin/boardmgr/faq/";

				} else {
					alert("시스템 오류로 인해 게시물 수정에 실패하였습니다.\n잠시 후 다시 시도하여주십시오.");
				}

			}
		});
	});

});
