$(function(){
	CKEDITOR.replace( 'qnaContent', {//해당 이름으로 된 textarea에 에디터를 적용
		width:"98%",
		height:"95%",
		resize_enabled: false
    });
	/* 이미지 출력 
	var img = document.createElement("img");
	var priview = document.getElementById('imgarea');
	img.id = "prev_" + priview;
	img.style.width = '300px';
	img.style.height = '300px';
	priview.appendChild(img);
	$(img).attr({
		'src':"/korail/resources/upload/" + $("#imgView").html() +""
	});*/
	
	/*취소버튼클릭시*/
	$("#btnCancel").click(function(){
	   curruntPage = $("#curruntPage").val();
	   totalPage = $("#totalPage").val();
	   ispublic = $("#ispublic").val();
	   qnaNo = $("#qnaNo").val();
	   location.href="/admin/boardmgr/qna/qnadetail?curruntPage="+curruntPage+"&qnaNo="+qnaNo+"";
	});
	
	/*수정버튼 클릭시.*/
	$("#btnEdit").click(function(){
		$("#qnaContent").val(CKEDITOR.instances.qnaContent.getData());
		$.ajax({
			url:'edit',
			type:'GET',
			data:$("#pagingInfo").serialize(),
			success:function(result){
				if(result == 1){
					alert("QnA게시물이 수정 되었습니다.");
					location.href="/admin/boardmgr/qna/";
				}else{
					alert("시스템 오류로 인해 게시물 수정에 실패하였습니다.\n잠시 후 다시 시도하여주십시오.");
				}
			}
		});
	});
});
