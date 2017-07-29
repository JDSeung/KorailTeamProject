<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%
	String root = request.getContextPath() + "/resources/";
	String rootCss = root + "front/css/";
	String rootJS = root + "front/js/";
%>
<link rel="stylesheet" href="<%=rootCss%>basic.css">
<link rel="stylesheet" href="<%=rootCss%>company/company.css">
<meta charset="UTF-8">
<title>Korail</title>
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class="cwrap">
		<div class="iwrap">
			<div id="sub_head">
				<div id="sub_title">
					<h1>미션과 비전</h1>
				</div>
			</div>
			<div id="contents">
					<!-- 탭메뉴(4차메뉴) -->
				<p align="center"><img width="735" alt="미션은사람ㆍ세상ㆍ미래와 함께하는 대한민국 철도이며, 비전은 국민행복 KORAIL입니다. 핵심가치는 안전우선 / 고객만족 / 변화도전이며, 경영방침은 흑자경영 / 절대안전 / 창조경영 / 조직혁신입니다. 5대 전략방향은 절대안전체계 확립, 최적 운송체계 구축, 창조적 고객가치 구현, 혁신적 조직체질 개선, 미래 성장동력 확대입니다. 2021 경영목표는 안전운행서비스 1.073건/백만km, 영업수익 70,011억원, 공기업고객만족도 A등급, 부채비율 179.5%, 다원사업매출액 3,530억원(별도)입니다. 이를 실행하기 위해 15대 전사전략 40개 실행과제를 이행하고 있습니다. " src="<%=root%>front/img/company.png"></p>
				<div class="interval">
				<h2>미션 </h2>
				<p class="indent"><strong>사람ㆍ세상</strong> <strong>ㆍ</strong> <strong>미래와 함께하는 대한민국 철도</strong> </p>
				<p class="indent"><span style="FONT-SIZE: 9pt">&nbsp;안전하고 편리한 철도 서비스 제공으로 국민행복 증진과 사회적 책임을 강화하고</span> </p>
				<p class="indent"><span style="FONT-SIZE: 9pt">&nbsp;남북ㆍ대륙철도 연결과 철도 중심의 신성장사업 육성으로 대한민국의 새로운 미래창조에 기여</span> </p>
				<h2 class="interval">비전</h2>
				<p class="indent"><strong>국민행복 KORAIL</strong> </p>
				<ul>
				<li>
				<div class="indent"><span style="FONT-SIZE: 9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;창조적 고객가치 구현과 혁신적 조직체질 개선으로 지속가능한 경영체계 확립을 통한 국민행복 증진 &nbsp;</span> </div></li></ul>
				<p class="indent">&nbsp;</p>
				<h2 class="interval">핵심가치</h2>
				<p class="indent"><strong>안전우선 / 고객만족 / 변화도전 </strong></p>
				<p class="indent"><span style="FONT-SIZE: 9pt">① 안전우선 : 안전은 최고의 서비스이자 가치로서, 최고의 기술력을 기반으로 완벽한 안전관리체계를 구축하여&nbsp;</span> <br><span style="FONT-SIZE: 9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Global No.1 수준을 넘어 무결점 안전관리 실현</span> </p>
				<p class="indent"><span style="FONT-SIZE: 9pt">② 고객만족 : 모든 서비스는 고객만족을 최우선으로, 고객이 만족하는 그 이상의 가치를 제공하여</span> <br><span style="FONT-SIZE: 9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;국민을 행복하게 하는 철도서비스를 창조</span> </p>
				<p class="indent"><span style="FONT-SIZE: 9pt">③ 변화도전 : 철도가족과 국민이 함께 꿈꾸는 대한민국의 내일을 위해 끊임없이 변화와 도전을 추구하고, <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</span> <span style="FONT-SIZE: 9pt">열정을 바탕으로 꿈을 현실로 실현&nbsp;</span> </p>
				<div class="interval">
				<h2>경영방침</h2>
				<p class="indent"><strong>절대안전 / 흑자경영 / 창조경영 / 조직혁신</strong> </p>
				<p class="indent"><span style="FONT-SIZE: 9pt"><span style="FONT-SIZE: 9pt">①</span> 절대안전 : 첨단 기술력을 기반으로 선진 안전시스템 구축과 안전제일 경영 정착</span> </p>
				<p class="indent"><span style="FONT-SIZE: 9pt"><span style="FONT-SIZE: 9pt">②</span> 흑자경영 : 전방위적인 경영개선 노력으로 영업흑자 기조를 유지하여 부채감축 및 경쟁력 있는 공기업 실현</span> </p>
				<p class="indent"><span style="FONT-SIZE: 9pt"><span style="FONT-SIZE: 9pt">③</span> 창조경영 : 역세권 중심의 생활문화 창달과 코레일형 창조경제로 국민행복을 증진하고 국가 경쟁력 제고에 기여</span> </p>
				<p class="indent"><span style="FONT-SIZE: 9pt">④&nbsp;조직혁신 : 근본적인 조직혁신을 통한 협력과 열정의 기업문화로 대한민국을 선도</span> </p></div>
				<div class="interval">
				<h2>전략방향 및 경영목표</h2>
				<p class="indent"><strong>5대 전략방향 / 6대 경영목표 / 15대 전사전략을 추진</strong> </p></div></div>
			</div>
		</div>
	</div>
</body>
</html>