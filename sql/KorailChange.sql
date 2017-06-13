    --회원테이블
    CREATE TABLE USER_TB(
        USERNO	        NUMBER	        NOT NULL	PRIMARY KEY	,		--회원번호
        USERID	        VARCHAR2(15),		                            --아이디
        USERPW	        VARCHAR2(1000)	NOT NULL,		                --비밀번호
        USERNAME	    VARCHAR2(15)	NOT NULL,		                --성명
        USERPHONE	    VARCHAR2(13)	NOT NULL,		                --전화번호
        USERBIRTH	    DATE	        NOT NULL,		                --생년월일
        USEREMAIL	    VARCHAR2(50)	NOT NULL,		                --이메일
        USERGENDER	    VARCHAR2(2),		                            --성별
        USERADDR	    VARCHAR2(1000)	NOT NULL,		                --주소
        USERJOINAGREE	VARCHAR2(1)	    NOT NULL,		                --회원약관동의
        USERINFOAGREE	VARCHAR2(1)	    NOT NULL,		                --개인정보수집
        USERETC	        VARCHAR2(1)	    NOT NULL,		                --비고 회원은 0 탈퇴는 1
        USERJOINDATE	DATE	        DEFAULT SYSDATE NOT NULL		--가입일
    ) nologging;
    
    /*회원 테이블 시퀀스*/
    CREATE SEQUENCE USER_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    --관리자테이블
    CREATE TABLE ADMIN_TB(
        ADMINNO	VARCHAR2(4)	        NOT NULL PRIMARY KEY,	--사원번호
        ADMINID	VARCHAR2(15)	    NOT NULL,	            --아이디
        ADMINPW	VARCHAR2(1000)	    NOT NULL,	            --비밀번호
        ADMINNAME	VARCHAR2(20)	NOT NULL,	            --사원명
        ADMINGRADE	VARCHAR2(10)	DEFAULT 0 NOT NULL      --사원등급
    ) nologging;
    
    --FAQ테이블
    CREATE TABLE FAQ_TB(
        FAQNO	    NUMBER		    NOT NULL PRIMARY KEY,	                        --글번호
        ADMINNO	    VARCHAR2(4)		NOT NULL REFERENCES ADMIN_TB(ADMINNO),	        --사원번호
        ADMINNAME	VARCHAR2(20)	NOT NULL,	                                    --사원명
        FAQTITLE	VARCHAR2(100)	NOT NULL,	                                    --글제목
        FAQCONTENT	VARCHAR2(4000)	NOT NULL,	                                    --글내용
        FAQREGDATE	DATE	        DEFAULT SYSDATE	NOT NULL	                    --작성일
    ) nologging;
    
     /*FAQ 테이블 시퀀스*/
    CREATE SEQUENCE FAQ_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    --QNA테이블
    CREATE TABLE QNA_TB(
        QNANO	        NUMBER		    NOT NULL	    PRIMARY KEY	,                           --글번호
        USERNO	        NUMBER		    NOT NULL	    REFERENCES USER_TB(USERNO),             --회원번호
        ADMINNO	        VARCHAR2(4)	    DEFAULT '001'  NOT NULL REFERENCES ADMIN_TB(ADMINNO) , --사원번호
        POSTNO	        NUMBER,                                                                 --게시글번호
        QNAWRITER	    VARCHAR2(30)	NOT NULL,                                               --작성자
        QNAREGDATE	    DATE	        DEFAULT SYSDATE	NOT NULL,                               --작성일
        QNATITLE	    VARCHAR2(100)	NOT NULL,                                               --제목
        QNACONTENT	    VARCHAR2(4000)	NOT NULL,                                               --내용
        QNAATTACHMENTS	VARCHAR2(100)	DEFAULT 'N'	NOT NULL,                                   --첨부파일
        ISPUBLIC	    VARCHAR2(1)	    DEFAULT '0'	NOT NULL	                                --글공개여부0-공개 1-비공개
    ) nologging;
    
    /*QNA 테이블 시퀀스*/
    CREATE SEQUENCE QNA_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    --공지사항테이블
    CREATE TABLE NOTICE_TB(
        NOTICENO	        NUMBER		    NOT NULL	PRIMARY KEY	,                   --글번호
        ADMINNO	            VARCHAR2(4)		NOT NULL	REFERENCES ADMIN_TB(ADMINNO),   --사원번호
        ADMINNAME	        VARCHAR2(20)	NOT NULL,                                   --사원명
        NOTICETITLE	        VARCHAR2(50)	NOT NULL,                                   --글제목
        NOTICECONTENT	    VARCHAR2(4000)	NOT NULL,                                   --글내용
        NOTICEREGDATE	    DATE	        DEFAULT SYSDATE	NOT NULL,                   --작성일
        NOTICEATTACHMENTS	VARCHAR2(100)	DEFAULT 'N'	NOT NULL,                       --첨부파일
        NOTICEETC	        VARCHAR2(1)	    DEFAULT '0'	NOT NULL	                    --비고0-공지 1-이벤트
    ) nologging;
    
     /*공지사항 테이블 시퀀스*/
    CREATE SEQUENCE NOTICE_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    --좌석
    CREATE TABLE SEAT_TB(
        SEATNO	        NUMBER	        NOT NULL	PRIMARY KEY,    --일련번호
        SEATDIVISION	VARCHAR2(60)	NOT NULL    UNIQUE,         --좌석구분
        SEATROW	        NUMBER	        NOT NULL,                   --행
        SEATCOLUMN	    NUMBER	        NOT NULL                    --열
        
    ) nologging;

    /*좌석 테이블 시퀀스*/
    CREATE SEQUENCE SEAT_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    select * from SEAT_TB;
    --KTX 요금 정보 테이블
    CREATE TABLE KTXRATEINFO_TB(
        TRAINNO	        NUMBER	    NOT NULL	PRIMARY KEY	,                           --일련번호
        ADMINNO	        VARCHAR2(4)	NOT NULL	REFERENCES ADMIN_TB(ADMINNO)	,       --사원번호
        SEATDIVISION    VARCHAR2(60)NOT NULL,                                           --좌석구분
        ADULTRATE	    VARCHAR2(7)	NOT NULL,                                           --어른요금
        CHILDRATE	    VARCHAR2(7)	NOT NULL,                                           --어린이요금
        SENIORRATE	    VARCHAR2(7)	NOT NULL,                                           --경로자요금
        FOREIGN KEY (SEATDIVISION) REFERENCES SEAT_TB(SEATDIVISION)
    ) nologging;
    
     /*KTX 요금 정보 테이블 시퀀스*/
    CREATE SEQUENCE KTXRATEINFO_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    --출도착정보
    CREATE TABLE CITYACCOTTRAIN_TB(
        DEPID	        VARCHAR2(60)	NOT NULL,   --출발역ID
        ARRID	        VARCHAR2(60)	NOT NULL,   --도착역ID
        DEPPLACENAME	VARCHAR2(200)	NOT NULL,   --출발역명
        ARRPLACENAME	VARCHAR2(200)	NOT NULL,   --도착역명
        CONSTRAINT CITYACCOTTRAIN_TB_KEY PRIMARY KEY (DEPID, ARRID, DEPPLACENAME, ARRPLACENAME)
    ) nologging;
    
    SELECT  TRAINNAME,	    
                           DEPPLACENAME,	
                           TO_CHAR(TO_DATE(SUBSTR(DEPPLANDTIME,9,4),'HH24mi'),'HH24"시"mi"분"') as depPlandTime, 
                           ARRPLACENAME,
                           TO_CHAR(TO_DATE(SUBSTR(ARRPLANDTIME,9,4),'HH24mi'),'HH24"시"mi"분"')	as arrPlandTime,
                           TAKETIME,
                           ROW_NUMBER() OVER( ORDER BY DEPPLANDTIME ASC) AS RN
                   FROM KTXINFO_TB
                   WHERE DEPPLACENAME = '서울' AND ARRPLACENAME = '부산'
                            AND TO_DATE(SUBSTR(DEPPLANDTIME,1,10),'yyyymmddHH24') 
                            	BETWEEN TO_DATE('2017061200','YYYYMMDDHH24') 
                            	AND 	ROUND(TO_DATE('2017061200','YYYYMMDDHH24')+1);
    SELECT COUNT(*)
		FROM KTXINFO_TB
		WHERE DEPPLACENAME = '서울' AND ARRPLACENAME = '부산'
             	AND TO_DATE(SUBSTR(DEPPLANDTIME,1,10),'yyyymmddHH24') 
             		BETWEEN TO_DATE('2017061200','YYYYMMDDHH24') 
             		AND 	ROUND(TO_DATE('2017061200','YYYYMMDDHH24')+1);
    --KTX정보
        SELECT  COUNT(*)
        FROM KTXINFO_TB
        WHERE DEPPLACENAME = '서울' AND ARRPLACENAME = '부산'
        AND TO_DATE(SUBSTR(DEPPLANDTIME,1,10),'yyyymmddHH24') >= TO_DATE('2017061200','YYYYMMDDHH24');
        
        SELECT *
        FROM(SELECT *
             FROM (SELECT  TRAINNAME,	    
                           DEPPLACENAME,	
                           TO_CHAR(TO_DATE(SUBSTR(DEPPLANDTIME,1,12),'YYMMDDHH24mi'),'YY"년"MM"월"DD"일"HH24"시"mi"분"') as depPlandTime, 
                           ARRPLACENAME,
                           TO_CHAR(TO_DATE(SUBSTR(ARRPLANDTIME,1,12),'YYMMDDHH24mi'),'YY"년"MM"월"DD"일"HH24"시"mi"분"')	as arrPlandTime,
                           TAKETIME,
                           ROW_NUMBER() OVER( ORDER BY depPlandTime ASC) AS RN
                   FROM KTXINFO_TB
                   WHERE DEPPLACENAME = '서울' AND ARRPLACENAME = '부산'
                            AND  TO_DATE(SUBSTR(DEPPLANDTIME,1,10),'yyyymmddHH24') BETWEEN  TO_DATE('2017061200','YYYYMMDDHH24') AND ROUND(TO_DATE('2017061300','YYYYMMDDHH24')+1)
             )
         WHERE RN>=31 AND RN <= 40);
            
      
    CREATE TABLE KTXINFO_TB(
        TRAINNAME	    VARCHAR2(100)	NOT NULL	PRIMARY KEY	,               --차량명
        DEPPLACENAME	VARCHAR2(200)	NOT NULL,                               --출발역명
        DEPPLANDTIME	VARCHAR2(14)	NOT NULL,                               --출발시각
        ARRPLACENAME	VARCHAR2(200)	NOT NULL,                               --도착역명
        ARRPLANDTIME	VARCHAR2(14)	NOT NULL,                               --도착시각
        TAKETIME	    VARCHAR2(7)	    NOT NULL                                --소요시간
    ) nologging;
     SELECT * 
     FROM KTXINFO_TB
     WHERE to_date(SUBSTR(DEPPLANDTIME,1,8),'yyyymmdd') = TO_DATE('20170612','YYYYMMDD');
    SELECT TO_CHAR(SYSDATE, 'yyyymmdd') FROM dual;
    SELECT count(*)  from KTXINFO_TB;
    --예매테이블
    CREATE TABLE TICKETING_TB(
        TICKETINGNO	    NUMBER          NOT NULL	PRIMARY KEY,                        --예매번호
        USERNO	        NUMBER	        NOT NULL	REFERENCES USER_TB(USERNO),         --회원번호
        TRAINNAME	    VARCHAR2(100)	NOT NULL	REFERENCES KTXINFO_TB(TRAINNAME),   --차량번호
        RIDEDATE	    DATE            NOT NULL,                                       --승차일자
        VEHICLEKNDNM	VARCHAR2(60)	DEFAULT 'KTX'	NOT NULL,                       --열차종별
        DEPPLACENAME	VARCHAR2(200)	NOT NULL,                                       --출발역
        DEPPLANDTIME	VARCHAR2(14)	NOT NULL,                                       --출발시각
        ARRPLACENAME	VARCHAR2(200)	NOT NULL,                                       --도착역
        ARRPLANDTIME	VARCHAR2(14)	NOT NULL,                                       --도착시각
        RESERVATIONNO	VARCHAR2(10)	NOT NULL,                                       --예매매수
        RATE	        VARCHAR2(10)    NOT NULL,                                       --금액
        SEATDIVISION	VARCHAR2(60)    NOT NULL REFERENCES SEAT_TB(SEATDIVISION),      --좌석구분
        SEAT	        VARCHAR2(100)   NOT NULL,                                       --좌석
        PASSENGERTYPE	VARCHAR2(100)   NOT NULL,                                       --승객유형
        TICKETINGDATE	DATE	        DEFAULT SYSDATE	NOT NULL,                       --예매일자
        TICKETINGETC	VARCHAR2(1)	    DEFAULT '0' 	NOT NULL                        --비고 0 - 대기, 1 - 취소, 2 - 진행, 3 - 완료, 4 ? 만료
    ) nologging;
    
    /*예매 테이블 시퀀스*/
    CREATE SEQUENCE TICKETING_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
     /*KTX 요금 정보 테이블 시퀀스*/
    CREATE SEQUENCE KTXINFO_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    /*KTX 정보 테이블 시퀀스 함수*/
    CREATE FUNCTION KTXINFO_TB_SEQ_FUNC RETURN NUMBER IS
    BEGIN
        RETURN KTXINFO_TB_SEQ.nextval;
    END;
    
    INSERT INTO SEAT_TB(SEATNO, SEATDIVISION,
                            SEATROW,
                            SEATCOLUMN)
                    VALUES (SEAT_TB_SEQ.NEXTVAL,'일반', 4,15);
    INSERT INTO SEAT_TB(SEATNO, SEATDIVISION,
                            SEATROW,
                            SEATCOLUMN)
                    VALUES (SEAT_TB_SEQ.NEXTVAL,'특실', 3,11);
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
        '003',
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
        '004',
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
        '005',
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
        '006',
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
                            NOTICEETC)
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
                            NOTICEETC)
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
                            NOTICEETC)
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
                                NOTICEETC)
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
                            NOTICEETC)
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
                            NOTICEETC)
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
                       5,
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
INSERT INTO KTXRATEINFO_TB (TRAINNO,
                                ADMINNO,
                                SEATDIVISION,
                                ADULTRATE,
                                CHILDRATE,
                                SENIORRATE)
                        VALUES( KTXRATEINFO_TB_SEQ.NEXTVAL,
                                '001',
                                '일반',
                                '59800',
                                '29900',
                                '59800');
                                
    INSERT INTO KTXRATEINFO_TB (TRAINNO,
                                ADMINNO,
                                SEATDIVISION,
                                ADULTRATE,
                                CHILDRATE,
                                SENIORRATE)
                        VALUES( KTXRATEINFO_TB_SEQ.NEXTVAL,
                                '001',
                                '특실',
                                '83700',
                                '53800',
                                '83700');
                                