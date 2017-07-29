var startTime;
var endTime;
var runningTime;
var trainList;
var insertDBCnt;
$(function(){
	/*요금정보 팝업창*/
	$("#progress").dialog({
        autoOpen:false, //자동으로 열리지않게
        modal:true, //모달대화상자
        resizable:false, //크기 조절 못하게
        height : 100,
        width : 400
    });
	
	/* 배치 버튼 클릭시 처리 */
	$("#insertdata").click(function(){
		$.ajax({
			url : "insert",
			type : "POST",
			data : $("#insertform").serialize(),
			success : function(batchMap) {
				if (batchMap != null) {
					alert("배치 작업을 완료하였습니다.");
					startTime = batchMap.startTime;
					endTime = batchMap.endTime;	
					runningTime = batchMap.runningTime;
					trainList = batchMap.trainList;
					insertDBCnt = batchMap.insertDBCnt;
					batchResult();
				} else {
					batchResult();
				}
			},
			beforeSend : function(){
		        // 로딩이미지의 위치 및 크기조절
				$("#progress").dialog("open");
		    },
		    complete : function(){
		    	$("#progress").dialog("close");
		    }
		});
		
	});
});
function batchResult(){
	var row ='';
	row += '<h3>배치 항목</h3>';
	row += '<p>';
	row += '시작시간 : ' + startTime;
	row += '</p>';
	row += '<p>';
	row += '종료시간 : ' + endTime;
	row += '</p>';
	row += '<p>';
	row += '소요시간 : ' + runningTime;
	row += '</p>';
	row += '<p>';
	row += '이전 완료 데이터 : ' + insertDBCnt;
	row += '</p>';
	$(".batchwrap").append(row);
	row ='';
	row += '<table class="dbData">';
	row += '<tr>';
		row += '<th>';
			row += '출발역';
		row += '</th>';
		row += '<th>';
			row += '출발시각';
		row += '</th>';
		row += '<th>';
			row += '도착역';
		row += '</th>';
		row += '<th>';
			row += '도착시각';
		row += '</th>';
		row += '<th>';
			row += '소요시간';
		row += '</th>';
	row += '</tr>';
	row += '<tbody>';
	
	if(trainList == null){
		row += '<tr>';
		alert("배치 작업에 실패하였습니다.");
		row +='배치 작업 실패 자세한 사항은 Log를 확인 해야합니다.';
		row += '</tr>';
	}
	row += '</tbody>';
	row += '</table>';
	$(".batchwrap").append(row);
	row = '';
	$.each(trainList, function(trainCnt, trainVO) {
 	   	row += '<tr>';
	    row += '<td>'+trainVO.depplaceName+'</td>';
	    row += '<td>'+trainVO.depplandTime+'</td>';
	    row += '<td>'+trainVO.arrplaceName+'</td>';
	    row += '<td>'+trainVO.arrplandTime+'</td>';
	    row += '<td>'+trainVO.takeTime+'</td>';	   
	    row += '</tr>';
	});
	$(".dbData tbody").append(row);

}