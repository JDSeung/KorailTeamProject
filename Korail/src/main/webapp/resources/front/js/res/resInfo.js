history.pushState(null, null, location.href);
window.onpopstate = function(event) {
	$.ajax({
		url : "cancelres",
		type : "POST",
		data : $("#resInfo").serialize(),
		success : function(resultData) {
			alert("비정상적인 접근입니다.\n예매를 처음부터 진행해 주시기 바랍니다.");
			location.href="/korail/reservation/";
		}
	});
}
$(function() {
	var depsecDate = $("#depPlandTime").val();
	var year = depsecDate.substr(0, 4);
	var month = depsecDate.substr(4, 2);
	var day = depsecDate.substr(6, 2);
	var hour = depsecDate.substr(8, 2);
	var min = depsecDate.substr(10, 2);
	$(".rideDate").html(month + '월 ' + day + '일 ');
	$(".depTime").html(hour + '시 ' + min + '분');
	var arrsecDate = $("#arrPlandTime").val();
	var aday = depsecDate.substr(6, 2);
	var ahour = arrsecDate.substr(8, 2);
	var amin = arrsecDate.substr(10, 2);
	var gap = new Date(year, month, aday, ahour, amin ,0,0).getTime() - new Date(year, month, day, hour, min ,0,0).getTime();
	var hour_gap = parseInt(gap / 1000 / 60 /60);
	gap = gap % (1000 * 60 * 60);
	var min_gap = gap / 1000 /60;
	$(".arrTime").html(ahour + '시 ' + amin + '분');
	$(".takeTime").html(hour_gap + '시' + min_gap + '분');
	$(".resCancle").click(function(){
		$.ajax({
			url : "cancelres",
			type : "POST",
			data : $("#resInfo").serialize(),
			success : function(resultData) {
				alert("예약취소가 완료되었습니다.");
				location.href="/korail/reservation/";
			}
		});
	});
});
