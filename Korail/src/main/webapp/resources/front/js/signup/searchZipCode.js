var zipList;
var cPage;
$(function() {
	$("#zipCodedialog").scroll(function() {
		var maxHeight = $("#roadTable").height();
		var currentScroll = $("#zipCodedialog").scrollTop() + $("#zipCodedialog").height();
		cPage = Number($("#currentPage").val());
		console.log(cPage);
		if (maxHeight <= currentScroll + 200) {
			cPage++;
			console.log(cPage);
			$("#currentPage").val(cPage);
			console.log($("#currentPage").val());
			$.ajax({
				url : '/korail/signup/zip',
				data : $('form').serialize(),
				type : 'POST',
				async: false,
				dataType : 'json',
				success : function(result) {
					addZipList();
					zipList=result;
				}
			});
		}
	});
	$("#zipCodedialog").dialog({
		autoOpen : false, // 자동으로 열리지않게
		modal : true, // 모달대화상자
		resizable : false, // 크기 조절 못하게
		height : 650,
		width : 650
	});
	$('#searchBtn').click(function(e) {
		shearchAddr();
	});
	$("#searchData").keypress(function (e) {
		if (e.which == 13){
			shearchAddr();  // 실행할 이벤트
			console.log(e);
			alert(e.html());
	    }
	});
	/*우편번호 다이얼로그창 끄면 데이터 초기화*/
	$("#zipCodedialog").dialog({
		beforeClose: function(event, ui) {
			$("#searchData").val('');
			$("table.roadtbl").addClass("hidetbl");
			$("#roadList").empty();
		}
	});
});
function shearchAddr(){
	if($("#searchData").val() == null || $("#searchData").val() == ''){
		alert("주소명을 입력해 주십시오.");
		return;
	}
	$.ajax({
		url : '/korail/signup/zip',
		data : $('form').serialize(),
		type : 'POST',
		dataType : 'json',
		success : function(result) {
			$("table.roadtbl").removeClass("hidetbl");
			$("#roadList").empty();
			zipList=result;
			addZipList();
		}
	});
}
/*데이터 가져오기*/
function addZipList(){
	var html = '';
	if (zipList.errorCode != null
			&& zipList.errorCode != '' && $("#roadTable").height() == 40) {
		html += '<tr>';
		html += '   <td colspan="2">';
		html += '검색결과가 없습니다';
		html += '   <td>';
		html += '</tr>';
	} else {
		var list = zipList.list;
		for (var i = 0; i < list.length; i++) {
			html += '<tr>';
			html += '   <td id="doro">';
			html += list[i].zipcode;
			html += '</td>';
			html += '<td>';
			html += '<a href="#" id="doroaddr" onClick="putAddr();" >';
			html += list[i].lnmAddress;
			html += '</a>';
			html += '</td>';
			html += '</tr>';
		}
	}
	$("#roadList").append(html);
}
function putAddr() {
	$("#dorozip").val($("#doro").html());
	$("#doroaddrVil").val($("#doroaddr").html());
	$("#zipCodedialog").dialog("close");
}
