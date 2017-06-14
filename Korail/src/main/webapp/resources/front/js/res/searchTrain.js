var ktxInfoList;
var ticketInfoList;
var ktxRateInfoList;
var totalPage;
var curruntPage;
var seatList;
$( function() {
	/*홈페이지에서 정보 조회 할 경우*/
	/*console.log(  $("#${resInfoList}"));
	alert( "${resInfoList}");
	if( '#${resInfoList}' != null){
		var resultData = '#${resInfoList}' ;
		alert(resultData.ktxInfoList);
		ktxInfoList = resultData.ktxInfoList;
		ticketInfoList = resultData.ticketInfoList;
		ktxRateInfoList = resultData.ktxRateInfoList;
		totalPage = resultData.pagingComponent.totalPage;
		setTrainInfo();
	}*/
	/*요금정보 팝업창*/
	$("#popSale").dialog({
        autoOpen:false, //자동으로 열리지않게
        modal:true, //모달대화상자
        resizable:false, //크기 조절 못하게
        height : 300,
        width : 800
    });
	/*좌석 선택 팝업창*/
	$("#popSeat").dialog({
        autoOpen:false, //자동으로 열리지않게
        modal:true, //모달대화상자
        resizable:false, //크기 조절 못하게
        height : 600,
        width : 800
    });

	$("#btnPrev").click(function(){
		curruntPage = Number($("#curruntPage").val());
		if(curruntPage >0){
			$("#curruntPage").val(curruntPage-1);
			getTrainInfo();
		}
	});
	$("#btnNext").click(function(){
		curruntPage = Number($("#curruntPage").val());

		
		if(curruntPage < totalPage-1){
			$("#curruntPage").val(Number($("#curruntPage").val())+1);
			getTrainInfo();
		}
	});
	$("#getTicketingInfo").click(function(){
		if($("#depPlaceName").val() == "" || $("#arrPlaceName").val() == ""){
			alert("출발지 혹은 도착지를 입력해 주십시오.");
			return;
		}
		if($("#depPlaceName").val() == $("#arrPlaceName").val()){
			alert("출발지와 도착지가 같습니다.");
			return;
		}
		$("#curruntPage").val(0);
		getTrainInfo();
	});
    var userType =['성인', '어린이', '경로'];
    for(i = 0; i<userType.length; i ++){
    	for(j = 0; j <=9; j++){
        	var option = $("<option value = '"+j+"'>"+userType[i]+" " +j+"명</option>");
        	switch (i) {
			case 0:
				$('#cmbAdult').append(option);
	            $("#cmbAdult option:eq(1)").prop("selected", true);
				break;
			case 1:
				if(j == 0){
					option = $("<option value = '"+j+"'>만 4세 ~ 12세</option>");
				}
				$('#cmbChilde').append(option);
				break;
			case 2:
				if(j == 0){
					option = $("<option value = '"+j+"'>만 65세 이상</option>");
				}
				$('#cmbSenior').append(option);
				break;
			}
            
        }
    }
});
/*운임요금조회버튼 클릭 시*/
function btnpopSale(){
	adultRate = numberWithCommas(ktxRateInfoList[0].adultRate);
	childRate = numberWithCommas(ktxRateInfoList[0].childRate);
	seniorRate = numberWithCommas(ktxRateInfoList[0].seniorRate);
	$(".tdsa").html(adultRate+"원");
	$(".tbsc").html(childRate+"원");
	$(".tdss").html(seniorRate+"원");
	adultRate = numberWithCommas(ktxRateInfoList[1].adultRate);
	childRate = numberWithCommas(ktxRateInfoList[1].childRate);
	seniorRate = numberWithCommas(ktxRateInfoList[1].seniorRate);
	$(".tdva").html(adultRate+"원");
	$(".tdvc").html(childRate+"원");
	$(".tdvs").html(seniorRate+"원");
	$("#popSale").dialog("open"); //다이얼로그창 오픈
};
/*숫자 콤마*/
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/*좌석 버튼 클릭 시*/
function btnstrain(trainType){
	$("ul.trainNo li").remove();
	for( var i = 1; i <= 18; i++ ){
		if(trainType == 1){
			//vip일경우
			if(2<= i && i <= 5){
				addli(i);
			}
		}else if(trainType == 0){
			//일반실일경우
			if(!(2<= i && i <= 5)){
				addli(i);
			}
		}
	}
	if(trainType == 1){
		//특실
		addSeat(trainType, seatList[1].seatRow, seatList[1].seatColumn);
		$("ul.trainNo li").addClass("vip");
	}else if(trainType == 0){
		//일반실
		addSeat(trainType, seatList[0].seatRow, seatList[0].seatColumn);
	}
	
	$("#popSeat").dialog("open");
}
/*열차 좌석*/
function addSeat(trainType, seatRow, seatColumn){
	$(".strain > tr").remove();
	for(var i= 1; i <=(Number(seatRow) + 1); i++){
	  var row = "<tr>";
	    
	  for(var j =1; j<=seatColumn; j++){
	    
	    
	    row+="<td>";
	    row+="<a href='#'>"
	    if((i == (seatRow/2)+1)){
	       if( j==1){
	        row += "서울";
	       }else if( j==seatColumn){
	        row += "서울";
	      }else{
	        row +='>';
	      }  
	    }else{
	      
	      if(seatColumn/2>=j){
	      row+="<p class = 'seat_left seat'>" + j + String.fromCharCode(64 + i) +"</p>";
	        row +='<img class ="ic_seat_left" src="/korail/resources/front/img/ic_seat_left.png" />';
	        }else{
	          row+="<p class = 'seat_right seat'>" + j + String.fromCharCode(64 + i) +"</p>";
	          row +='<img class ="ic_seat_right" src="/korail/resources/front/img/ic_seat_right.png" />';
	        }
	      
	       
	    }
	    row+="</a>";  
	    row+="</td>";
	  }
	  row +="</tr>";
	  $(".strain").append(row);
	}
	if(trainType == 1){
		/*vip*/
		  $("p.seat_left").addClass("vip_left");
		  $("p.seat_right").addClass("vip_right");
	  }else if(trainType == 0){
		  /*일반실*/
		  $("p.seat_left").addClass("standard_left");
		  $("p.seat_right").addClass("standard_right");
	  }
	 
}
/*열차 칸번호 출력*/
function addli(trainNo){
	var row = '<li>';
	row +="<a onclick='rtrain("+trainNo+")'>";
	row += trainNo + "호차</a>";
	row +="</li>";
	$("ul.trainNo").append(row);
}
/*열차 정보 조회 버튼 클릭시*/
function getTrainInfo(){
	$.ajax({
		url:"ajaxSearchTrain",
		type:"POST",
		dataType : 'json',
		data:$("#searchForm").serialize(),
	   success:function(resultData){
		   ktxInfoList = resultData.ktxInfoList;
		   ticketInfoList = resultData.ticketInfoList;
		   ktxRateInfoList = resultData.ktxRateInfoList;
		   totalPage = resultData.pagingComponent.totalPage;
		   seatList = resultData.seatList;
		   setTrainInfo();
	   }
	});
}
function setTrainInfo(){
	/**
	 * 여기 입력 되야 하는 값은 model로 넘어 오는 값을 출력해야한다.
	 * 궁금한점 내가 값을 가져오는데에 있어서 문제가 정보를 어떻게 유지하고 있을 것인가
	 * 지금 내가 하는거는 열차정보를 중간에 변경 했을 경우는 어떻게 되는가
	 * 코레일은 어떻게 진행되는가
	 * */
	/*테이블 초기화*/
	$("#tbl_Train tr:not(:first)").remove();
	if(ktxInfoList.length == 0){
		alert("조회된 정보가 없습니다.");
	    return;
	}
	$("#trainInfoWrap").addClass("traininfo");
	var ticketingNow = 0;
	if(ticketInfoList == null ){
		$.each(ticketInfoList, function(idx1, val) {
			var ticketingETC = Number(val.ticketingETC);
			if(ticketingETC == 2){
				ticketingNow++;
			}
		});
	}
	
	$.each(ktxInfoList, function(idx1, val) {
	    var row = '<tr>';
	    row += '<td>KTX'+val.trainName+'</td>';
	    row += '<td>'+(val.depPlaceName+'<br/>'+val.depPlandTime)+'</td>';
	    row += '<td>'+(val.arrPlaceName+'<br/>'+val.arrPlandTime)+'<br/></td>';
	    row += '<td><button type="button" class="ui-button ui-corner-all ui-widget" onclick="btnstrain(1)">조회</button></td>';
	    row += '<td><button type="button" class="ui-button ui-corner-all ui-widget" onclick="btnstrain(0)">조회</button></td>';
	    row += '<td>' +ticketingNow +'명</td>';
	    row += '<td><button type="button" class="ui-button ui-corner-all ui-widget" onclick="btnpopSale()">조회</button></td>';
	    row += '<td>'+ val.takeTime +'</tr>';
	    $("#tbl_Train tbody").append(row);
   });
	
	var curruntPage = Number($("#curruntPage").val());
	if(0< curruntPage && curruntPage <totalPage-1){
		$("#btnNext").addClass("btnnext");
		$("#btnPrev").addClass("btnprev");
	}else if(totalPage-1 == curruntPage){
		$("#btnNext").removeClass("btnnext");
		$("#btnPrev").addClass("btnprev");
	}else {
		$("#btnNext").addClass("btnnext");
		$("#btnPrev").removeClass("btnprev");
	}
	
	$("#tbl_Train").addClass("tInfo");
	
   

}