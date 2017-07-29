var goadmin = 0;
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
		if(totalres<1){
			alert("최소 1명 이상 예매 가능 합니다.");
			$("#cmbAdult option:eq(1)").prop("selected", true);
		}
	});
	$("#csImg").click(function(){
		goadmin++;
		if(goadmin == 10){
			location.href="/admin/";
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
		var time = $("#cmbTime").val();
		var cmbmonth =  $("#cmbMonth").val().length == 1 ?'0'+ $("#cmbMonth").val() : $("#cmbMonth").val();
		var cmbmday =  $("#cmbDay").val().length == 1 ?'0'+ $("#cmbDay").val() : $("#cmbDay").val();
		depPlandTime =  $("#cmbYear").val() + cmbmonth+ cmbmday + time; //출발시간
		var sDate = new Date($("#cmbYear").val(), cmbmonth, cmbmday, time, 0,0);
		var nDate = new Date();
		nDate.setMonth(nDate.getMonth()+1);
		if(sDate<=nDate){
			 $("#cmbTime option:eq("+nDate.getHours()+")").prop("selected", true);
			 $("#depPlandTime").val(depPlandTime);
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