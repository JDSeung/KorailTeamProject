$(function(){
	/*답변 버튼 클릭시*/
	$("#swrite").click(function(){
		$("#curruntPage").val(0);
		$("#pagingInfo").attr({
			"method" : "GET",
			"action" : "qnawrite"
		});
		$("#pagingInfo").submit();
	});
	/*삭제버튼 클릭시*/
	$("#btnDelete").click(function(){
		$.ajax({
			url:'delete',
			type:'GET',
			data:$("#pagingInfo").serialize(),
			success:function(result){
				if(result == 1){
					alert("QnA게시물이 삭제 되었습니다.");
					location.href="/admin/boardmgr/qna/";
				}else{
					alert("시스템 오류로 인해 게시물 삭제에 실패하였습니다.\n잠시 후 다시 시도하여주십시오.");
				}
			}
		});
	})
	;
	/*수정버튼 클릭시*/
	$("#btnEdit").click(function(){
		$("#curruntPage").val(0);
		$("#pagingInfo").attr({
			"method" : "GET",
			"action" : "qnaEdit"
		});
		$("#pagingInfo").submit();
	});
	
	/*목록버튼 클릭시*/
	$("#btnlist").click(function(){
		$("#pagingInfo").attr({
			"method" : "GET",
			"action" : "/admin/boardmgr/qna/"
		});
		$("#pagingInfo").submit();
	});
});