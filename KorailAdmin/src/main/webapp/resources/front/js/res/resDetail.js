$(function(){
	$(".resCancel").click(function(){
		alert("정말 환불처리 하시겠습니까?");
		$.ajax({
			url:'resCancel',
			type:'POST',
			data:$("#pagingInfo").serialize(),
			success:function(resultData){
				if(resultData==1){
					alert("환불처리가 완료되었습니다.");
					location.href='/admin/res/?curruntPage='+$("#curruntPage").val()+'&totalPage='+$("#totalPage").val();
				}else{
					alert("환불 처리가 실패하였습니다.");
				}
			}
		});
	});
});