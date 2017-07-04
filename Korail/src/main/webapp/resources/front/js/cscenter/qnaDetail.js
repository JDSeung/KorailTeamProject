/*뒤로가기 버튼 클릭시 이전 목록으로 가기 위함*/
history.pushState(null, null, location.href);
window.onpopstate = function(event) {
	goList();
}

$(function(){
	if($(".qnaDetailtbl")){
		$("#dwrap").addClass("dwrap");
	}
	/*답변이 있을경우*/
	if($(".reply").html() != null){
		$(".qnaDetailWrap").addClass("qnareply");
	}
	/*목록버튼 클릭시*/
	$("#btnlist").click(function(){
		goList();
	});
	
	/*수정버튼 클릭시*/
	$("#btnedit").click(function(){
		$("#pagingInfo").attr({
			"method" : "GET",
			"action" : "/korail/qnaboard/qnaedit"
		});
		$("#pagingInfo").submit();
	});
	/*삭제버튼 클릭시*/
	$("#btndelete").click(function(){
		$.ajax({
			url:"qnadelete",
			type:"POST",
			data:$("#pagingInfo").serialize(),
		   success:function(resultData){
			   if(resultData == '1'){
				   alert("게시물이 삭제 되었습니다.");
				   curruntPage = $("#curruntPage").val();
				   location.href="/korail/qnaboard/?curruntPage="+curruntPage+"";
			   }
		   }
		});
	});
	
});
/*목록으로 가기*/
function goList(){
	$("#pagingInfo").attr({
		"method" : "GET",
		"action" : "/korail/qnaboard/"
	});
	$("#pagingInfo").submit();
}
