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
	/*목록버튼클릭시*/
	$("#btnlist").click(function(){
	   curruntPage = $("#curruntPage").val();
	   totalPage = $("#totalPage").val();
	   ispublic = $("#ispublic").val();
	   qnaNo = $("#qnaNo").val();
	   location.href="/korail/qnaboard/qnadetail?curruntPage="+curruntPage+"&qnaNo="+qnaNo+"";
	});
	/*수정버튼 클릭시.*/
	$("#btnedit").click(function(){
		$("#qnaContent").val(CKEDITOR.instances.qnaContent.getData());
		$("#pagingInfo").attr({
			"method" : "POST",
			"action" : "/korail/qnaboard/edit"
			
		});
		$("#pagingInfo").submit();
	});

});
