var ktxInfoList;
var ticketInfoList;
var ktxRateInfoList;
var totalPage;		//전체 페이지
var curruntPage;	//현재 페이지
var seatList;		//좌석 정보
var seatRow;		//좌석 반복문 행 개수		
var seatColumn = 0;	//좌석 반복문용 열개수
var seatCnt = 0;	//선택좌석 만큼만 선택가능
var tType;		//vip, 일반실 구분
var seatInfo = new Array();//선택좌석
var rate;		// 운임요금
var vRate = new Array();		// vip운임요금
var sRate = new Array();		// 일반실운임요금
var trainName;	 //열차번호
var trainNo; //열차호수
var depPlaceName; //출발역
var depPlandTime; //출발시간
var arrPlaceName; //도착역
var arrPlandTime; //도착시간
var selectSeat; //예매매수
var passengerType;
var adultNo;
var childNo;
var seniorNo;
var l_seatOn = "/korail/resources/front/img/ic_seat_on_left.png";
var r_seatOn = "/korail/resources/front/img/ic_seat_on_right.png";
var l_seat = "/korail/resources/front/img/ic_seat_left.png";
var r_seat = "/korail/resources/front/img/ic_seat_right.png";
var l_seatOff = "/korail/resources/front/img/ic_seat_off_left.png";
var r_seatOff = "/korail/resources/front/img/ic_seat_off_right.png";
var scnt = 0;
/*앞으로가기 방지*/
history.pushState(null, null, location.href);
$( function() {
	/*인원 수 변경 될 때*/
	$(".cmb").change(function(){
		/*테이블 초기화*/
		if($("#tbl_Train").hasClass("tInfo") === true) {
			$("#tbl_Train").removeClass("tInfo")
			$("#tbl_Train tr:not(:first)").remove();
			$("#btnNext").removeClass("btnnext");
			$("#btnPrev").removeClass("btnprev");
			seatInfo.splice(0);
			seatCnt = 0;
		}
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
	/*홈페이지에서 정보 조회 할 경우*/
	if( $("#hdepPlaceName").val() != ''){
		$("#depPlaceName").val($("#hdepPlaceName").val());
		$("#arrPlaceName").val($("#harrPlaceName").val());
		$("#depPlandTime").val($("#hdepPlandTime").val());
		$("#cmbAdult option:eq("+$("#hcmbAdult").val()+")").prop("selected", true);
		$("#cmbChild option:eq("+$("#hcmbChild").val()+")").prop("selected", true);
		$("#cmbSenior option:eq("+$("#hcmbSenior").val()+")").prop("selected", true);
		$("#cmbYear option:eq("+$("#hcmbYear").val()+")").prop("selected", true);
		$("#cmbMonth option:eq("+($("#hcmbMonth").val()-1)+")").prop("selected", true);
		$("#cmbDay option:eq("+($("#hcmbDay").val()-1)+")").prop("selected", true);
		$("#cmbTime option:eq("+$("#hcmbTime").val()+")").prop("selected", true);
		$("#curruntPage").val(0);
		getTrainInfo();
	}
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
	/*이전버튼 클릭시*/
	$("#btnPrev").click(function(){
		curruntPage = Number($("#curruntPage").val());
		if(curruntPage >0){
			$("#curruntPage").val(curruntPage-1);
			getTrainInfo();
		}
	});
	/*다음 버튼클릭시*/
	$("#btnNext").click(function(){
		curruntPage = Number($("#curruntPage").val());
		if(curruntPage < totalPage-1){
			$("#curruntPage").val(Number($("#curruntPage").val())+1);
			getTrainInfo();
		}
	});
	
	/*기차 정보 조회*/
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
		console.log(sDate<=nDate);
		if(sDate<=nDate){
			 $("#cmbTime option:eq("+nDate.getHours()+")").prop("selected", true);
		}
		$("#curruntPage").val(0);
		getTrainInfo();
	});
	
	/*선택 좌석 예약 버튼 클릭시 예약페이지 이동*/
    $("#btnRes").click(function(){
    	tType = tType==1?'특실':'일반';
    	if(seatCnt != selectSeat){
    		//선택좌석과 예매매수가 같지 않을 경우
    		alert("요청하신 승객수와 선택하신 좌석수가 일치하지 않습니다.");
    		return;
    	}
    	$("#strainName").val(trainName); 		//차량번호
    	$("#strainNo").val(trainNo); 			//선택한 열차 호수
		$("#hdepPlaceName").val(depPlaceName); 	//출발역
		$("#sdepPlandTime").val(depPlandTime); 	//출발시간
		$("#harrPlaceName").val(arrPlaceName); 	//도착역
		$("#sarrPlandTime").val(arrPlandTime); 	//도착시간
		$("#sreservationNo").val(seatCnt); 		//예매매수
		$("#srate").val(rate);				// 운임요금
		$("#sseatDivision").val(tType);			//좌석등급
		$("#sseat").val(seatInfo); 				//선택좌석
		$("#spassengerType").val(passengerType); //승객유형
    	$.ajax({
    		url:"resSearch",
    		type:"POST",
    		data:$("#resInfoForm").serialize(),
    	   success:function(resultData){
    		   if(resultData == 1){
    			   alert("예약 중인 좌석입니다. 다시 예약을 진행 부탁드립니다.");
    			   location.reload();
    		   }else if(resultData == 0){
    			   $("#resInfoForm").attr({
    					"method":"POST",
    					"action":"resinfo"
    				});
    				$("#resInfoForm").submit();
    		   }else{
    			   location.href='/korail/login/';
    		   }
    	   }
    	});
		
    });
    
});

/*운임요금조회버튼 클릭 시*/
function btnpopSale(){
	var adultRate = numberWithCommas(ktxRateInfoList[0].adultRate);
	var childRate = numberWithCommas(ktxRateInfoList[0].childRate);
	var seniorRate = numberWithCommas(ktxRateInfoList[0].seniorRate);
	$(".tdsa").html(adultRate+"원");
	$(".tbsc").html(childRate+"원");
	$(".tdss").html(seniorRate+"원");
	vRate.push(adultRate);
	vRate.push(childRate);
	vRate.push(seniorRate);
	adultRate = numberWithCommas(ktxRateInfoList[1].adultRate);
	childRate = numberWithCommas(ktxRateInfoList[1].childRate);
	seniorRate = numberWithCommas(ktxRateInfoList[1].seniorRate);
	$(".tdva").html(adultRate+"원");
	$(".tdvc").html(childRate+"원");
	$(".tdvs").html(seniorRate+"원");
	sRate.push(adultRate);
	sRate.push(childRate);
	sRate.push(seniorRate);
	$("#popSale").dialog("open"); //다이얼로그창 오픈
};

/*숫자 콤마*/
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/*좌석 버튼 클릭 시 해당 열차 정보 저장*/
function setTrain(tName){
	trainInfo = $(tName).closest("tr");
	trainName = trainInfo.find(".trainName").text().split(" ")[1];//열차번호
	depPlaceName = trainInfo.find(".depPlaceInfo").text().split(' ')[0]; //출발역
	var strtime = trainInfo.find(".depPlaceInfo").text().split(' ')[1];
	var time = onlyNumber(strtime);
	var cmbmonth =  $("#cmbMonth").val().length == 1 ?'0'+ $("#cmbMonth").val() : $("#cmbMonth").val();
	var cmbmday =  $("#cmbDay").val().length == 1 ?'0'+ $("#cmbDay").val() : $("#cmbDay").val();
	depPlandTime =  $("#cmbYear").val() + cmbmonth+ cmbmday + time; //출발시간
	arrPlaceName = trainInfo.find(".arrPlaceInfo").text().split(' ')[0] ;//도착역
	strtime = trainInfo.find(".arrPlaceInfo").text().split(' ')[1];
	time = onlyNumber(strtime);
	arrPlandTime =  $("#cmbYear").val() + cmbmonth+ cmbmday + time;//도착시간
}

/*숫자만 추출*/
function onlyNumber(str){
    var res;
    res = str.replace(/[^0-9]/g,"");
    return res;
}

/*좌석 버튼 클릭 시 selectSeat에 좌석 그리기*/
function btnstrain(trainType){
	tType = trainType;
	$("ul.trainNo li").remove();
	for( var i = 1; i <= 18; i++ ){
		if(trainType == 1){
			//vip일경우
			if(2<= i && i <= 5){
				if(trainNo == null){
					trainNo = i
				}
				addli(tType, i);
			}
		}else if(trainType == 0){
			//일반실일경우
			if(trainNo == null){
				trainNo = i
			}
			if(!(2<= i && i <= 5)){
				addli(tType, i);
			}
		}
	}
	if(trainType == 1){
		//특실
		seatRow = seatList[1].seatRow;
		seatColumn = seatList[1].seatColumn;
 		addSeat(tType, seatRow, seatColumn);
		$("ul.trainNo li").addClass("vip");
	}else if(trainType == 0){
		//일반실
		seatRow = seatList[0].seatRow;
		seatColumn = seatList[0].seatColumn;
		addSeat(tType, seatRow, seatColumn);
	}
	
	$("#popSeat").dialog("open");
	/*좌석선택 종료시*/
	$("#popSeat").dialog({
		beforeClose: function(event, ui) {
			seatInfo.splice(0);
			seatCnt = 0;
			trainNo = null;
		}
	});
}

/*열차 좌석*/
function addSeat(tType, seatRow, seatColumn){
	$(".strain > tr").remove();
	var tseat = new Array();
	var seatImg;
	gType = tType == 0? '일반':'특실';
	$.each(ticketInfoList, function(ticketingCnt, ticketingVO) {
		  if(ticketingVO.trainNO == trainNo && ticketingVO.trainName == trainName && ticketingVO.depPlandTime == depPlandTime && gType == ticketingVO.seatDivision){
			  seat = ticketingVO.seat.split(',');
			  tseat = tseat.concat(seat);
		  }
	});
	  console.log(tseat);
	for(var i= 1; i <=(Number(seatRow) + 1); i++){
	  var row = "<tr>";
	    
	  for(var j =1; j<=seatColumn; j++){
	    
	    var seatNo = j + String.fromCharCode(64 + i);
	    row+="<td>";
	    row+="<a>"
	    if(i == (Math.ceil(seatRow/2)+1)){
	       if( j==1){
	        row += $("#depPlaceName").val();
	       }else if( j==seatColumn){
	        row += $("#arrPlaceName").val();
	      }else{
	        row +='>';
	      }  
	    }else{
	      if((seatColumn/2)>=j){
	    	  console.log(tseat);
	    	  seatImg = getImgColor(tseat, seatNo, 'l');
	    	  console.log(seatNo + ' , ' + seatImg);
	    	  row+="<p class = 'seat_left seat' onclick='seatOn(this,"+seatColumn+")'>" + seatNo +"</p>";
	    	  row +='<img id="'+seatNo+'" class ="ic_seat_left" onclick="seatOn(this,'+seatColumn+')" class='+ seatNo  +' src='+seatImg+' />';
	        }else{
	        	seatImg = getImgColor(tseat, seatNo, 'r');
	          row+="<p class = 'seat_right seat' onclick='seatOn(this,"+seatColumn+")'>" + seatNo +"</p>";
	          row +='<img id="'+seatNo+'" class ="ic_seat_right" onclick="seatOn(this,'+seatColumn+')" class='+ seatNo  +' src='+seatImg+' />';
	        }
	    }
	    row+="</a>";  
	    row+="</td>";
	  }
	  row +="</tr>";
	  $(".strain").append(row);
	}
	if(tType == 1){
		/*vip*/
		  $("p.seat_left").addClass("vip_left");
		  $("p.seat_right").addClass("vip_right");
	  }else if(tType == 0){
		  /*일반실*/
		  $("p.seat_left").addClass("standard_left");
		  $("p.seat_right").addClass("standard_right");
	  }
	 
}

/*의자 색 구분*/
function getImgColor(tseat, seatNo, stype){
	var simg;
	$.each(tseat, function(scnt, sno){
		if(sno == seatNo  && stype == 'l'){
			simg = l_seatOff;
		}else if(sno == seatNo  && stype == 'r'){
			simg = r_seatOff;
		}	
	});
	if(simg == null && stype == 'l'){
		simg = l_seat;
	}else if(simg == null && stype == 'r'){
		simg = r_seat;
	}
	return simg;
}

/*열차 칸번호 출력*/
function addli(tType, trainNo){
	var row = '<li>';
	row +="<a onclick='rtrain(this,"+tType+","+trainNo+")'>";
	$("ul.trainNo li:first-child a").addClass("sseat");
	row += trainNo + "호차</a>";
	row +="</li>";
	$("ul.trainNo").append(row);
}

/*열차 번호 클릭 했을 때*/
function rtrain(tn,tType, tNo){
	seatCnt = 0;
	seatInfo = new Array();
	$("ul.trainNo li a").removeClass("sseat");
	$(tn).addClass("sseat");
	trainNo = tNo;
	addSeat(tType, seatRow, seatColumn);
}

/*열차 정보 조회 버튼 클릭시*/
function getTrainInfo(){
	if($("#tbl_Train")){
		$("#wrap").addClass("swrap");
		$("#wrap").removeClass("wrap");
	}
	/*인원 조회*/
	adultNo = Number($("#cmbAdult").val());
	childNo = Number($("#cmbChild").val());
	seniorNo = Number($("#cmbSenior").val());
	var adultInfo = adultNo>=1?"어른 " + adultNo + "명 ":"";
	var childInfo = childNo>=1?"어린이" + childNo + "명 ":"";
	var seniorInfo = seniorNo>=1?"경로 " + seniorNo + "명 ":"";
	passengerType = adultInfo + childInfo + seniorInfo;
	$.ajax({
		url:"ajaxSearchTrain",
		type:"POST",
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

/*좌석 선택*/
function seatOn(seatNo, seatColumn){
	var seatId = $(seatNo).closest("td").find("img")[0].id;
	var seatImg = $(seatNo).closest("td").find("img")[0];
	var seat = 0;
	if(seatId.length == 2){
		seat = Number(seatId.substr(0,1));
	}else{
		seat = Number(seatId.substr(0,2));
	}
	selectSeat = Number($("#cmbAdult").val()) + Number($("#cmbChild").val()) + Number($("#cmbSenior").val());
	var baselength = seatImg.baseURI.length-2;
	var imgsrc = seatImg.src;
	var imglength = imgsrc.length;
	var totallength = imglength-baselength;
	var rimg = imgsrc.substr(baselength, totallength);
	rimg = '/korail/resources/' + rimg;
	if(seat <= (seatColumn/2)){
		if(rimg == l_seatOff){
			alert("이미 예약된 좌석입니다.");
			return;
		}
		if(rimg == l_seatOn){
			seatImg.src = l_seat;
			seatInfo.splice(seatInfo.indexOf(seatId),1);
			seatCnt--;
		}
		else if(seatCnt < selectSeat){
			seatImg.src = l_seatOn;
			seatCnt++;
			seatInfo.push(seatId);
		}else{
			alert("요청하신 승객수를 초과하여 좌석을 선택할 수 없습니다.");
		}
	}else{
		if(rimg == r_seatOff){
			alert("이미 예약된 좌석입니다.");
			return;
		}
		if(rimg == r_seatOn){
			seatImg.src = r_seat;
			seatCnt--;
			seatInfo.splice(seatInfo.indexOf(seatId),1);
		}
		else if(seatCnt < selectSeat){
			
			seatImg.src = r_seatOn;
			seatCnt++;
			seatInfo.push(seatId);
		}else{
			alert("요청하신 승객수를 초과하여 좌석을 선택할 수 없습니다.");
		}
	}
}

/*테이블초기화*/
function setTrainInfo(){
	/*테이블 초기화*/
	$("#tbl_Train tr:not(:first)").remove();
	if(ktxInfoList.length == 0){
		tType = null;
		$("#tbl_Train").removeClass("tInfo");
		$("#btnNext").removeClass("btnnext");
		$("#btnPrev").removeClass("btnprev");
		alert("조회된 정보가 없습니다.");
		$("#wrap").addClass("wrap");
		$("#wrap").removeClass("swrap");
	    return;
	}
	$("#trainInfoWrap").addClass("traininfo");
 	$.each(ktxInfoList, function(listCnt, trainVO) {
 		var ticketingNow = 0;
 		if(ticketInfoList != null ){
 			$.each(ticketInfoList, function(ticketingCnt, ticketingVO) {
 				var ticketingETC = Number(ticketingVO.ticketingETC);
 				var depTime = ticketingVO.depPlandTime;
 				var depTime = depTime.substr(8,2)+"시"+depTime.substr(10,2)+"분";
				if(ticketingVO.ticketingETC == 2 && ( depTime == trainVO.depPlandTime)){
 					ticketingNow++;
 				}
 			});
 		}
 		var trainInfo = new Array();
 		trainInfo.push("a");
 	    var row = '<tr>';
	    row += '<td class="trainName">KTX <br/>'+trainVO.trainName+'</td>';
	    row += '<td class="depPlaceInfo">'+(trainVO.depPlaceName+'<br/> '+trainVO.depPlandTime)+'</td>';
	    row += '<td class="arrPlaceInfo">'+(trainVO.arrPlaceName+'<br/> '+trainVO.arrPlandTime)+'<br/></td>';
	    row += '<td class="vseat"><button type="button" class="sselect ui-button ui-corner-all ui-widget" onclick="setTrain(this);btnstrain(1);calcRate(1);">좌석선택</button></td>';
	    row += '<td class="sseat"><button type="button" class="sselect ui-button ui-corner-all ui-widget" onclick="setTrain(this);btnstrain(0);calcRate(0);">좌석선택</button></td>';
	    row += '<td class="resPerson">' +ticketingNow +'명</td>';
	    row += '<td class="rate"><button type="button" class="ui-button ui-corner-all ui-widget" onclick="btnpopSale()">조회</button></td>';
	    row += '<td class="takeTime">'+ trainVO.takeTime +'</tr>';
	    $("#tbl_Train tbody").append(row);
	});
	
	var curruntPage = Number($("#curruntPage").val());
	if(0< curruntPage && curruntPage <totalPage-1){
		$("#btnNext").addClass("btnnext");
		$("#btnPrev").addClass("btnprev");
	}else if(totalPage-1 == curruntPage && totalPage != 1){
		$("#btnNext").removeClass("btnnext");
		$("#btnPrev").addClass("btnprev");
	}else if(totalPage != 1){
		$("#btnNext").addClass("btnnext");
		$("#btnPrev").removeClass("btnprev");
	}
	
	$("#tbl_Train").addClass("tInfo");
}


/*요금 계산*/
function calcRate(trainType){
	var adultRate = Number(ktxRateInfoList[trainType].adultRate);
	var childRate = Number(ktxRateInfoList[trainType].childRate);
	var seniorRate = Number(ktxRateInfoList[trainType].seniorRate);
	rate = (adultNo * adultRate) + (childNo * childRate) + (seniorNo * seniorRate);
}
