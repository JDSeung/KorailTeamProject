$( function() {
  
    $( "#datepicker" ).datepicker({
    	showOn: "button", 
    	maxDate   : "+180D",
    	setDate: $('#cmbYear').val()+'-'+$('#cmbMonth').val()+'-'+$('#cmbDate').val(),
        buttonImage: "https://image.flaticon.com/icons/png/512/148/148982.png", 
        buttonImageOnly: true,
        onSelect:function(dateText, inst){
    		altField : '#getdate';
            var year = dateText.substr(6,4);
            var month = dateText.substr(0,2)-1;
            var day = dateText.substr(3,2)-1;
        	$("#cmbYear option:eq('"+year+"')").prop("selected", true);
            $("#cmbMonth option:eq('"+month+"')").prop("selected", true);
            $("#cmbDay option:eq('"+day+"')").prop("selected", true);
    	}
    });
    $("#datepicker").button();
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
    function setDate(){
    	var dd = $('#cmbDay').val();        
    	var mm = $('#cmbMonth').val();
    	var yyyy = $('#cmbYear').val();
    	
    	var ToDate = mm + '/' + dd + '/' + yyyy;
    	var FromDate = mm + '/01/' + yyyy;
    	$('#datepicker').datepicker('setDate', FromDate);
    }
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth();
    var day = date.getDate()-1;
    $("#cmbYear option:eq('"+year+"')").prop("selected", true);
    $("#cmbMonth option:eq('"+month+"')").prop("selected", true);
    $("#cmbDay option:eq('"+day+"')").prop("selected", true);
    		
	
} );
 
function fn_DayOfMonth(){
	var day = 32 - new Date($('#cmbYear').val(), $('#cmbMonth').val()-1, 32).getDate();
	 for(i = 1; i<=day; i++){
	    	var option = $("<option value = '"+i+"'>" + i + "</option>");
	    	$('#cmbDay').append(option);
	    }
};