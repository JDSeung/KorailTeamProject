$(function(){
	// 출발역 텍스트박스를 클릭 했을 경우
	$("#depPlaceName").on("click", function(){
		$(".division").val("dep");
			$("#dialog").dialog("open");
	});
	// 도착역 텍스트박스를 클릭 했을 경우
	$("#arrPlaceName").on("click", function(){
		$(".division").val("arr");
			$("#dialog").dialog("open");
	});
	
	// 공지사항 테이블
	function addItem(){
		var table = document.getElementById("#noticeBoard");
		var rowlen = table.rows.length;

		tr = table.insertRow(row_index);
		td = tr.insertCell(0);
		td.innerHTML = ""
	}
})