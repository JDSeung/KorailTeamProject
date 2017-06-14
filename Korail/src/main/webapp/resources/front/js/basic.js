$( function() { 
	$("#dialog").dialog({
        autoOpen:false, //자동으로 열리지않게
        modal:true, //모달대화상자
        resizable:false, //크기 조절 못하게
        height : 500,
        width : 590
    });
    
    /*데이트피커 설정*/
    $("#datepicker").button();
	$( "#datepicker" ).datepicker({
		showOn: "button", 
		maxDate   : "+30D",
		minDate : 0,
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
		$("#datepicker").datepicker("setDate", date);
	});

	/*인원정보*/
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
    
    /*시간 설정*/
    for(i = 0; i<24; i++){

    	if(i<=12){
    		var meridiem = '오전    ' + i;
    	}else{
    		var meridiem = '오후    ' + (i-12);
    	}
    	var option = $("<option value = '"+i+"'>"+i+"(  "+ meridiem +")</option>");
    	$('#cmbTime').append(option);
    }
    for(i = 0; i<3; i++){
    	var Now = new Date();
    	var year = Now.getFullYear() + i;
    	var option = $("<option value = '"+year+"'>"+year +"</option>");
    	$('#cmbYear').append(option);
    }
    for(i = 1; i<=12; i++){
    	var option = $("<option value = '"+i+"'>" + i + "</option>");
    	$('#cmbMonth').append(option);
    }
    for(i = 1; i<=31; i++){
    	var option = $("<option value = '"+i+"'>" + i + "</option>");
    	$('#cmbDay').append(option);
    }
    setDate();
}); 
/*날짜 추가*/
function fn_GetDay(){
	var day = 32 - new Date($('#cmbYear').val(), $('#cmbMonth').val()-1, 32).getDate();
	 for(i = 1; i<=day; i++){
	    	var option = $("<option value = '"+i+"'>" + i + "</option>");
	    	$('#cmbDay').append(option);
	    }
};
/*예매 가능 날짜 여부 확인*/
function fn_validateDay(){
	var cbyear = $('#cmbYear option:selected').val();
    var cbmonth = $('#cmbMonth').val();
    var cbday = $('#cmbDay').val();
    var resdate = new Date(cbyear, cbmonth-1, cbday, 0, 0, 0, 0);
    var date = new Date();
    var maxDate = new Date();
    maxDate.setMonth(maxDate.getMonth()+1); //한달 후
    if(resdate < date){
		alert("현재 일보다 이전 날은 예매 불가능 합니다.");
		setDate();
	}else if(resdate > maxDate){
		alert("1달이내 열차만 예매 가능 합니다.");
		setDate();
	}
};

/*날짜 가져오기*/
function setDate(){
    var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth();
	var day = date.getDate()-1;
	initDate(year, month, day);
}
/*날짜 cmb에 입력하기*/
function initDate(cbyear, cbmonth, cbday){
	$("#cmbYear option:eq('"+cbyear+"')").prop("selected", true);
	$("#cmbMonth option:eq('"+cbmonth+"')").prop("selected", true);
	$("#cmbDay option:eq('"+cbday+"')").prop("selected", true);
}
/*출발역 클릭시*/
function getDepStation(){
	$(".division").val("dep");
	dialogOpen()
}
/*도착역 클릭시*/
function getArrStation(){
	$(".division").val("arr");
	dialogOpen()
}
/*다이얼로그 창 오픈*/
function dialogOpen(){
	$("#dialog").dialog("open"); 
}
function putStation(name){
	if($(".division").val() =='dep'){
		$("#depPlaceName").val(name);
		$('#dialog').dialog('close');
	}else{
		
		$("#arrPlaceName").val(name);
		$('#dialog').dialog('close');
	}
	/*테이블 초기화*/
	if($("#tbl_Train").hasClass("tInfo") === true) {
		$("#tbl_Train").removeClass("tInfo")
		$("#tbl_Train tr:not(:first)").remove();
	}
}