var saleslist;
var date = [];
var rate = [];
var crate = [];
$(function(){
		$.ajax({
			url: 'list',
			type: 'GET',
			data: $("#graph").serialize(),
			success:function(slist){
				console.log(slist);
				saleslist = slist;
				drowChart();
				var s1 = [2, 6, 7, 10];
				$.jqplot('graph',[rate, crate],{
			        	title : '최근 15일 매출',
			            highlighter: {
			            	show: true,		//마우스호버시 해당하는 값 표시
			            },
			            legend: {
			             show: true, //범례표시
			             placement: 'outsideGrid'//차트 화면 밖에 범례표시
			            },
			            grid: {
			             drawBorder: false,
			             shadow: false
			            },
			        	axes: {
			        		xaxis: {
				        			label: "날짜",
				        			renderer:$.jqplot.CategoryAxisRenderer,
				        			tickRenderer:$.jqplot.CanvasAxisTickRenderer,
				        			ticks:date,
				        			tickOptions:{
				        		            // X축의 글자 형식 설정 (년/월/일 시:분 으로 표기)
				        		            formatString:'%m/%d', 
				        		        } 
			        				},
			        		yaxis: {
			        			label: "금액",
			        			tickOptions:{
		        		            // X축의 글자 형식 설정 (년/월/일 시:분 으로 표기)
			        				formatString:"%'d원 ", 
		        		        } 
			        		}
			        		},
			        		series:[

			        			{label:'매 출'},

			        			{label:'환 불'}

			        			],
					}
				);
			}
		});
		
});

function drowChart(){
	var sysdate = new Date();
	var ticketingETC;
	sysdate.setMonth(sysdate.getMonth()+1);
	sysdate.setDate(sysdate.getDate()-15);
	for(var i = 0; i<15; i++ ){
		sysdate.setDate(sysdate.getDate()+1);
		frmdate = fmtDate(sysdate);
		substr = (frmdate+'').substr(5,frmdate.length);
		date.push(substr);
		for(var j = 0; j<15; j++ ){
			var listVO = saleslist[j];
			if(listVO != null){
				ticketingETC = listVO.ticketingETC;			
				if(ticketingETC == '0' && frmdate == listVO.ticketingDate){
					crate.push(Number(listVO.rate));
					rate.push(0);
				}else if(ticketingETC == '1' && frmdate == listVO.ticketingDate){
					rate.push(Number(listVO.rate));
					crate.push(0);
				}
				ticketingETC = '';
			}
		}
	}
	console.log(date);
	if(rate.length != 15){
		for(var i = rate.length; i<15; i++){
			rate.push(0);
		}
	}
	if(crate.length != 15){
		for(var i = crate.length; i<15; i++){
			crate.push(0);
		}
	}
	console.log("취소 : " + crate);
	console.log("결제 : " + rate);
}
function fmtDate(sysdate){
	var year = sysdate.getFullYear();
	var month = sysdate.getMonth();
	var day = sysdate.getDate();
	month =  (month+'').length == 1 ?'0'+ month : month;
	day =  (day+'').length == 1 ?'0'+ day : day;
	var date = year+"-"+month+"-"+day;
	return date;
	
}

