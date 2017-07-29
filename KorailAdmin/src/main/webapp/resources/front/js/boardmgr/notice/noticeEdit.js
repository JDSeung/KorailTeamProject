$(function() {
	CKEDITOR.replace('noticeContent', {// 해당 이름으로 된 textarea에 에디터를 적용
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
				noticeNO = $("#noticeNO").val();
				location.href = "/admin/boardmgr/notice/noticedetail?curruntPage="
						+ curruntPage + "&noticeNO=" + noticeNO + "";
			});
	/* 수정버튼 클릭시. */
	$("#btnedit").click(function() {
		$("#noticeContent").val(CKEDITOR.instances.noticeContent.getData());
		var formData = new FormData($("#pagingInfo")[0]);
		$.ajax({
			url:'edit',
			type:'POST',
			data:formData,
			processData : false,
            contentType : false,
			success : function(result) {
				if (result == 1) {
					alert("공지사항이 수정되었습니다.");
					location.href = "/admin/boardmgr/notice/";

				} else {
					alert("시스템 오류로 인해 게시물 수정에 실패하였습니다.\n잠시 후 다시 시도하여주십시오.");
				}

			}
		});
	});

});
