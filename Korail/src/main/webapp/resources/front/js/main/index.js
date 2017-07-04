$(function(){
	/*예매 인원 9명 이상일시 */
	$(".cmb").change(function(){
		var ano = Number($("#cmbAdult").val());
		var cno = Number($("#cmbChild").val());
		var sno = Number($("#cmbSenior").val());
		var totalres = ano + cno + sno;
		if(totalres >9){
			alert("최대 예매가능 인원은 9명입니다.");
			$("#cmbChild option:eq(0)").prop("selected", true);
			$("#cmbSenior option:eq(0)").prop("selected", true);
		}
	});
	/*뒤로가기 버튼 방지*/
	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
		//메인페이지 다시 리로드
		history.go(1); 
	}
	// 공지사항 테이블
	function addItem(){
		var table = document.getElementById("#noticeBoard");
		var rowlen = table.rows.length;

		tr = table.insertRow(row_index);
		td = tr.insertCell(0);
		td.innerHTML = "";
	}
	
	/*간편조회 버튼 클릭시*/
	$("#getTicketingInfo").click(function(){
		if($("#depPlaceName").val() == "" || $("#arrPlaceName").val() == ""){
			alert("출발지 혹은 도착지를 입력해 주십시오.");
			return;
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
});
function enotice(noticeNO){
	location.href = "/korail/noticeboard/noticedetail?curruntPage=0&totalPage=0&noticeNO="+noticeNO+"";
}