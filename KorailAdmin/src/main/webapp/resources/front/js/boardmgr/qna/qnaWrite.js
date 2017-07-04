var now = new Date();
var year= now.getFullYear();
var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
var chan_val = year + '년 ' + mon + '월 ' + day + '일 ';
$(function(){
	CKEDITOR.replace( 'qnaContent', {//해당 이름으로 된 textarea에 에디터를 적용
		resize_enabled: false,
		width:"98%",
		height:"95%",
		resize : false
    });
	$(".c4").html(chan_val);
	/*취소버튼 클릭시.*/
	$("#btnCancel").click(function(){
		console.log($("#curruntPage").val());
		location.href="/admin/boardmgr/qna/?curruntPage="+$("#curruntPage").val();
	});
	/*작성 버튼 클릭시.*/
	$("#btnWrite").click(function(){
		console.log($("#file"));
		console.log($("#file").val());
		
		$("#qnaContent").val(CKEDITOR.instances.qnaContent.getData());
		/*입력하지 않은 항목 체크*/
		if($("#qnaTitle").val() == '' ||$("#qnaTitle").val() == null){
			alert("제목은 필수 입력 항목입니다.");
			return;
		}
		if($("#qnaContent").val() == '' ||$("#qnaContent").val() == null){
			alert("내용은 필수 입력 항목입니다.");
			return;
		}
		var formData = new FormData($("#pagingInfo")[0]);
		$.ajax({
			url:'write',
			type:'POST',
			data:formData,
			processData : false,
            contentType : false,
			success:function(result){
				if(result == 1){
					alert("QNA 답글이 작성되었습니다.");
					location.href="/admin/boardmgr/qna/";
				}
			}
		});
		
	});

});