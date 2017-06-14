var ktxInfoList;
var ticketInfoList;
var ktxRateInfoList;
var totalPage;
var curruntPage;
$( function() {
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
} );
function getTrainInfo(){
	$.ajax({
		url:"",
		type:"POST",
		dataType : 'json',
		data:$("#searchForm").serialize(),
	   success:function(resultData){
				$("#tbl_Train tr:not(:first)").remove();
				ktxInfoList = resultData.ktxInfoList;
				ticketInfoList = resultData.ticketInfoList;
				ktxRateInfoList = resultData.ktxRateInfoList;
				totalPage = resultData.pagingComponent.totalPage;
				if(ktxInfoList.length == 0){
				    $("#tbl_Train").css('display','none');
					alert("조회된 정보가 없습니다.");
				    $("#btnNext").css('display','none');
				    $("#btnPrev").css('display','none');
				    return;
				}
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
				    row += '<td><button  class="ui-button ui-corner-all ui-widget" >조회</button></td>';
				    row += '<td><button  class="ui-button ui-corner-all ui-widget" >조회</button></td>';
				    row += '<td>' +ticketingNow +'명</td>';
				    row += '<td><button class="ui-button ui-corner-all ui-widget" >조회</button></td>';
				    row += '<td>'+ val.takeTime +'</tr>';
				    $("#tbl_Train tbody").append(row);
			   });
				
				var curruntPage = Number($("#curruntPage").val());
				if(0< curruntPage && curruntPage <totalPage-1){
					$("#btnNext").css('display','inline-block');
					$("#btnPrev").css('display','inline-block');
				}else if(totalPage-1 == curruntPage){
					$("#btnNext").css('display','none');
					$("#btnPrev").css('display','inline-block');
				}else {
					$("#btnNext").css('display','inline-block');
					$("#btnPrev").css('display','none');
				}
				$("#tbl_Train").css('display','block');
			   
		}
	});
}
