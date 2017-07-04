var curruntPage;
var totalPage;
var qnaList;
var paging;
var regExp = /\s/g;
/*실행하자마자 값 가져오기*/
/*초기 페이징 번호 넣어 주기*/
$(function(){
	/*글쓰기 버튼 클릭*/
	$("#swrite").click(function(){
		$("#pagingInfo").attr({
			"method" : "GET",
			"action" : "qnawrite"
		});
		$("#pagingInfo").submit();
	});
	
	/*검색버튼 클릭시.*/
	$("#sbtn").click(function(){
		if ( $("#keyWord").val() == '' || $("#keyWord").val() == null){
			alert("검색어를 입력해 주십시오.");
		}
		if ( $("#keyWord").val().match(regExp) ) {
			alert("올바른 검색어를 입력해 주십시오.\n띄어쓰기는 입력하실 수 없습니다.");
			return false;
		}
		$("#curruntPage").val(0);
		$.ajax({
			url:'searchData',
			type:'GET',
			data:$("#pagingInfo").serialize(),
			success:function(resultMap){
				qnaList = resultMap.qnaList;
				paging = resultMap.paging;
				totalPage = paging.totalPage-1;
				curruntPage = paging.curruntPage;
				$("#curruntPage").val(curruntPage);
				$("#totalPage").val(totalPage);
				$("a.ppage1").html('');
				page();
			}
		});
	})
	if($("#tpublic").val()=='false'){
		alert("비공개 게시물에 접근하실 수 없습니다.");
		$("#tpublic").val('');
	}
	getPage();
	curruntPage = Number($("#curruntPage").val());
	if (curruntPage % 5 == 1 && curruntPage != 0) {
		$("a.ppage1").html(curruntPage );
		$("a.ppage2").html(curruntPage + 1);
		$("a.ppage3").html(curruntPage + 2);
		$("a.ppage4").html(curruntPage + 3);
		$("a.ppage5").html(curruntPage + 4);
	}else{
		start = (curruntPage % 5)-1;
		$("a.ppage1").html(curruntPage - start);
		$("a.ppage2").html(curruntPage - start + 1);
		$("a.ppage3").html(curruntPage - start + 2);
		$("a.ppage4").html(curruntPage - start + 3);
		$("a.ppage5").html(curruntPage - start + 4);
	}
});

/*페이지 비동기 통신*/
function getPage(){
	$.ajax({
		url:'list',
		type:'GET',
		data:$("#pagingInfo").serialize(),
		success:function(mapList){
			qnaList = mapList.qnaList;
			paging = mapList.paging;
			totalPage = paging.totalPage-1;
			curruntPage = paging.curruntPage;
			$("#curruntPage").val(curruntPage);
			$("#totalPage").val(totalPage);
			page();
		}
	});
	
}
/*페이지 표시*/
function page(){
	$(".qnatbl tbody tr").remove();
	if(qnaList.length == 0){
		var row = "<tr>";
			row += "<td colspan='5'>";
			row += "작성된 QnA가 없습니다.";
			row += "</td>";
			row += "</tr>";
		$(".qnatbl tbody").append(row);
	}else{
		$.each(qnaList, function(qnaCnt, qnaVO){
			var row = "<tr>";
			row += "<td>";
			row += qnaVO.qnaNo;
			row += "</td>";
			row += "<td class ='tdt'>";
			row += '<a class="title" onclick="qnaDetail(this,'+qnaVO.qnaNo+','+qnaVO.ispublic+');">'+qnaVO.qnaTitle+'';
				if(qnaVO.ispublic == '1'){
					row += '<img class="lock" src="/korail/resources/front/img/lock.png" alt="비공개" />'
				}
			row += "</a>";
			row += "</td>";
			row += "<td>";
			row += qnaVO.qnaWriter;
			row += "</td>";
			row += "<td>";
			row += qnaVO.qnaRegDate;
			row += "</td>";
			row += "<td>";
			if(qnaVO.postNo != ""){
				row += "답변완료";
			}else{
				row += "대기중";
			}
			row += "</td>";
			row += "</tr>";
			$(".qnatbl tbody").append(row);
		});
		if($("a.ppage1").html()==""){
			$("a.ppage1").html(curruntPage + 1);
			$("a.ppage2").html(curruntPage + 2);
			$("a.ppage3").html(curruntPage + 3);
			$("a.ppage4").html(curruntPage + 4);
			$("a.ppage5").html(curruntPage + 5);
		}
	}
	for (var i = 1; i <= 5; i++) {
		if (Number($("a.ppage" + i + "").html()) == (curruntPage+1)) {
			$("a.ppage" + i + "").addClass("active");
		}else{
			$("a.ppage" + i + "").removeClass("active");
		}
	}
}


/*맨앞 클릭시*/
function pfirst(){
	$("a.ppage1").html(1);
	$("a.ppage2").html(2);
	$("a.ppage3").html(3);
	$("a.ppage4").html(4);
	$("a.ppage5").html(5);
	curruntPage = 0;
	setCurruntPage(curruntPage);
}
/*이전 버튼 클릭시*/
function ppriev(){
	if(Number($("a.ppage1").html())==1){
		return;
	}
	if(Number($("a.ppage1").html())-5>0){
		$("a.ppage1").html(Number($("a.ppage1").html())-5);
		$("a.ppage2").html(Number($("a.ppage2").html())-5);
		$("a.ppage3").html(Number($("a.ppage3").html())-5);
		$("a.ppage4").html(Number($("a.ppage4").html())-5);
		$("a.ppage5").html(Number($("a.ppage5").html())-5);
	}
	setCurruntPage(Number($("a.ppage1").html())-1);
}
/*번호 클릭시*/
function ppage(page){
	curruntPage = Number($(page).html()-1);
	setCurruntPage(curruntPage);
}
/*다음페이지 클릭시*/
function pnext(){
	if(Number($("a.ppage5").html())>totalPage){
		return;
	}
	if(Number($("a.ppage1").html())<totalPage){
		$("a.ppage1").html(Number($("a.ppage1").html())+5);
		$("a.ppage2").html(Number($("a.ppage2").html())+5);
		$("a.ppage3").html(Number($("a.ppage3").html())+5);
		$("a.ppage4").html(Number($("a.ppage4").html())+5);
		$("a.ppage5").html(Number($("a.ppage5").html())+5);
	}
	setCurruntPage(Number($("a.ppage1").html())-1);
}
/*마지막페이지 클릭시*/
function plast(){
	start = (totalPage % 5)-1;
	$("a.ppage1").html(totalPage - start);
	$("a.ppage2").html(totalPage - start + 1);
	$("a.ppage3").html(totalPage - start + 2);
	$("a.ppage4").html(totalPage - start + 3);
	$("a.ppage5").html(totalPage - start + 4);
	setCurruntPage(totalPage);
}

/*현재 페이지 저장*/
function setCurruntPage(page){
	if(0<=page && page <= totalPage){
		$("#curruntPage").val(page);
		getList();
	}
	
}
/*리스트 가져오기*/
function getList(){
	getPage();
}
/*상세보기*/
function qnaDetail(qna, qnaNo, ispublic){
	$("#ispublic").val(ispublic);
	$("#qnaNo").val(qnaNo);
	$("#pagingInfo").attr({
		"method" : "GET",
		"action" : "qnadetail"
	});
	$("#pagingInfo").submit();
}
