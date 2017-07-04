var curruntPage;
var totalPage;
var noticeList;
var paging;
var regExp = /\s/g; // 검색어 입력했을 때 띄어쓰기 정규식
$(function(){
	getPage();
	/* 글쓰기 버튼 클릭시 */
	$("#swrite").click(function(){
		$("#pagingInfo").attr({
			"method" : "GET",
			"action" : "noticewrite"
		});
		$("#pagingInfo").submit();
	});
	
	/*검색버튼 클릭시*/
	$("#sbtn").click(function(){
		if ( $("#word").val() == '' || $("#word").val() == null){
			alert("검색어를 입력해 주십시오.");
		}
		if ( $("#word").val().match(regExp) ) {
			alert("올바른 검색어를 입력해 주십시오.\n띄어쓰기는 입력하실 수 없습니다.");
			return false;
		}
	$("#keyWord").val($("#word").val());
		$("#curruntPage").val(0);
		$.ajax({
			url:'searchData',
			type:'GET',
			data:$("#pagingInfo").serialize(),
			success:function(resultMap){
				noticeList = resultMap.noticeList;
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

function getPage(){
	$.ajax({
		url:'list',
		type:'GET',
		data:$("#pagingInfo").serialize(),
		success:function(mapList){
			noticeList = mapList.noticeList;
			paging = mapList.paging;
			totalPage = paging.totalPage-1;
			curruntPage = paging.curruntPage;
			$("#curruntPage").val(curruntPage);
			$("#totalPage").val(totalPage);
			page();
		}
	});
}

function page(){
	$(".noticetbl tbody tr").remove();
	if(noticeList.length == 0){
		var row = "<tr>";
			row += "<td colspan='3'>";
			row += "작성된 공지사항이 없습니다.";
			row += "</td>";
			row += "</tr>";
		$(".noticetbl tbody").append(row);
	}else{
		$.each(noticeList, function(noticeCnt, noticeVO){
			var row = "<tr>";
			row += "<td>";
			row += noticeVO.noticeNO;
			row += "</td>";
			row += "<td class ='tdt'>";
			row += '<a class="title" onclick="noticeDetail(this,'+noticeVO.noticeNO+','+noticeVO.noticeEtc+');">'+noticeVO.noticeTitle+'';
			row += "</a>";
			row += "</td>";
			row += "<td>";
			row += noticeVO.noticeRegdate;
			row += "</td>";
			row += "</tr>";
			$(".noticetbl tbody").append(row);
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
	$("#word").val($("#keyWord").val());
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
	$("#word").val($("#keyWord").val());
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
	$("#word").val($("#keyWord").val());
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
	$("#word").val($("#keyWord").val());
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
		getPage();
	}
	
}

function noticeDetail(notice,noticeNO,noticeEtc){
	$("#noticeEtc").val(noticeEtc);
	   $("#noticeNo").val(noticeNO);
	   console.log($("#noticeNo").val())
	   $("#pagingInfo").attr({
	      "method" : "GET",
	      "action" : "noticedetail"
	   });
	   $("#pagingInfo").submit();
}

