$( function() {
	var trainList;
	$("#getTicketingInfo").click(function(){
		$.ajax({
			url:"",
			type:"POST",
			dataType : 'json',
			data:$("#searchForm").serialize(),
			success:function(resultData){
				trainList = resultData;
				getTrainList(trainList);
			}
		});
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
} );
function getTrainList(trainList){
	$.each(trainList, function(idx, val) {
		console.log("열차번호 :" + val.trainName);
		console.log("출발역 :" + val.depPlaceName);
		console.log("도착역 :" + val.arrPlaceName);
		console.log("출발시각 :" + val.depPlandTime);
		console.log("도착시각 :" + val.arrPlandTime);
		console.log("소요시각 :" + val.takeTime);
	});
}