    --ȸ�����̺�
    CREATE TABLE USER_TB(
        USERNO	        NUMBER	        NOT NULL	PRIMARY KEY	,		--ȸ����ȣ
        USERID	        VARCHAR2(15),		                            --���̵�
        USERPW	        VARCHAR2(1000)	NOT NULL,		                --��й�ȣ
        USERNAME	    VARCHAR2(15)	NOT NULL,		                --����
        USERPHONE	    VARCHAR2(13)	NOT NULL,		                --��ȭ��ȣ
        USERBIRTH	    DATE	        NOT NULL,		                --�������
        USEREMAIL	    VARCHAR2(50)	NOT NULL,		                --�̸���
        USERGENDER	    VARCHAR2(2),		                            --����
        USERADDR	    VARCHAR2(1000)	NOT NULL,		                --�ּ�
        USERJOINAGREE	VARCHAR2(1)	    NOT NULL,		                --ȸ���������
        USERINFOAGREE	VARCHAR2(1)	    NOT NULL,		                --������������
        USERETC	        VARCHAR2(1)	    NOT NULL,		                --��� ȸ���� 0 Ż��� 1
        USERJOINDATE	DATE	        DEFAULT SYSDATE NOT NULL		--������
    ) nologging;
    
    /*ȸ�� ���̺� ������*/
    CREATE SEQUENCE USER_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    --���������̺�
    CREATE TABLE ADMIN_TB(
        ADMINNO	VARCHAR2(4)	        NOT NULL PRIMARY KEY,	--�����ȣ
        ADMINID	VARCHAR2(15)	    NOT NULL,	            --���̵�
        ADMINPW	VARCHAR2(1000)	    NOT NULL,	            --��й�ȣ
        ADMINNAME	VARCHAR2(20)	NOT NULL,	            --�����
        ADMINGRADE	VARCHAR2(10)	DEFAULT 0 NOT NULL      --������
    ) nologging;
    
    --FAQ���̺�
    CREATE TABLE FAQ_TB(
        FAQNO	    NUMBER		    NOT NULL PRIMARY KEY,	                        --�۹�ȣ
        ADMINNO	    VARCHAR2(4)		NOT NULL REFERENCES ADMIN_TB(ADMINNO),	        --�����ȣ
        ADMINNAME	VARCHAR2(20)	NOT NULL,	                                    --�����
        FAQTITLE	VARCHAR2(100)	NOT NULL,	                                    --������
        FAQCONTENT	VARCHAR2(4000)	NOT NULL,	                                    --�۳���
        FAQREGDATE	DATE	        DEFAULT SYSDATE	NOT NULL	                    --�ۼ���
    ) nologging;
    
     /*FAQ ���̺� ������*/
    CREATE SEQUENCE FAQ_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    --QNA���̺�
    CREATE TABLE QNA_TB(
        QNANO	        NUMBER		    NOT NULL	    PRIMARY KEY	,                           --�۹�ȣ
        USERNO	        NUMBER		    NOT NULL	    REFERENCES USER_TB(USERNO),             --ȸ����ȣ
        ADMINNO	        VARCHAR2(4)	    DEFAULT '001'  NOT NULL REFERENCES ADMIN_TB(ADMINNO) , --�����ȣ
        POSTNO	        NUMBER,                                                                 --�Խñ۹�ȣ
        QNAWRITER	    VARCHAR2(30)	NOT NULL,                                               --�ۼ���
        QNAREGDATE	    DATE	        DEFAULT SYSDATE	NOT NULL,                               --�ۼ���
        QNATITLE	    VARCHAR2(100)	NOT NULL,                                               --����
        QNACONTENT	    VARCHAR2(4000)	NOT NULL,                                               --����
        QNAATTACHMENTS	VARCHAR2(100)	DEFAULT 'N'	NOT NULL,                                   --÷������
        ISPUBLIC	    VARCHAR2(1)	    DEFAULT '0'	NOT NULL	                                --�۰�������0-���� 1-�����
    ) nologging;
    
    /*QNA ���̺� ������*/
    CREATE SEQUENCE QNA_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    --�����������̺�
    CREATE TABLE NOTICE_TB(
        NOTICENO	        NUMBER		    NOT NULL	PRIMARY KEY	,                   --�۹�ȣ
        ADMINNO	            VARCHAR2(4)		NOT NULL	REFERENCES ADMIN_TB(ADMINNO),   --�����ȣ
        ADMINNAME	        VARCHAR2(20)	NOT NULL,                                   --�����
        NOTICETITLE	        VARCHAR2(50)	NOT NULL,                                   --������
        NOTICECONTENT	    VARCHAR2(4000)	NOT NULL,                                   --�۳���
        NOTICEREGDATE	    DATE	        DEFAULT SYSDATE	NOT NULL,                   --�ۼ���
        NOTICEATTACHMENTS	VARCHAR2(100)	DEFAULT 'N'	NOT NULL,                       --÷������
        NOTICEETC	        VARCHAR2(1)	    DEFAULT '0'	NOT NULL	                    --���0-���� 1-�̺�Ʈ
    ) nologging;
    
     /*�������� ���̺� ������*/
    CREATE SEQUENCE NOTICE_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    --�¼�
    CREATE TABLE SEAT_TB(
        SEATNO	        NUMBER	        NOT NULL	PRIMARY KEY,    --�Ϸù�ȣ
        SEATDIVISION	VARCHAR2(60)	NOT NULL    UNIQUE,         --�¼�����
        SEATROW	        NUMBER	        NOT NULL,                   --��
        SEATCOLUMN	    NUMBER	        NOT NULL                    --��
        
    ) nologging;

    /*�¼� ���̺� ������*/
    CREATE SEQUENCE SEAT_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    select * from SEAT_TB;
    --KTX ��� ���� ���̺�
    CREATE TABLE KTXRATEINFO_TB(
        TRAINNO	        NUMBER	    NOT NULL	PRIMARY KEY	,                           --�Ϸù�ȣ
        ADMINNO	        VARCHAR2(4)	NOT NULL	REFERENCES ADMIN_TB(ADMINNO)	,       --�����ȣ
        SEATDIVISION    VARCHAR2(60)NOT NULL,                                           --�¼�����
        ADULTRATE	    VARCHAR2(7)	NOT NULL,                                           --����
        CHILDRATE	    VARCHAR2(7)	NOT NULL,                                           --��̿��
        SENIORRATE	    VARCHAR2(7)	NOT NULL,                                           --����ڿ��
        FOREIGN KEY (SEATDIVISION) REFERENCES SEAT_TB(SEATDIVISION)
    ) nologging;
    
     /*KTX ��� ���� ���̺� ������*/
    CREATE SEQUENCE KTXRATEINFO_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    --�⵵������
    CREATE TABLE CITYACCOTTRAIN_TB(
        DEPID	        VARCHAR2(60)	NOT NULL,   --��߿�ID
        ARRID	        VARCHAR2(60)	NOT NULL,   --������ID
        DEPPLACENAME	VARCHAR2(200)	NOT NULL,   --��߿���
        ARRPLACENAME	VARCHAR2(200)	NOT NULL,   --��������
        CONSTRAINT CITYACCOTTRAIN_TB_KEY PRIMARY KEY (DEPID, ARRID, DEPPLACENAME, ARRPLACENAME)
    ) nologging;
    
    SELECT  TRAINNAME,	    
                           DEPPLACENAME,	
                           TO_CHAR(TO_DATE(SUBSTR(DEPPLANDTIME,9,4),'HH24mi'),'HH24"��"mi"��"') as depPlandTime, 
                           ARRPLACENAME,
                           TO_CHAR(TO_DATE(SUBSTR(ARRPLANDTIME,9,4),'HH24mi'),'HH24"��"mi"��"')	as arrPlandTime,
                           TAKETIME,
                           ROW_NUMBER() OVER( ORDER BY DEPPLANDTIME ASC) AS RN
                   FROM KTXINFO_TB
                   WHERE DEPPLACENAME = '����' AND ARRPLACENAME = '�λ�'
                            AND TO_DATE(SUBSTR(DEPPLANDTIME,1,10),'yyyymmddHH24') 
                            	BETWEEN TO_DATE('2017061200','YYYYMMDDHH24') 
                            	AND 	ROUND(TO_DATE('2017061200','YYYYMMDDHH24')+1);
    SELECT COUNT(*)
		FROM KTXINFO_TB
		WHERE DEPPLACENAME = '����' AND ARRPLACENAME = '�λ�'
             	AND TO_DATE(SUBSTR(DEPPLANDTIME,1,10),'yyyymmddHH24') 
             		BETWEEN TO_DATE('2017061200','YYYYMMDDHH24') 
             		AND 	ROUND(TO_DATE('2017061200','YYYYMMDDHH24')+1);
    --KTX����
        SELECT  COUNT(*)
        FROM KTXINFO_TB
        WHERE DEPPLACENAME = '����' AND ARRPLACENAME = '�λ�'
        AND TO_DATE(SUBSTR(DEPPLANDTIME,1,10),'yyyymmddHH24') >= TO_DATE('2017061200','YYYYMMDDHH24');
        
        SELECT *
        FROM(SELECT *
             FROM (SELECT  TRAINNAME,	    
                           DEPPLACENAME,	
                           TO_CHAR(TO_DATE(SUBSTR(DEPPLANDTIME,1,12),'YYMMDDHH24mi'),'YY"��"MM"��"DD"��"HH24"��"mi"��"') as depPlandTime, 
                           ARRPLACENAME,
                           TO_CHAR(TO_DATE(SUBSTR(ARRPLANDTIME,1,12),'YYMMDDHH24mi'),'YY"��"MM"��"DD"��"HH24"��"mi"��"')	as arrPlandTime,
                           TAKETIME,
                           ROW_NUMBER() OVER( ORDER BY depPlandTime ASC) AS RN
                   FROM KTXINFO_TB
                   WHERE DEPPLACENAME = '����' AND ARRPLACENAME = '�λ�'
                            AND  TO_DATE(SUBSTR(DEPPLANDTIME,1,10),'yyyymmddHH24') BETWEEN  TO_DATE('2017061200','YYYYMMDDHH24') AND ROUND(TO_DATE('2017061300','YYYYMMDDHH24')+1)
             )
         WHERE RN>=31 AND RN <= 40);
            
      
    CREATE TABLE KTXINFO_TB(
        TRAINNAME	    VARCHAR2(100)	NOT NULL	PRIMARY KEY	,               --������
        DEPPLACENAME	VARCHAR2(200)	NOT NULL,                               --��߿���
        DEPPLANDTIME	VARCHAR2(14)	NOT NULL,                               --��߽ð�
        ARRPLACENAME	VARCHAR2(200)	NOT NULL,                               --��������
        ARRPLANDTIME	VARCHAR2(14)	NOT NULL,                               --�����ð�
        TAKETIME	    VARCHAR2(7)	    NOT NULL                                --�ҿ�ð�
    ) nologging;
     SELECT * 
     FROM KTXINFO_TB
     WHERE to_date(SUBSTR(DEPPLANDTIME,1,8),'yyyymmdd') = TO_DATE('20170612','YYYYMMDD');
    SELECT TO_CHAR(SYSDATE, 'yyyymmdd') FROM dual;
    SELECT count(*)  from KTXINFO_TB;
    --�������̺�
    CREATE TABLE TICKETING_TB(
        TICKETINGNO	    NUMBER          NOT NULL	PRIMARY KEY,                        --���Ź�ȣ
        USERNO	        NUMBER	        NOT NULL	REFERENCES USER_TB(USERNO),         --ȸ����ȣ
        TRAINNAME	    VARCHAR2(100)	NOT NULL	REFERENCES KTXINFO_TB(TRAINNAME),   --������ȣ
        RIDEDATE	    DATE            NOT NULL,                                       --��������
        VEHICLEKNDNM	VARCHAR2(60)	DEFAULT 'KTX'	NOT NULL,                       --��������
        DEPPLACENAME	VARCHAR2(200)	NOT NULL,                                       --��߿�
        DEPPLANDTIME	VARCHAR2(14)	NOT NULL,                                       --��߽ð�
        ARRPLACENAME	VARCHAR2(200)	NOT NULL,                                       --������
        ARRPLANDTIME	VARCHAR2(14)	NOT NULL,                                       --�����ð�
        RESERVATIONNO	VARCHAR2(10)	NOT NULL,                                       --���Ÿż�
        RATE	        VARCHAR2(10)    NOT NULL,                                       --�ݾ�
        SEATDIVISION	VARCHAR2(60)    NOT NULL REFERENCES SEAT_TB(SEATDIVISION),      --�¼�����
        SEAT	        VARCHAR2(100)   NOT NULL,                                       --�¼�
        PASSENGERTYPE	VARCHAR2(100)   NOT NULL,                                       --�°�����
        TICKETINGDATE	DATE	        DEFAULT SYSDATE	NOT NULL,                       --��������
        TICKETINGETC	VARCHAR2(1)	    DEFAULT '0' 	NOT NULL                        --��� 0 - ���, 1 - ���, 2 - ����, 3 - �Ϸ�, 4 ? ����
    ) nologging;
    
    /*���� ���̺� ������*/
    CREATE SEQUENCE TICKETING_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
     /*KTX ��� ���� ���̺� ������*/
    CREATE SEQUENCE KTXINFO_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    /*KTX ���� ���̺� ������ �Լ�*/
    CREATE FUNCTION KTXINFO_TB_SEQ_FUNC RETURN NUMBER IS
    BEGIN
        RETURN KTXINFO_TB_SEQ.nextval;
    END;
    
    INSERT INTO SEAT_TB(SEATNO, SEATDIVISION,
                            SEATROW,
                            SEATCOLUMN)
                    VALUES (SEAT_TB_SEQ.NEXTVAL,'�Ϲ�', 4,15);
    INSERT INTO SEAT_TB(SEATNO, SEATDIVISION,
                            SEATROW,
                            SEATCOLUMN)
                    VALUES (SEAT_TB_SEQ.NEXTVAL,'Ư��', 3,11);
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
                     '����', 
                     '010-1234-5678', 
                     '1990-01-01',
                     'user@email.com', 
                     '��', 
                     '�����',
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
                     '����1', 
                     '010-4567-5678', 
                     '1990-01-01',
                     'user1@email.com', 
                     '��', 
                     '�����',
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
                     '����1', 
                     '010-4567-1238', 
                     '1990-01-01',
                     'user2@email.com', 
                     '��', 
                     '�����',
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
                     '����1', 
                     '010-4567-5678', 
                     '1990-01-01',
                     'user3@email.com', 
                     '��', 
                     '�����',
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
                     '����1', 
                     '010-1236-5678', 
                     '1990-01-01',
                     'user4@email.com', 
                     '��', 
                     '�����',
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
                     '����1', 
                     '010-4565-5678', 
                     '1990-01-01',
                     'user5@email.com', 
                     '��', 
                     '�����',
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
        '������',
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
        '������1',
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
        '������',
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
        '������',
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
        '������',
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
        '������',
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
                            '������',
                            '���������׽�Ʈ������1',
                            '���������׽�Ʈ �۳���1',
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
                            '������',
                            '���������׽�Ʈ������2',
                            '���������׽�Ʈ �۳���2',
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
                            '������',
                            '���������׽�Ʈ������3',
                            '���������׽�Ʈ �۳���3',
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
                                '������',
                                '���������׽�Ʈ������4',
                                '���������׽�Ʈ �۳���4',
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
                            '������',
                            '���������׽�Ʈ������5',
                            '���������׽�Ʈ �۳���5',
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
                            '������',
                            '�̺�Ʈ��',
                            '�̺�Ʈ ����',
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
                            '������',
                            '���ֹ�������1',
                            '���ֹ������� ����1'
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
                            '������',
                            '���ֹ�������2',
                            '���ֹ������� ����2'
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
                            '������',
                            '���ֹ�������3',
                            '���ֹ������� ����3'
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
                            '������',
                            '���ֹ�������4',
                            '���ֹ������� ����4'
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
                            '������',
                            '���ֹ�������5',
                            '���ֹ������� ����5'
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
                       '����1',
                       'QNA����',
                       'QNA��',
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
                       '����2',
                       'QNA����1',
                       'QNA��1',
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
                       '����3',
                       'QNA����2',
                       'QNA��2',
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
                       '����4',
                       'QNA����3',
                       'QNA��3',
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
                       '����1',
                       'QNA����4',
                       'QNA��4',
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
                       '������',
                       'QNA�亯1',
                       'QNA�亯1',
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
                                '�Ϲ�',
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
                                'Ư��',
                                '83700',
                                '53800',
                                '83700');
                                