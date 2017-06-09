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
    
    
    
    /*공지사항 테이블*/
    CREATE TABLE NOTICE_TB(
        NOTICENO	            NUMBER          NOT NULL	PRIMARY KEY,		            --글번호
        ADMINNO			        VARCHAR2(4)    NOT NULL REFERENCES ADMIN_TB(ADMINNO),		--사원번호
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
        ADMINNO		VARCHAR2(15)	NOT NULL REFERENCES ADMIN_TB(ADMINNO),       --사원번호
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
        USERNO		    NUMBER			NOT NULL REFERENCES USER_TB(USERNO),    --회원번호
        ADMINNO		    VARCHAR2(4)	    DEFAULT '001' NOT NULL REFERENCES ADMIN_TB(ADMINNO),  --사원번호
        POSTNO		    NUMBER			,                               --게시글번호
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
    
    /*CITYACCOTTRAIN_TB 테이블*/
    CREATE TABLE CITYACCOTTRAIN_TB(
        NODEID		    VARCHAR2(60)     NOT NULL PRIMARY KEY,			        --기차역ID
        NODENAME	    VARCHAR2(200)    NOT NULL,                              --기차역명
        GYEONBU      VARCHAR2(1),
        GYEONGJEON       VARCHAR2(1),
        HONAM           VARCHAR2(1),
        JEOLLA          VARCHAR2(1)
    ) nologging;
    
    select * from CITYACCOTTRAIN_TB where NODENAME like '산';
    
  
    /*KTX 정보*/
    CREATE TABLE KTXINFO_TB(
        TRAINNAME NUMBER NOT NULL PRIMARY KEY,
        DEPPLACENAME VARCHAR2(200)   NOT NULL,
        DEPPLANDTIME VARCHAR2(14)   NOT NULL,
        ARRPLACENAME VARCHAR2(200)  NOT NULL,
        ARRPlANDTIME VARCHAR2(14)   NOT NULL,
        TAKETIME VARCHAR2(7)    NOT NULL
    ) nologging;
    select * from KTXINFO_TB;
    SELECT TO_DATE(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
    SELECT * FROM KTXINFO_TB WHERE TO_DATE(DEPPLANDTIME, 'YYYYMMDDHH24MISS') <= (SYSDATE-1);
    /*KTX 요금 정보 테이블 시퀀스*/
    CREATE SEQUENCE KTXINFO_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
     CREATE FUNCTION KTXINFO_TB_SEQ_FUNC RETURN NUMBER IS
    BEGIN
        RETURN KTXINFO_TB_SEQ.nextval;
    END;
     /*KTX 요금 정보 테이블*/
    CREATE TABLE KTXRATEINFO_TB(
        TRAINNO             NUMBER          PRIMARY KEY,
        TRAINNAME		    NUMBER		    NOT NULL REFERENCES KTXINFO_TB(TRAINNAME),  --열차호수
        ADMINNO		        VARCHAR2(4)     NOT NULL REFERENCES ADMIN_TB(ADMINNO),      --사원번호
        SEATNO		        NUMBER		    NOT NULL,           	           	        --좌석번호
        VIPADULTRATE	    VARCHAR2(7)	    NOT NULL,                          	        --특실어른요금 숫자로 갈까 아니면 그냥 문자로 받을까?
        VIPCHILDRATE	    VARCHAR2(7)	    NOT NULL,                          	        --특실 어린이요금
        VIPSENIORRATE	    VARCHAR2(7)     NOT NULL,                         	        --특실 경로자요금
        STANDARDADULTRATE	VARCHAR2(7)	    NOT NULL,                          	        --일반실 어른요금 숫자로 갈까 아니면 그냥 문자로 받을까?
        STANDARDCHILDRATE	VARCHAR2(7)	    NOT NULL,                          	        --일반실 어린이요금
        STANDARDSENIORRATE	VARCHAR2(7)     NOT NULL                         	        --일반실 경로자요금
    );
     /*KTX 요금 정보 테이블 시퀀스*/
    CREATE SEQUENCE KTXRATEINFO_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    
    /*예약 테이블*/
    CREATE TABLE TICKETING_TB(
        TICKETNO		NUMBER          NOT NULL PRIMARY KEY,			                --예매번호
        USERNO			NUMBER          NOT NULL REFERENCES USER_TB(USERNO),	        --회원번호
        TRAINNAME		NUMBER		    NOT NULL REFERENCES KTXINFO_TB(TRAINNAME),      --열차호수
        RIDEDATE		DATE            NOT NULL,								        --승차일자
        VEHICLEKNDID	VARCHAR2(4)     NOT NULL,								        --열차번호
        VEHICLEKNDNM	VARCHAR2(60)    NOT NULL,								        --열차종별
        DEPPLACENAME	VARCHAR2(200)   NOT NULL,								        --출발역
        DEPPLANDTIME	VARCHAR2(14)    NOT NULL,								        --출발시각
        ARRPLACENAME	VARCHAR2(200)   NOT NULL,								        --도착역
        ARRPLANDTIME	VARCHAR2(14)    NOT NULL,								        --도착시각
        RESERVATIONNO	VARCHAR2(10)    NOT NULL,								        --예약매수
        RATE			VARCHAR2(10)    NOT NULL,								        --금액
        ROOMRATING		VARCHAR2(50)    NOT NULL,								        --객실등급
        SEATINFO		VARCHAR2(50)    NOT NULL,								        --좌석정보
        PASSENGERTYPE	VARCHAR2(100)   NOT NULL,								        --승객유형
        TICKETINGETC    VARCHAR2(1)     NOT NULL                                        --비고
    );
    
    /*예약 테이블 시퀀스*/
    CREATE SEQUENCE TICKETING_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    /*좌석 정보*/
    CREATE TABLE SEATINFO_TB(
        SEATDIV VARCHAR2(10) NOT NULL PRIMARY KEY,
        SEATROW NUMBER NOT NULL,
        SEATCOLUMN NUMBER NOT NULL
    );
    SELECT * FROM SEATINFO_TB;
    INSERT INTO SEATINFO_TB(SEATDIV,
                            SEATROW,
                            SEATCOLUMN)
                    VALUES ('일반실', 4,15);
    INSERT INTO SEATINFO_TB(SEATDIV,
                            SEATROW,
                            SEATCOLUMN)
                    VALUES ('특실', 3,11);
   SELECT * 
    FROM KTXINFO_TB
    WHERE DEPPLACENAME = '서울' AND ARRPLACENAME = '영등포';
    
    INSERT INTO USER_TB
                ( USERNO, 
                  USERID, 
                  USERPW, 
                  USERNAME, 
                  USERPHONE, 
                  USERBIRTH, 
                  USEREMAIL, 
                  USERGENDER, 
                  USERADDR, 
                  USERJOINAGREE, 
                  USERINFOAGREE,
                  USERETC)
            VALUES ( USER_TB_SEQ.NEXTVAL, 
                     'user',
                     'user123', 
                     '유저', 
                     '010-1234-5678', 
                     '1990-01-01',
                     'user@email.com', 
                     '남', 
                     '서울시',
                     '1',
                     '1',
                     '0');
    INSERT INTO USER_TB
                ( USERNO, 
                  USERID, 
                  USERPW, 
                  USERNAME, 
                  USERPHONE, 
                  USERBIRTH, 
                  USEREMAIL, 
                  USERGENDER, 
                  USERADDR, 
                  USERJOINAGREE, 
                  USERINFOAGREE,
                  USERETC)
            VALUES ( USER_TB_SEQ.NEXTVAL, 
                     'user1',
                     'user123', 
                     '유저1', 
                     '010-4567-5678', 
                     '1990-01-01',
                     'user1@email.com', 
                     '남', 
                     '서울시',
                     '1',
                     '1',
                     '0');
    INSERT INTO USER_TB
                ( USERNO, 
                  USERID, 
                  USERPW, 
                  USERNAME, 
                  USERPHONE, 
                  USERBIRTH, 
                  USEREMAIL, 
                  USERGENDER, 
                  USERADDR, 
                  USERJOINAGREE, 
                  USERINFOAGREE,
                  USERETC)
            VALUES ( USER_TB_SEQ.NEXTVAL, 
                     'user2',
                     'user123', 
                     '유저1', 
                     '010-4567-1238', 
                     '1990-01-01',
                     'user2@email.com', 
                     '남', 
                     '서울시',
                     '1',
                     '1',
                     '0');
    INSERT INTO USER_TB
                ( USERNO, 
                  USERID, 
                  USERPW, 
                  USERNAME, 
                  USERPHONE, 
                  USERBIRTH, 
                  USEREMAIL, 
                  USERGENDER, 
                  USERADDR, 
                  USERJOINAGREE, 
                  USERINFOAGREE,
                  USERETC)
            VALUES ( USER_TB_SEQ.NEXTVAL, 
                     'user3',
                     'user123', 
                     '유저1', 
                     '010-4567-5678', 
                     '1990-01-01',
                     'user3@email.com', 
                     '남', 
                     '서울시',
                     '1',
                     '1',
                     '0');
    INSERT INTO USER_TB
                ( USERNO, 
                  USERID, 
                  USERPW, 
                  USERNAME, 
                  USERPHONE, 
                  USERBIRTH, 
                  USEREMAIL, 
                  USERGENDER, 
                  USERADDR, 
                  USERJOINAGREE, 
                  USERINFOAGREE,
                  USERETC)
            VALUES ( USER_TB_SEQ.NEXTVAL, 
                     'user4',
                     'user123', 
                     '유저1', 
                     '010-1236-5678', 
                     '1990-01-01',
                     'user4@email.com', 
                     '남', 
                     '서울시',
                     '1',
                     '1',
                     '0');
     INSERT INTO USER_TB
                ( USERNO, 
                  USERID, 
                  USERPW, 
                  USERNAME, 
                  USERPHONE, 
                  USERBIRTH, 
                  USEREMAIL, 
                  USERGENDER, 
                  USERADDR, 
                  USERJOINAGREE, 
                  USERINFOAGREE,
                  USERETC)
            VALUES ( USER_TB_SEQ.NEXTVAL, 
                     'user5',
                     'user123', 
                     '유저1', 
                     '010-4565-5678', 
                     '1990-01-01',
                     'user5@email.com', 
                     '남', 
                     '서울시',
                     '1',
                     '1',
                     '0');
     INSERT INTO ADMIN_TB
    (   ADMINNO,
        ADMINID,
        ADMINPW	,
        ADMINNAME,
        ADMINGRADE)
    VALUES(
        '001',
        'admin',
        'admin123',
        '관리자',
        '0'
    );
     INSERT INTO ADMIN_TB
    (   ADMINNO,
        ADMINID,
        ADMINPW	,
        ADMINNAME,
        ADMINGRADE)
    VALUES(
        '002',
        'admin1',
        'admin123',
        '관리자1',
        '0'
    );
     INSERT INTO ADMIN_TB
    (   ADMINNO,
        ADMINID,
        ADMINPW	,
        ADMINNAME,
        ADMINGRADE)
    VALUES(
        '002',
        'admin2',
        'admin123',
        '관리자',
        '0'
    );
     INSERT INTO ADMIN_TB
    (   ADMINNO,
        ADMINID,
        ADMINPW	,
        ADMINNAME,
        ADMINGRADE)
    VALUES(
        '003',
        'admin3',
        'admin123',
        '관리자',
        '0'
    );
     INSERT INTO ADMIN_TB
    (   ADMINNO,
        ADMINID,
        ADMINPW	,
        ADMINNAME,
        ADMINGRADE)
    VALUES(
        '004',
        'admin4',
        'admin123',
        '관리자',
        '0'
    );
     INSERT INTO ADMIN_TB
    (   ADMINNO,
        ADMINID,
        ADMINPW	,
        ADMINNAME,
        ADMINGRADE)
    VALUES(
        '005',
        'admin5',
        'admin123',
        '관리자',
        '0'
    );
    INSERT INTO NOTICE_TB(
                            NOTICENO,
                            ADMINNO,
                            ADMINNAME,
                            NOTICETITLE,
                            NOTICECONTENT,
                            NOTICETBETC)
                VALUES(
                            NOTICE_TB_SEQ.NEXTVAL,
                            '001',
                            '관리자',
                            '공지사항테스트글제목1',
                            '공지사항테스트 글내용1',
                            '0'
                );
    INSERT INTO NOTICE_TB(
                            NOTICENO,
                            ADMINNO,
                            ADMINNAME,
                            NOTICETITLE,
                            NOTICECONTENT,
                            NOTICETBETC)
                VALUES(
                            NOTICE_TB_SEQ.NEXTVAL,
                            '002',
                            '관리자',
                            '공지사항테스트글제목2',
                            '공지사항테스트 글내용2',
                            '0'
                );
    INSERT INTO NOTICE_TB(
                            NOTICENO,
                            ADMINNO,
                            ADMINNAME,
                            NOTICETITLE,
                            NOTICECONTENT,
                            NOTICETBETC)
                VALUES(
                            NOTICE_TB_SEQ.NEXTVAL,
                            '003',
                            '관리자',
                            '공지사항테스트글제목3',
                            '공지사항테스트 글내용3',
                            '0'
                );
    INSERT INTO NOTICE_TB(
                                NOTICENO,
                                ADMINNO,
                                ADMINNAME,
                                NOTICETITLE,
                                NOTICECONTENT,
                                NOTICETBETC)
                    VALUES(
                                NOTICE_TB_SEQ.NEXTVAL,
                                '004',
                                '관리자',
                                '공지사항테스트글제목4',
                                '공지사항테스트 글내용4',
                                '0'
                    );
    INSERT INTO NOTICE_TB(
                            NOTICENO,
                            ADMINNO,
                            ADMINNAME,
                            NOTICETITLE,
                            NOTICECONTENT,
                            NOTICETBETC)
                VALUES(
                            NOTICE_TB_SEQ.NEXTVAL,
                            '005',
                            '관리자',
                            '공지사항테스트글제목5',
                            '공지사항테스트 글내용5',
                            '0'
                );
    INSERT INTO NOTICE_TB(
                            NOTICENO,
                            ADMINNO,
                            ADMINNAME,
                            NOTICETITLE,
                            NOTICECONTENT,
                            NOTICETBETC)
                VALUES(
                            NOTICE_TB_SEQ.NEXTVAL,
                            '001',
                            '관리자',
                            '이벤트글',
                            '이벤트 내용',
                            '1'
                );
    INSERT INTO FAQ_TB(
                            FAQNO,
                            ADMINNO,
                            ADMINNAME,
                            FAQTITLE,
                            FAQCONTENT
                        )
                        VALUES(
                            FAQ_TB_SEQ.NEXTVAL,
                            '001',
                            '관리자',
                            '자주묻는질문1',
                            '자주묻는질문 내용1'
                        );
    INSERT INTO FAQ_TB(
                            FAQNO,
                            ADMINNO,
                            ADMINNAME,
                            FAQTITLE,
                            FAQCONTENT
                        )
                        VALUES(
                            FAQ_TB_SEQ.NEXTVAL,
                            '001',
                            '관리자',
                            '자주묻는질문2',
                            '자주묻는질문 내용2'
                        );
    INSERT INTO FAQ_TB(
                            FAQNO,
                            ADMINNO,
                            ADMINNAME,
                            FAQTITLE,
                            FAQCONTENT
                        )
                        VALUES(
                            FAQ_TB_SEQ.NEXTVAL,
                            '001',
                            '관리자',
                            '자주묻는질문3',
                            '자주묻는질문 내용3'
                        );
    INSERT INTO FAQ_TB(
                            FAQNO,
                            ADMINNO,
                            ADMINNAME,
                            FAQTITLE,
                            FAQCONTENT
                        )
                        VALUES(
                            FAQ_TB_SEQ.NEXTVAL,
                            '001',
                            '관리자',
                            '자주묻는질문4',
                            '자주묻는질문 내용4'
                        );
    INSERT INTO FAQ_TB(
                            FAQNO,
                            ADMINNO,
                            ADMINNAME,
                            FAQTITLE,
                            FAQCONTENT
                        )
                        VALUES(
                            FAQ_TB_SEQ.NEXTVAL,
                            '001',
                            '관리자',
                            '자주묻는질문5',
                            '자주묻는질문 내용5'
                        );
    INSERT INTO QNA_TB(
                        QNANO,
                        USERNO,
                        QNAWRITER,
                        QNATITLE,
                        QNACONTENT,
                        QNAATTACHMENTS,
                        ISPUBLIC
                    )
                    VALUES(
                       QNA_TB_SEQ.NEXTVAL,
                       2,
                       '유저1',
                       'QNA제목',
                       'QNA글',
                       'N',
                       '0'
                    );
                    
    INSERT INTO QNA_TB(
                        QNANO,
                        USERNO,
                        QNAWRITER,
                        QNATITLE,
                        QNACONTENT,
                        QNAATTACHMENTS,
                        ISPUBLIC
                    )
                    VALUES(
                       QNA_TB_SEQ.NEXTVAL,
                       3,
                       '유저2',
                       'QNA제목1',
                       'QNA글1',
                       'N',
                       '0'
                    );
    INSERT INTO QNA_TB(
                        QNANO,
                        USERNO,
                        QNAWRITER,
                        QNATITLE,
                        QNACONTENT,
                        QNAATTACHMENTS,
                        ISPUBLIC
                    )
                    VALUES(
                       QNA_TB_SEQ.NEXTVAL,
                       2,
                       '유저3',
                       'QNA제목2',
                       'QNA글2',
                       'N',
                       '0'
                    );
    INSERT INTO QNA_TB(
                        QNANO,
                        USERNO,
                        QNAWRITER,
                        QNATITLE,
                        QNACONTENT,
                        QNAATTACHMENTS,
                        ISPUBLIC
                    )
                    VALUES(
                       QNA_TB_SEQ.NEXTVAL,
                       2,
                       '유저4',
                       'QNA제목3',
                       'QNA글3',
                       'N',
                       '0'
                    );  
    INSERT INTO QNA_TB(
                        QNANO,
                        USERNO,
                        QNAWRITER,
                        QNATITLE,
                        QNACONTENT,
                        QNAATTACHMENTS,
                        ISPUBLIC
                    )
                    VALUES(
                       QNA_TB_SEQ.NEXTVAL,
                       2,
                       '유저1',
                       'QNA제목4',
                       'QNA글4',
                       'N',
                       '0'
                    );
                    
    INSERT INTO QNA_TB(
                        QNANO,
                        USERNO,
                        ADMINNO,
                        POSTNO,
                        QNAWRITER,
                        QNATITLE,
                        QNACONTENT,
                        QNAATTACHMENTS,
                        ISPUBLIC
                    )
                    VALUES(
                       QNA_TB_SEQ.NEXTVAL,
                       2,
                       '001',
                       '2',
                       '관리자',
                       'QNA답변1',
                       'QNA답변1',
                       'N',
                       '0'
                    );