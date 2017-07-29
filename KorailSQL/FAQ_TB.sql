--------------------------------------------------------
--  파일이 생성됨 - 목요일-7월-13-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table FAQ_TB
--------------------------------------------------------

  CREATE TABLE "KORAIL"."FAQ_TB" 
   (	"FAQNO" NUMBER, 
	"ADMINNO" VARCHAR2(4 BYTE), 
	"ADMINNAME" VARCHAR2(20 BYTE), 
	"FAQTITLE" VARCHAR2(100 BYTE), 
	"FAQCONTENT" VARCHAR2(4000 BYTE), 
	"FAQREGDATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into KORAIL.FAQ_TB
SET DEFINE OFF;
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (41,'001','관리자','Q. 회사업무카드와 개인카드 등 복수개의 카드번호를 저장해서 사용할 수 있나요?','코레일톡의 상단 우측 메뉴 선택 → 자주쓰는 카드 설정 메뉴에서 최대 신용카드 번호 세 개를 카드별칭과 함께 저장해 놓을 수 있습니다. 저장해 놓은 신용카드번호는 승차권 또는 여행상품 결제 시 신용카드 번호 입력의 번거로움 없이 입력의 편의를 제공합니다.<br>
                                               	단, 신용카드 정보(신용카드번호, 유효기간)는 서버에 저장되지 않으므로 관리자 또한 알 수 없으며, 결제 시 마다 비밀번호는 별도 입력하셔야 합니다.
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (42,'001','관리자','Q. 승차권 예약대기는 무엇인가요?','<p>승차권을 예약중인 고객을 의미합니다.</p>

<p>승차권 예약&nbsp;중 고객이 예약 취소 혹은 환불을 할 경우 예약을 할 수 있습니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (43,'001','관리자','Q. 지연되는 열차 정보와 지연시간이 반영 된 열차의 도착 시간을 알고 싶어요.','<p>열차 조회 시 열차가 지연 되었을 경우 조회 결과에서 지연임을 거북이 아이콘으로 표시해줍니다. 열차 조회화면에서 열차시각을 선택하시면 지연 된 시간이 반영된 열차 시간표를 확인 하실 수 있습니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (44,'001','관리자','Q. 코레일톡으로 승차권을 전달하고 싶어요.','<p>승차권 발권 이후, 승차권 확인 &rarr; 전달하기를 선택하면 전달 받을 회원 정보 입력 후 승차권을 전달할 수 있습니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (45,'001','관리자','Q. 결제 시 포인트 KTX 마일리지/포인트는 어떻게 사용 하나요?','<p>KTX 마일리지/포인트는 결제 화면에서 승차권 별 사용 가능한 KTX 마일리지 종류를 확인하고, 이 중 하나를 선택하여 사용 하실 수 있습니다.</p>

<p>KTX 마일리지, 위비꿀머니(모아), OK캐시백 포인트는 결제 금액이 차감되는 할인 방식이며, 시티포인트는 결제 이후 신용카드 청구 할인 형태로 사용 됩니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (46,'001','관리자','Q. 정기승차권 예약 및 결제는 어떻게 하나요?','<p>정기권/패스 &rarr; 정기승차권 메뉴에서 조회 및 예약 결제 하실 수 있습니다. 정기승차권은 기명식 승차권으로 로그인 하신 고객 연령에 맞는 승차권만 조회 가능하며, 발권 후에는 표기된 고객에 한하여 사용하셔야 합니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (47,'001','관리자','Q. 반환수수료 안내','<p>구입한 승차권을 반환하는 경우 반환시점에 따른 반환수수료가 발생합니다. 자세한 사항은 코레일 홈페이지를 참조하실 수 있습니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (48,'001','관리자','Q. 모든 스마트폰에서 이용 가능한가요?','<p>스마트폰의 운영체제가 &#39;안드로이드&#39;, &#39;iOS&#39;인 경우에 이용이 가능합니다.</p>

<p>&nbsp;</p>

<p>다만, 블랙베리 등 일부 스마트폰과 새롭게 출시되는 스마트폰 중 일부는 해상도 등의 차이로 인해 이용이 불가할 수 있으니 참고하시기 바랍니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (49,'001','관리자','Q. 코레일톡(철도승차권 예매)에서 예약내역을 변경할 수 있나요?','<p>코레일톡(철도승차권 예매)에서는 예약 후 예약내역을 변경할 수 없습니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (50,'001','관리자','Q. 즐겨찾는 구간을 등록할 수 있나요?','<p>상단우측 메뉴 선택 &rarr; 즐겨찾는 구간 설정 메뉴에서 자주 이용하는 출발역과 도착역을 설정할 수 있습니다. 설정한 역 정보는 승차권 예매를 위한 역 검색시 확인 및 적용할 수 있습니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (51,'001','관리자','Q. 예약한 승차권 예약취소 또는 결제방법은?','<p>코레일톡의 상단 우측 마이페이지 선택 &rarr; 예약 승차권 조회메뉴에서 예약완료된 승차권을 취소할 수 있으며, 코레일톡에서는 신용카드와 일부 승차권에 대해 KTX 마일리지/포인트 결제가 가능합니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (52,'001','관리자','Q. 발권한 승차권의 반환 방법은?','<p>코레일톡의 승차권 확인 &rarr; 반환하기 버튼으로 발권한 승차권을 취소할 수 있으며 취소&middot;반환 수수료 발생시 코레일톡에서는 원결제수단 또는 마일리지로 납부할 수 있습니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (53,'001','관리자','Q. 인터넷에서 예약한 승차권을 스마트폰으로 결제, 발권할 수 있나요?','<p>코레일톡의 예약 승차권 조회&middot;취소 메뉴에서 인터넷으로 예약한 승차권도 스마트폰으로 결제(발권)할 수 있습니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (54,'001','관리자','Q. 홈티켓도 스마트폰에서 조회 및 반환이 가능한가요?','<p>스마트폰에서는 스마트폰승차권으로 발권한 내역만 확인이 가능하며, 홈티켓으로 조회되지 않으므로 반환도 불가능합니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (55,'001','관리자','Q. 열차시간, 예약내역 등이 조회되지 않습니다.','<p>서버에 접속자가 많아 예약내역 등의 조회가 늦어지는 경우도 있습니다. 그러나 대부분은 무선인터넷(와이파이)이 불안정해 서버에 접속하지 못하는 경우로 전화망(3G)로 전환하여 다시 시도하시기 바랍니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (56,'001','관리자','Q. 할인을 추가 하려면 어떻게 해야 하나요?','<p>승차인원을 선택 하시면 할인 승객 유형별 인원수를 입력하고, 아래의 순서로 진행 하시면 됩니다.</p>

<p>승차인원 선택 &rarr; 열차조회 &rarr; 예매하기 &rarr; 결제하기 &rarr; 할인유형 선택 후, 하단의 적용 버튼으로 할인 가능합니다.</p>

<p>※적용가능 할인 유형: 국가유공자, 할인쿠폰, 회원쿠폰 등</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (57,'001','관리자','Q. 스마트폰승차권 영수증은 어떻게 발급 받을 수 있나요?','<p>스마트폰승차권의 영수증은 코레일 홈페이지(www.letskorail.com)에서 발급 받을 수 있습니다.</p>

<p>- 코레일멤버십 : 승차권 &gt; 발권/취소/변경 &gt; 이용내역/영수증조회</p>

<p>- 미등록고객 : 승차권 &gt; 미등록고객서비스 &gt; 이용내역/영수증출력</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (58,'001','관리자','Q. 아이팟, 아이패드로도 스마트폰승차권을 발권할 수 있나요?','<p>전화기 기능이 없는 아이팟, 아이패드 등의 기기에서도 무선인터넷(와이파이)을 이용하여 스마트폰과 동일하게 코레일톡(철도승차권 예매)을 설치하여 스마트폰승차권을 예약&middot;발권할 수 있지만, 열차 내에서 승차권을 확인할 수 없는 불편이 발생하므로 홈티켓 등 다른 승차권을 이용하시기 바랍니다. (철도공사의 서버에서는 예약을 요청하는 기기의 기종을 구분하는 것이 불가능합니다)</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (59,'001','관리자','Q. 열차를 이용할때 스마트폰을 휴대해야 하나요?','<p>열차를 이용할 때에는 반드시 승차권을 소지하여야 하므로 스마트폰승차권의 조회를 위한 스마트폰을 반드시 소지하여야 합니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (60,'001','관리자','Q. 승차권확인이 안됩니다. 예약한 승차권이 보이지 않네요.','<p>코레일톡에서 예약&middot;발권한 승차권은 예약한 스마트폰에서만 조회가 가능합니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (61,'001','관리자','Q. 스마트폰으로 발권후 열차가 지연되었습니다. 어떻게 할인받을 수 있을까요?','<p>승차하신 열차가 지연된 경우, 해당 승차권으로 지연료 지불을 받거나, 지연할인증으로 사용할 수 있습니다.</p>

<p>&nbsp;</p>

<p>승차권확인 &rarr; 승차권 구입이력을 확인하면 승차권&ldquo;지연&rdquo;표시가 되어 있습니다.</p>

<p>&nbsp;</p>

<p>이 승차권을 역창구에 제시하면 지연료 지불을 받을 수 있고,</p>

<p>&nbsp;</p>

<p>결제페이지에서 지연할인증 사용 버튼을 선택하면 할인을 받을 수 있습니다.</p>

<p>&nbsp;</p>

<p>또한 승차권 구매이력에는 반환, 받은승차권, 승차권도 구분되어 조회되니, 참고하시기 바랍니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (62,'001','관리자','Q. 출발역 또는 도착역 찾기','<p>출발역, 도착역이 기본으로는 서울-부산으로 설정되어 있고, &quot;서울&quot;을 선택하면, 가까운역, 즐겨찾는 구간, 주요역 등으로</p>

<p>&nbsp;</p>

<p>조회할수 있으며, 역명의 초성 또는 전체로 조회가 가능하고, 오른쪽의 ㄱ, ㄴ, ㄷ 을 선택하면</p>

<p>해당 자음으로 시작하는 역을 찾으실수 있습니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (63,'001','관리자','Q. 자동 로그인 기능이 있나요?','<p>로그인 화면에 &quot;자동로그인&quot;기능이 있습니다.</p>

<p>자동로그인을 선택하면, 고객님의 휴대전화에 회원번호와 비밀번호를 암호화해서 저장하고</p>

<p>예약이나 승차권 확인할때 자동으로 로그인이 되어, 회원번호나 비밀번호를 입력하지 않아도 가능합니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (64,'001','관리자','Q. 회원번호/비밀번호를 모를때는 어떻게 하나요?','<p>로그인 화면에서 회원번호 찾기 또는 비밀번호 찾기를 선택 후 본인인증을 완료 후, 회원번호 찾기 또는 비밀번호 변경을 할 수 있습니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (65,'001','관리자','Q. 예약, 발권 및 반환시간은?','<p>예약시 바로 발권하셔야 합니다.</p>

<p>스마트폰 승차권은 열차출발시각까지 반환할 수 있습니다.</p>

<p>스마트폰 승차권은 코레일 홈페이지(www.letskorail.com)에서도 열차 출발 전 반환이 가능합니다.</p>

<p>- 홈페이지&gt;승차권&gt;발권/취소/변경(반환)</p>

<p>출발 후 반환은 도착시간 전까지 역 창구에서만 가능합니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (66,'001','관리자','Q. 승차권을 ‘발권’하지 않으면 안 되나요?','<p>승차권은 운송계약에 관한 증표로서 반드시 열차에 승차하기 전에 &lsquo;발권&rsquo;하여 휴대하여야 합니다.</p>

<p>&lsquo;발권&rsquo;이란 결제(대금지급)후 상품(승차권)을 받는 절차로서 &lsquo;발권&rsquo;하지 않으시면 열차를 이용할 의사가 없는 것으로 보아 열차출발시각에 자동으로 취소하고 수수료(15%)가 부과됩니다.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (67,'001','관리자','Q. 스마트폰승차권이란?','<p>스마트폰의 코레일톡(철도승차권 예매) 어플리케이션을 이용하여 스마트폰에서 발권 받은 승차권입니다.</p>

<p>☞ 앱스토어(아이폰) 또는 안드로이드마켓(안드로이드폰) 등에서 &lsquo;코레일톡&rsquo;, &lsquo;철도&rsquo;, &lsquo;코레일&rsquo;로 검색하여 어플리케이션을 다운 받을 수 있습니다.</p>
',to_date('17/07/10','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index SYS_C0012915
--------------------------------------------------------

  CREATE UNIQUE INDEX "KORAIL"."SYS_C0012915" ON "KORAIL"."FAQ_TB" ("FAQNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table FAQ_TB
--------------------------------------------------------

  ALTER TABLE "KORAIL"."FAQ_TB" MODIFY ("FAQNO" NOT NULL ENABLE);
 
  ALTER TABLE "KORAIL"."FAQ_TB" MODIFY ("ADMINNO" NOT NULL ENABLE);
 
  ALTER TABLE "KORAIL"."FAQ_TB" MODIFY ("ADMINNAME" NOT NULL ENABLE);
 
  ALTER TABLE "KORAIL"."FAQ_TB" MODIFY ("FAQTITLE" NOT NULL ENABLE);
 
  ALTER TABLE "KORAIL"."FAQ_TB" MODIFY ("FAQCONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "KORAIL"."FAQ_TB" MODIFY ("FAQREGDATE" NOT NULL ENABLE);
 
  ALTER TABLE "KORAIL"."FAQ_TB" ADD PRIMARY KEY ("FAQNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOLOGGING COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
