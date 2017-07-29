var curruntPage;//현재 페이지
var totalPage;	//총 페이지
var resList;	//예매 정보
var paging;		//페이징 정보
$(function(){
	getPage();
	/*마이페이지 버튼 클릭시*/
	$("#btnmypage").click(function(){
		$("#pagingInfo").attr({
			"method":"POST",
			"action":"/korail/user/page"
		});
		$("#pagingInfo").submit();
	});
	
	/*데이트피커 설정*/
	$( "#resdatepicker" ).datepicker({
		showOn: "button", 
		maxDate   : "0",
		minDate : "-15D",
		buttonImage: "/korail/resources/front/img/h_calendar.png", 
		buttonImageOnly: true,
		onSelect:function(dateText, inst){
			altField : '#getdate';
		var calyear = dateText.substr(6,4);
		var calmonth = dateText.substr(0,2)-1;
		var calday = dateText.substr(3,2)-1;
		initDate(calyear, calmonth, calday);
		}
	});
	
	/*데이트피커클릭시*/
	$('.ui-datepicker-trigger').click(function(){
		var calyear = $('#cmbYear').val();
		var calmonth = $('#cmbMonth').val();
		var calday = $('#cmbDay').val();
		var date = new Date(calyear, calmonth-1, calday, 0, 0, 0, 0);
		$("#resdatepicker").datepicker("setDate", date);
	});
	
	/*검색 버튼 클릭시*/
	$("#btnSearch").click(function(){
		$("#curruntPage").val(0);
		$("a.ppage1").html('');
		$("#keyWordType").val('');
		getPage();
	});
	
	/*검색 버튼 클릭시*/
	$("#btnAllSearch").click(function(){
		$("#curruntPage").val(0);
		$("a.ppage1").html('');
		$("#keyWordType").val('all');
		getPage();
	});
	curruntPage = Number($("#curruntPage").val());

});

/*예매 가능 날짜 여부 확인*/
function fn_resvDay(){
	var cbyear = $('#cmbYear option:selected').val();
    var cbmonth = $('#cmbMonth').val();
    var cbday = $('#cmbDay').val();
    var resdate = new Date(cbyear, cbmonth-1, cbday, 0, 0, 0, 0);
    var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth();
	var day = date.getDate();
	var dday = new Date(year, month, day, 0, 0, 0, 0);
    var minDate = new Date();
    minDate.setMonth(minDate.getDay()-15); //한달 후
    if(resdate.getTime() < minDate){
		alert("15일 이내 예매정보만 조회 가능합니다.");
		setDate();
	}else if(resdate > date){
		alert("당일 이후 예매정보는 조회 할 수 없습니다.");
		setDate();
	}
};
/*페이지 표시*/
function page(){
	$(".restbl").remove();
	if(resList.length == 0){
		var row = "<table class='restbl stbl'>";
            row += "<tr>";
            row += "<td>해당 날짜의 예매 내역이 존재하지 않습니다.</td>";
            row += "</tr>";
            row += "</table>";
        $(".tblwrap ").append(row);
        $(".pagingdiv").addClass("hide");
	}else{
		$.each(resList, function(resCnt, resVO){
			var depDate = paseDate(resVO.depPlandTime);
			var sysdate = new Date();
			var yyyy = sysdate.getFullYear();
			var mm = sysdate.getMonth()+1;
			var dd = sysdate.getDate();
			var nowDate = new Date(yyyy,mm,dd);
			var row = "";
	        row = "<table class='restbl stbl'>";
        	row += "<tbody >";
        	row += "<tr>";
        	row += "<td>승차일자</td>";
            row += "<td>열차번호</td>";
            row += "<td>열차종별</td>";
            row += "<td>출발역</td>";
            row += "<td>출발시각</td>";
            row += "<td>도착역</td>";
            row += "<td>도착시각</td>";
            row += "<td>상태</td>";
            row += "</tr>";
            row += "<tr>";
            row += "<td>";
    		row += 	    resVO.depPlandTime.substr(4,2) +"월 " + resVO.depPlandTime.substr(6,2) + "일"; 	
            row += "</td>";
            row += "<td>"+resVO.trainName+"</td>";
            row += "<td>"+resVO.vehiclekndNm+"</td>";
            row += "<td>"+resVO.depPlaceName+"</td>";
            row += "<td>";
            row += resVO.depPlandTime.substr(8,2) +"시 " + resVO.depPlandTime.substr(10,2) + "분";
        	row += "</td>";
        	row += "<td>"+resVO.arrPlaceName+"</td>";
        	row += "<td>";
			row += resVO.arrPlandTime.substr(8,2) +"시 " + resVO.arrPlandTime.substr(10,2) + "분";
    		row += "</td>";
    		row += "<td rowspan='3'>";
    		if(resVO.ticketingETC == '1'){
    			row +="환불";
    		}else if(resVO.ticketingETC == '2'){
    			row +="결재대기";
    			row += "<br/><br/>";
	    		row += "<button type='button' id='btnRes' class='ui-button ui-corner-all ui-widget'>";
	    		row += "결재";
	    		row += "</button>";
    		}else if(resVO.ticketingETC == '3'){
    			row += "탑승전";
    			row += "<br/><br/>";
	    		row += "<button type='button' class='ui-button ui-corner-all ui-widget' onclick=\"resChange('"+resVO.depPlaceName+"','"+resVO.arrPlaceName+"','"+resVO.depPlandTime+"','"+resVO.arrPlandTime+"','"+resVO.seatDivision+"','"+resVO.seat+"')\">";
	    		row += "예매취소";
	    		row += "</button>";
    		}else {
    			row += "만료";
    		}
    		row += "</td>";
            row += "</tr>";
            row += "<tr>";    
            row += "<td colspan='1'>객실등급</td>";
            row += "<td colspan='1'>예매매수</td>";
            row += "<td colspan='3'>좌석정보</td>";
            row += "<td colspan='1'>승객유형</td>";
            row += "<td colspan='1' class='txt_red'>총결제 금액</td>";
            row += "</tr>";
            row += "<tr>";
            row += "<td colspan='1'>" + resVO.seatDivision + "</td>";
            row += "<td colspan='1'>"+resVO.reservationNo+"</td>";
            row += "<td colspan='3'>" + resVO.trainNO + "호차 " + resVO.seat + "</td>";
            row += "<td colspan='1'>" + resVO.passengerType + "</td>";
            row += "<td colspan='1' class='txt_red'>" + numberWithCommas(resVO.rate) + "원</td>";
            row += "</tr>";
            row += "</tbody>";
            row += "</table>";
        $(".tblwrap ").append(row);
		});
		if($("a.ppage1").html()==""){
			$("a.ppage1").html(curruntPage + 1);
			$("a.ppage2").html(curruntPage + 2);
			$("a.ppage3").html(curruntPage + 3);
			$("a.ppage4").html(curruntPage + 4);
			$("a.ppage5").html(curruntPage + 5);
		}
	}
	for (var i = 1; i <= 5; i++) {
		if (Number($("a.ppage" + i + "").html()) == (curruntPage+1)) {
			$("a.ppage" + i + "").addClass("active");
		}else{
			$("a.ppage" + i + "").removeClass("active");
		}
	}
	$("body").scrollTop(0);
}

/*날짜 파싱*/
function paseDate(pDate){
	var pyear = pDate.substr(0,4);
	var pmonth = pDate.substr(4,2);
	var pday = pDate.substr(6,2);
	return new Date(pyear, pmonth, pday);
}

/*맨앞 클릭시*/
function pfirst(){
	$("a.ppage1").html(1);
	$("a.ppage2").html(2);
	$("a.ppage3").html(3);
	$("a.ppage4").html(4);
	$("a.ppage5").html(5);
	curruntPage = 0;
	setCurruntPage(curruntPage);
}
/*이전 버튼 클릭시*/
function ppriev(){
	if(Number($("a.ppage1").html())==1){
		return;
	}
	if(Number($("a.ppage1").html())-5>0){
		$("a.ppage1").html(Number($("a.ppage1").html())-5);
		$("a.ppage2").html(Number($("a.ppage2").html())-5);
		$("a.ppage3").html(Number($("a.ppage3").html())-5);
		$("a.ppage4").html(Number($("a.ppage4").html())-5);
		$("a.ppage5").html(Number($("a.ppage5").html())-5);
	}
	setCurruntPage(Number($("a.ppage1").html())-1);
}
/*번호 클릭시*/
function ppage(page){
	curruntPage = Number($(page).html()-1);
	setCurruntPage(curruntPage);
}
/*다음페이지 클릭시*/
function pnext(){
	if(Number($("a.ppage5").html())>totalPage){
		return;
	}
	if(Number($("a.ppage1").html())<totalPage){
		$("a.ppage1").html(Number($("a.ppage1").html())+5);
		$("a.ppage2").html(Number($("a.ppage2").html())+5);
		$("a.ppage3").html(Number($("a.ppage3").html())+5);
		$("a.ppage4").html(Number($("a.ppage4").html())+5);
		$("a.ppage5").html(Number($("a.ppage5").html())+5);
	}
	setCurruntPage(Number($("a.ppage1").html())-1);
}
/*마지막페이지 클릭시*/
function plast(){
	start = (totalPage % 5)-1;
	$("a.ppage1").html(totalPage - start);
	$("a.ppage2").html(totalPage - start + 1);
	$("a.ppage3").html(totalPage - start + 2);
	$("a.ppage4").html(totalPage - start + 3);
	$("a.ppage5").html(totalPage - start + 4);
	setCurruntPage(totalPage);
}

/*현재 페이지 저장*/
function setCurruntPage(page){
	if(0<=page && page <= totalPage){
		$("#curruntPage").val(page);
		getPage();
	}
	
}
/*페이지 비동기 통신*/
function getPage(){
	var cmbmonth =  $("#cmbMonth").val().length == 1 ?'0'+ $("#cmbMonth").val() : $("#cmbMonth").val();
	var cmbmday =  $("#cmbDay").val().length == 1 ?'0'+ $("#cmbDay").val() : $("#cmbDay").val();
	var ticketingDate = $("#cmbYear").val() + cmbmonth + cmbmday;
	$("#ticketingDate").val(ticketingDate);
	$.ajax({
		url:'reslist',
		type:'POST',
		data:$("#pagingInfo").serialize(),
		success:function(mapList){
			resList = mapList.ticketList;
			paging = mapList.paging;
			totalPage = paging.totalPage-1;
			curruntPage = paging.curruntPage;
			$("#curruntPage").val(curruntPage);
			$("#totalPage").val(totalPage);
			page();
		}
	});
}
/*숫자 콤마*/
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
/*예매 취소 버튼 클릭시*/
function resChange(depPlaceName,arrPlaceName,depPlandTime,arrPlandTime,seatDivision,seat){
	$("#depPlaceName").val(depPlaceName);
	$("#arrPlaceName").val(arrPlaceName);
	$("#arrPlandTime").val(arrPlandTime);
	$("#depPlandTime").val(depPlandTime);
	$("#seatDivision").val(seatDivision);
	$("#seat").val(seat);
	$.ajax({
		url : "/korail/reservation/cancelres",
		type : "POST",
		data : $("#resInfo").serialize(),
		success : function(resultData) {
			if(resultData == 1){
				alert("예매취소가 완료되었습니다.");
				getPage();
			}else{
				alert("시스템 오류로 인한 예매취소가 실패하였습니다.\n잠시 후 다시 시도하여주십시오.");
				getPage();
			}
		}
	});
};