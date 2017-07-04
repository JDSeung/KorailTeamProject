history.pushState(null, null, location.href);
window.onpopstate = function(event) {
	alert("비정상적인 접근입니다.\n예매를 처음부터 진행해 주시기 바랍니다.");
	location.href="/korail/reservation/";
}