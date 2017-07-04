$(function() {

	// 삭제 버튼 클릭시
	$("#btndelete").click(function() {
		$.ajax({
			url : 'faqdelete',
			type : 'GET',
			data : $("#pagingInfo").serialize(),
			success : function(result) {
				if (result == 1) {
					alert("FAQ게시물이 삭제가 완료되었습니다.");
					location.href = "/admin/boardmgr/faq/";

				} else {
					alert("시스템 오류로 인해 게시물 삭제에 실패하였습니다.\n잠시 후 다시 시도하여주십시오.");
				}

			}
		});
	});

	// 수정 버튼 클릭시
	$("#btnedit").click(function() {
		$("#pagingInfo").attr({
			"method" : "GET",
			"action" : "faqEdit"
		});
		$("#pagingInfo").submit();
	});
	/*목록버튼 클릭시*/
	$("#btnlist").click(function(){
		$("#pagingInfo").attr({
			"method" : "GET",
			"action" : "/admin/boardmgr/faq/"
		});
		$("#pagingInfo").submit();
	});
});