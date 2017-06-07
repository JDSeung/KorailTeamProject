    /*회원 테이블*/
    CREATE TABLE USER_TB(
        USERNO	            NUMBER NOT NULL PRIMARY KEY,	--회원번호
        USERID	            VARCHAR2(15) UNIQUE,      	    --아이디
        USERPW	            VARCHAR2(1000) NOT NULL,	    --비밀번호
        USERNAME	        VARCHAR2(15) NOT NULL,	        --성명
        USERPHONE	        VARCHAR2(13) NOT NULL UNIQUE,	--전화번호
        USERBIRTH	        DATE NOT NULL,	                --생년월일
        USEREMAIL	        VARCHAR2(50) NOT NULL,	        --이메일
        USERGENDER	        VARCHAR2(2),	                --성별
        USERADDR	        VARCHAR2(1000) NOT NULL,	    --주소
        USERJOINAGREE	    VARCHAR2(1) NOT NULL,	        --제3자제공동의
        USERINFOAGREE	    VARCHAR2(1) NOT NULL,	        --개인정보수집
        USERETC	            VARCHAR2(1),                    --비고
        USERJOINDATE DATE DEFAULT SYSDATE NOT NULL
    );
    
    /*회원 테이블 시퀀스*/
    CREATE SEQUENCE USER_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    /*관리자 테이블*/
    CREATE TABLE ADMIN_TB(
        ADMINNO				VARCHAR2(4)     NOT NULL PRIMARY KEY,	--사원번호
        ADMINID				VARCHAR2(15)    NOT NULL UNIQUE, 	    --아이디
        ADMINPW				VARCHAR2(1000)  NOT NULL,			    --비밀번호
        ADMINNAME			VARCHAR2(20)    NOT NULL,			    --사원명
        ADMINGRADE			VARCHAR2(10)    NOT NULL			    --사원등급
    );
    
    /*KTX 요금 정보 테이블*/
    CREATE TABLE KTXRATEINFO_TB(
        TRAINNO		        NUMBER		    NOT NULL PRIMARY KEY,                       --열차호수
        ADMINNO		        VARCHAR2(4)    NOT NULL REFERENCES ADMINTB(ADMINNO),       --사원번호
        SEATNO		        NUMBER		    NOT NULL,           	           	        --좌석번호
        VIPADULTRATE	    VARCHAR2(7)	    NOT NULL,                          	        --특실어른요금 숫자로 갈까 아니면 그냥 문자로 받을까?
        VIPCHILDRATE	    VARCHAR2(7)	    NOT NULL,                          	        --특실 어린이요금
        VIPSENIORRATE	    VARCHAR2(7)     NOT NULL,                         	        --특실 경로자요금
        STANDARDADULTRATE	VARCHAR2(7)	    NOT NULL,                          	        --일반실 어른요금 숫자로 갈까 아니면 그냥 문자로 받을까?
        STANDARDCHILDRATE	VARCHAR2(7)	    NOT NULL,                          	        --일반실 어린이요금
        STANDARDSENIORRATE	VARCHAR2(7)     NOT NULL                         	        --일반실 경로자요금
    );
    
    /*예약 테이블*/
    CREATE TABLE TICKETING_TB(
        TICKETNO		NUMBER          NOT NULL PRIMARY KEY,			        --예매번호
        USERNO			NUMBER          NOT NULL REFERENCES USERTB(USERNO),		--회원번호
        TRAINNO			VARCHAR2(2)     NOT NULL,	                            --열차호수
        RIDEDATE		DATE            NOT NULL,								--승차일자
        VEHICLEKNDID	VARCHAR2(4)     NOT NULL,								--열차번호
        VEHICLEKNDNM	VARCHAR2(60)    NOT NULL,								--열차종별
        DEPPLACENAME	VARCHAR2(200)   NOT NULL,								--출발역
        DEPPLANDTIME	VARCHAR2(14)    NOT NULL,								--출발시각
        ARRPLACENAME	VARCHAR2(200)   NOT NULL,								--도착역
        ARRPLANDTIME	VARCHAR2(14)    NOT NULL,								--도착시각
        RESERVATIONNO	VARCHAR2(10)    NOT NULL,								--예약매수
        RATE			VARCHAR2(10)    NOT NULL,								--금액
        ROOMRATING		VARCHAR2(50)    NOT NULL,								--객실등급
        SEATINFO		VARCHAR2(50)    NOT NULL,								--좌석정보
        PASSENGERTYPE	VARCHAR2(100)   NOT NULL,								--승객유형
        TICKETINGETC    VARCHAR2(1)     NOT NULL                                --비고
    );
    
    /*예약 테이블 시퀀스*/
    CREATE SEQUENCE TICKETING_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    /*공지사항 테이블*/
    CREATE TABLE NOTICE_TB(
        NOTICENO	            NUMBER          NOT NULL	PRIMARY KEY,		            --글번호
        ADMINNO			        VARCHAR2(4)    NOT NULL REFERENCES ADMINTB(ADMINNO),		--사원번호
        ADMINNAME		        VARCHAR2(20)    NOT NULL,			                        --사원명
        NOTICETITLE			    VARCHAR2(50)    NOT NULL,			                        --글제목
        NOTICECONTENT			VARCHAR2(4000)  NOT NULL,			                        --글내용
        NOTICEREGDATE			DATE            DEFAULT SYSDATE  NOT NULL,			        --작성일
        NOTICEATTACHMENTS		VARCHAR2(100)   DEFAULT 'N' NOT NULL, 			            --첨부파일
        NOTICETBETC             VARCHAR2(1)     NOT NULL                                    --비고
    );
    
    /*공지사항 테이블 시퀀스*/
    CREATE SEQUENCE NOTICE_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    /*FQA 테이블*/
    CREATE TABLE FAQ_TB(
        FAQNO		NUMBER          NOT NULL PRIMARY KEY,                       --글번호
        ADMINNO		VARCHAR2(15)	NOT NULL REFERENCES ADMINTB(ADMINNO),       --사원번호
        ADMINNAME	VARCHAR2(20)	NOT NULL,		                            --사원명
        FAQTITLE	VARCHAR2(100)	NOT NULL,		                            --글제목
        FAQCONTENT	VARCHAR2(4000)	NOT NULL,		                            --글내용
        FAQREGDATE	DATE		    DEFAULT SYSDATE NOT NULL                    --작성일
    );
    
    /*FAQ 테이블 시퀀스*/
    CREATE SEQUENCE FAQ_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    /*QNA 테이블*/
    CREATE TABLE QNA_TB(
        QNANO		    NUMBER          NOT NULL PRIMARY KEY,			        --일련번호
        USERNO		    NUMBER			NOT NULL REFERENCES USERTB(USERNO),     --회원번호
        ADMINNO		    VARCHAR2(4)	NOT NULL REFERENCES ADMINTB(ADMINNO),   --사원번호
        POSTNO		    NUMBER			NOT NULL,                               --게시글번호
        QNAWRITER		VARCHAR2(30)	NOT NULL,		                        --작성자
        QNAREGDATE		DATE			DEFAULT SYSDATE NOT NULL,               --작성일
        QNATITLE		VARCHAR2(100)	NOT NULL,		                        --제목
        QNACONTENT		VARCHAR2(4000)	NOT NULL,		                        --내용
        QNAATTACHMENTS	VARCHAR2(100)	NOT NULL,		                        --첨부파일
        ISPUBLIC		VARCHAR2(1)		DEFAULT 0 NOT NULL  	                --글공개여부
    );
    
    /*QNA 테이블 시퀀스*/
    CREATE SEQUENCE QNA_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    drop table CITYACCOTTRAIN_TB;
    /*CITYACCOTTRAIN_TB 테이블*/
    CREATE TABLE CITYACCOTTRAIN_TB(
        NODEID		    VARCHAR2(60)     NOT NULL PRIMARY KEY,			        --기차역ID
        NODENAME	    VARCHAR2(200)    NOT NULL,                              --기차역명
        GYEONBU      VARCHAR2(1),
        GYEONGJEON       VARCHAR2(1),
        HONAM           VARCHAR2(1),
        JEOLLA          VARCHAR2(1)
    ) nologging;
    
    
    select * from CITYACCOTTRAIN_TB;
   
    select count(nodeid) from CITYACCOTTRAIN_TB;
    commit;
    /*KTX 정보*/
    drop TABLE KTXINFO_TB;
    CREATE TABLE KTXINFO_TB(
        TRAINNAME NUMBER NOT NULL PRIMARY KEY,
        DEPPLACENAME VARCHAR2(200)   NOT NULL,
        DEPPLANDTIME VARCHAR2(14)   NOT NULL,
        ARRPLACENAME VARCHAR2(200)  NOT NULL,
        ARRPlANDTIME VARCHAR2(14)   NOT NULL,
        TAKETIME VARCHAR2(7)    NOT NULL
    ) nologging;
    /*FAQ 테이블 시퀀스*/
    DROP SEQUENCE KTXINFO_TB_SEQ;
    CREATE SEQUENCE KTXINFO_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    select * from KTXINFO_TB;
    
    DROP FUNCTION KTXINFO_TB_SEQ_FUNC;
    CREATE FUNCTION KTXINFO_TB_SEQ_FUNC RETURN NUMBER IS
    BEGIN
        RETURN KTXINFO_TB_SEQ.nextval;
    END;
   /*테스트용*/
   /*===============================================*/
    CREATE TABLE KTXINFO_TB_TEST AS SELECT * FROM KTXINFO_TB;
    select * from KTXINFO_TB_TEST;
    select count(*) from KTXINFO_TB_TEST;
    delete from KTXINFO_TB_TEST;
    select count(*),DEPPLACENAME, ARRPLACENAME from KTXINFO_TB_TEST
    group by DEPPLACENAME, ARRPLACENAME;
 select * from CITYTEST_TB;
 
 SELECT * FROM CITYTEST_TB where JEOLLA != '0';
 