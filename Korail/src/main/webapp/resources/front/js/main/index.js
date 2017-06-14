$(function(){
	
	// 공지사항 테이블
	function addItem(){
		var table = document.getElementById("#noticeBoard");
		var rowlen = table.rows.length;

		tr = table.insertRow(row_index);
		td = tr.insertCell(0);
		td.innerHTML = ""
	}
	$("#getTicketingInfo").click(function(){
		if($("#depPlaceName").val() == "" || $("#arrPlaceName").val() == ""){
			alert("출발지 혹은 도착지를 입력해 주십시오.");
		}
		if($("#depPlaceName").val() == $("#arrPlaceName").val()){
			alert("출발지와 도착지가 같습니다.");
			return;
		}
		$("#searchForm").attr({
			"method":"POST",
			"action":"reservation/"
		});
		$("#searchForm").submit();
	});
})