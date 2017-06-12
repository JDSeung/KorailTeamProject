function putStation(name){
	if($(".division").val() =='dep'){
		if(name == $("#arrPlaceName").val()){
			alert("출발지와 도착지가 같습니다.");
			return;
		}
		$("#depPlaceName").val(name);
		$('#dialog').dialog('close');
	}else{
		if($("#depPlaceName").val() == name){
			alert("출발지와 도착지가 같습니다.");
			return;
		}
		$("#arrPlaceName").val(name);
		$('#dialog').dialog('close');
	}
}