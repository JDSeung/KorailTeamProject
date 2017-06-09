    /*ȸ�� ���̺�*/
    CREATE TABLE USER_TB(
        USERNO	            NUMBER NOT NULL PRIMARY KEY,	--ȸ����ȣ
        USERID	            VARCHAR2(15) UNIQUE,      	    --���̵�
        USERPW	            VARCHAR2(1000) NOT NULL,	    --��й�ȣ
        USERNAME	        VARCHAR2(15) NOT NULL,	        --����
        USERPHONE	        VARCHAR2(13) NOT NULL UNIQUE,	--��ȭ��ȣ
        USERBIRTH	        DATE NOT NULL,	                --�������
        USEREMAIL	        VARCHAR2(50) NOT NULL,	        --�̸���
        USERGENDER	        VARCHAR2(2),	                --����
        USERADDR	        VARCHAR2(1000) NOT NULL,	    --�ּ�
        USERJOINAGREE	    VARCHAR2(1) NOT NULL,	        --��3����������
        USERINFOAGREE	    VARCHAR2(1) NOT NULL,	        --������������
        USERETC	            VARCHAR2(1),                    --���
        USERJOINDATE DATE DEFAULT SYSDATE NOT NULL
    );
    
                    
    /*ȸ�� ���̺� ������*/
    CREATE SEQUENCE USER_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    /*������ ���̺�*/
    CREATE TABLE ADMIN_TB(
        ADMINNO				VARCHAR2(4)     NOT NULL PRIMARY KEY,	--�����ȣ
        ADMINID				VARCHAR2(15)    NOT NULL UNIQUE, 	    --���̵�
        ADMINPW				VARCHAR2(1000)  NOT NULL,			    --��й�ȣ
        ADMINNAME			VARCHAR2(20)    NOT NULL,			    --�����
        ADMINGRADE			VARCHAR2(10)    NOT NULL			    --������
    );
    
    
    
    /*�������� ���̺�*/
    CREATE TABLE NOTICE_TB(
        NOTICENO	            NUMBER          NOT NULL	PRIMARY KEY,		            --�۹�ȣ
        ADMINNO			        VARCHAR2(4)    NOT NULL REFERENCES ADMIN_TB(ADMINNO),		--�����ȣ
        ADMINNAME		        VARCHAR2(20)    NOT NULL,			                        --�����
        NOTICETITLE			    VARCHAR2(50)    NOT NULL,			                        --������
        NOTICECONTENT			VARCHAR2(4000)  NOT NULL,			                        --�۳���
        NOTICEREGDATE			DATE            DEFAULT SYSDATE  NOT NULL,			        --�ۼ���
        NOTICEATTACHMENTS		VARCHAR2(100)   DEFAULT 'N' NOT NULL, 			            --÷������
        NOTICETBETC             VARCHAR2(1)     NOT NULL                                    --���
    );
    
    /*�������� ���̺� ������*/
    CREATE SEQUENCE NOTICE_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    /*FQA ���̺�*/
    CREATE TABLE FAQ_TB(
        FAQNO		NUMBER          NOT NULL PRIMARY KEY,                       --�۹�ȣ
        ADMINNO		VARCHAR2(15)	NOT NULL REFERENCES ADMIN_TB(ADMINNO),       --�����ȣ
        ADMINNAME	VARCHAR2(20)	NOT NULL,		                            --�����
        FAQTITLE	VARCHAR2(100)	NOT NULL,		                            --������
        FAQCONTENT	VARCHAR2(4000)	NOT NULL,		                            --�۳���
        FAQREGDATE	DATE		    DEFAULT SYSDATE NOT NULL                    --�ۼ���
    );
    
    
    /*FAQ ���̺� ������*/
    CREATE SEQUENCE FAQ_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    /*QNA ���̺�*/
    CREATE TABLE QNA_TB(
        QNANO		    NUMBER          NOT NULL PRIMARY KEY,			        --�Ϸù�ȣ
        USERNO		    NUMBER			NOT NULL REFERENCES USER_TB(USERNO),    --ȸ����ȣ
        ADMINNO		    VARCHAR2(4)	    DEFAULT '001' NOT NULL REFERENCES ADMIN_TB(ADMINNO),  --�����ȣ
        POSTNO		    NUMBER			,                               --�Խñ۹�ȣ
        QNAWRITER		VARCHAR2(30)	NOT NULL,		                        --�ۼ���
        QNAREGDATE		DATE			DEFAULT SYSDATE NOT NULL,               --�ۼ���
        QNATITLE		VARCHAR2(100)	NOT NULL,		                        --����
        QNACONTENT		VARCHAR2(4000)	NOT NULL,		                        --����
        QNAATTACHMENTS	VARCHAR2(100)	NOT NULL,		                        --÷������
        ISPUBLIC		VARCHAR2(1)		DEFAULT 0 NOT NULL  	                --�۰�������
    );
    
    /*QNA ���̺� ������*/
    CREATE SEQUENCE QNA_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    /*CITYACCOTTRAIN_TB ���̺�*/
    CREATE TABLE CITYACCOTTRAIN_TB(
        NODEID		    VARCHAR2(60)     NOT NULL PRIMARY KEY,			        --������ID
        NODENAME	    VARCHAR2(200)    NOT NULL,                              --��������
        GYEONBU      VARCHAR2(1),
        GYEONGJEON       VARCHAR2(1),
        HONAM           VARCHAR2(1),
        JEOLLA          VARCHAR2(1)
    ) nologging;
    
    select * from CITYACCOTTRAIN_TB where NODENAME like '��';
    
  
    /*KTX ����*/
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
    /*KTX ��� ���� ���̺� ������*/
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
     /*KTX ��� ���� ���̺�*/
    CREATE TABLE KTXRATEINFO_TB(
        TRAINNO             NUMBER          PRIMARY KEY,
        TRAINNAME		    NUMBER		    NOT NULL REFERENCES KTXINFO_TB(TRAINNAME),  --����ȣ��
        ADMINNO		        VARCHAR2(4)     NOT NULL REFERENCES ADMIN_TB(ADMINNO),      --�����ȣ
        SEATNO		        NUMBER		    NOT NULL,           	           	        --�¼���ȣ
        VIPADULTRATE	    VARCHAR2(7)	    NOT NULL,                          	        --Ư�Ǿ��� ���ڷ� ���� �ƴϸ� �׳� ���ڷ� ������?
        VIPCHILDRATE	    VARCHAR2(7)	    NOT NULL,                          	        --Ư�� ��̿��
        VIPSENIORRATE	    VARCHAR2(7)     NOT NULL,                         	        --Ư�� ����ڿ��
        STANDARDADULTRATE	VARCHAR2(7)	    NOT NULL,                          	        --�Ϲݽ� ���� ���ڷ� ���� �ƴϸ� �׳� ���ڷ� ������?
        STANDARDCHILDRATE	VARCHAR2(7)	    NOT NULL,                          	        --�Ϲݽ� ��̿��
        STANDARDSENIORRATE	VARCHAR2(7)     NOT NULL                         	        --�Ϲݽ� ����ڿ��
    );
     /*KTX ��� ���� ���̺� ������*/
    CREATE SEQUENCE KTXRATEINFO_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    
    /*���� ���̺�*/
    CREATE TABLE TICKETING_TB(
        TICKETNO		NUMBER          NOT NULL PRIMARY KEY,			                --���Ź�ȣ
        USERNO			NUMBER          NOT NULL REFERENCES USER_TB(USERNO),	        --ȸ����ȣ
        TRAINNAME		NUMBER		    NOT NULL REFERENCES KTXINFO_TB(TRAINNAME),      --����ȣ��
        RIDEDATE		DATE            NOT NULL,								        --��������
        VEHICLEKNDID	VARCHAR2(4)     NOT NULL,								        --������ȣ
        VEHICLEKNDNM	VARCHAR2(60)    NOT NULL,								        --��������
        DEPPLACENAME	VARCHAR2(200)   NOT NULL,								        --��߿�
        DEPPLANDTIME	VARCHAR2(14)    NOT NULL,								        --��߽ð�
        ARRPLACENAME	VARCHAR2(200)   NOT NULL,								        --������
        ARRPLANDTIME	VARCHAR2(14)    NOT NULL,								        --�����ð�
        RESERVATIONNO	VARCHAR2(10)    NOT NULL,								        --����ż�
        RATE			VARCHAR2(10)    NOT NULL,								        --�ݾ�
        ROOMRATING		VARCHAR2(50)    NOT NULL,								        --���ǵ��
        SEATINFO		VARCHAR2(50)    NOT NULL,								        --�¼�����
        PASSENGERTYPE	VARCHAR2(100)   NOT NULL,								        --�°�����
        TICKETINGETC    VARCHAR2(1)     NOT NULL                                        --���
    );
    
    /*���� ���̺� ������*/
    CREATE SEQUENCE TICKETING_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    /*�¼� ����*/
    CREATE TABLE SEATINFO_TB(
        SEATDIV VARCHAR2(10) NOT NULL PRIMARY KEY,
        SEATROW NUMBER NOT NULL,
        SEATCOLUMN NUMBER NOT NULL
    );
    SELECT * FROM SEATINFO_TB;
    INSERT INTO SEATINFO_TB(SEATDIV,
                            SEATROW,
                            SEATCOLUMN)
                    VALUES ('�Ϲݽ�', 4,15);
    INSERT INTO SEATINFO_TB(SEATDIV,
                            SEATROW,
                            SEATCOLUMN)
                    VALUES ('Ư��', 3,11);
   SELECT * 
    FROM KTXINFO_TB
    WHERE DEPPLACENAME = '����' AND ARRPLACENAME = '������';
    
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
        '002',
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
        '003',
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
        '004',
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
        '005',
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
                            NOTICETBETC)
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
                            NOTICETBETC)
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
                            NOTICETBETC)
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
                                NOTICETBETC)
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
                            NOTICETBETC)
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
                            NOTICETBETC)
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
                       2,
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