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
    
    /*KTX ��� ���� ���̺�*/
    CREATE TABLE KTXRATEINFO_TB(
        TRAINNO		        NUMBER		    NOT NULL PRIMARY KEY,                       --����ȣ��
        ADMINNO		        VARCHAR2(4)    NOT NULL REFERENCES ADMINTB(ADMINNO),       --�����ȣ
        SEATNO		        NUMBER		    NOT NULL,           	           	        --�¼���ȣ
        VIPADULTRATE	    VARCHAR2(7)	    NOT NULL,                          	        --Ư�Ǿ��� ���ڷ� ���� �ƴϸ� �׳� ���ڷ� ������?
        VIPCHILDRATE	    VARCHAR2(7)	    NOT NULL,                          	        --Ư�� ��̿��
        VIPSENIORRATE	    VARCHAR2(7)     NOT NULL,                         	        --Ư�� ����ڿ��
        STANDARDADULTRATE	VARCHAR2(7)	    NOT NULL,                          	        --�Ϲݽ� ���� ���ڷ� ���� �ƴϸ� �׳� ���ڷ� ������?
        STANDARDCHILDRATE	VARCHAR2(7)	    NOT NULL,                          	        --�Ϲݽ� ��̿��
        STANDARDSENIORRATE	VARCHAR2(7)     NOT NULL                         	        --�Ϲݽ� ����ڿ��
    );
    
    /*���� ���̺�*/
    CREATE TABLE TICKETING_TB(
        TICKETNO		NUMBER          NOT NULL PRIMARY KEY,			        --���Ź�ȣ
        USERNO			NUMBER          NOT NULL REFERENCES USERTB(USERNO),		--ȸ����ȣ
        TRAINNO			VARCHAR2(2)     NOT NULL,	                            --����ȣ��
        RIDEDATE		DATE            NOT NULL,								--��������
        VEHICLEKNDID	VARCHAR2(4)     NOT NULL,								--������ȣ
        VEHICLEKNDNM	VARCHAR2(60)    NOT NULL,								--��������
        DEPPLACENAME	VARCHAR2(200)   NOT NULL,								--��߿�
        DEPPLANDTIME	VARCHAR2(14)    NOT NULL,								--��߽ð�
        ARRPLACENAME	VARCHAR2(200)   NOT NULL,								--������
        ARRPLANDTIME	VARCHAR2(14)    NOT NULL,								--�����ð�
        RESERVATIONNO	VARCHAR2(10)    NOT NULL,								--����ż�
        RATE			VARCHAR2(10)    NOT NULL,								--�ݾ�
        ROOMRATING		VARCHAR2(50)    NOT NULL,								--���ǵ��
        SEATINFO		VARCHAR2(50)    NOT NULL,								--�¼�����
        PASSENGERTYPE	VARCHAR2(100)   NOT NULL,								--�°�����
        TICKETINGETC    VARCHAR2(1)     NOT NULL                                --���
    );
    
    /*���� ���̺� ������*/
    CREATE SEQUENCE TICKETING_TB_SEQ
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1 
    NOCYCLE;
    
    /*�������� ���̺�*/
    CREATE TABLE NOTICE_TB(
        NOTICENO	            NUMBER          NOT NULL	PRIMARY KEY,		            --�۹�ȣ
        ADMINNO			        VARCHAR2(4)    NOT NULL REFERENCES ADMINTB(ADMINNO),		--�����ȣ
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
        ADMINNO		VARCHAR2(15)	NOT NULL REFERENCES ADMINTB(ADMINNO),       --�����ȣ
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
        USERNO		    NUMBER			NOT NULL REFERENCES USERTB(USERNO),     --ȸ����ȣ
        ADMINNO		    VARCHAR2(4)	NOT NULL REFERENCES ADMINTB(ADMINNO),   --�����ȣ
        POSTNO		    NUMBER			NOT NULL,                               --�Խñ۹�ȣ
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
    
    drop table CITYACCOTTRAIN_TB;
    /*CITYACCOTTRAIN_TB ���̺�*/
    CREATE TABLE CITYACCOTTRAIN_TB(
        NODEID		    VARCHAR2(60)     NOT NULL PRIMARY KEY,			        --������ID
        NODENAME	    VARCHAR2(200)    NOT NULL,                              --��������
        GYEONBU      VARCHAR2(1),
        GYEONGJEON       VARCHAR2(1),
        HONAM           VARCHAR2(1),
        JEOLLA          VARCHAR2(1)
    ) nologging;
    
    
    select * from CITYACCOTTRAIN_TB;
   
    select count(nodeid) from CITYACCOTTRAIN_TB;
    commit;
    /*KTX ����*/
    drop TABLE KTXINFO_TB;
    CREATE TABLE KTXINFO_TB(
        TRAINNAME NUMBER NOT NULL PRIMARY KEY,
        DEPPLACENAME VARCHAR2(200)   NOT NULL,
        DEPPLANDTIME VARCHAR2(14)   NOT NULL,
        ARRPLACENAME VARCHAR2(200)  NOT NULL,
        ARRPlANDTIME VARCHAR2(14)   NOT NULL,
        TAKETIME VARCHAR2(7)    NOT NULL
    ) nologging;
    /*FAQ ���̺� ������*/
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
   /*�׽�Ʈ��*/
   /*===============================================*/
    CREATE TABLE KTXINFO_TB_TEST AS SELECT * FROM KTXINFO_TB;
    select * from KTXINFO_TB_TEST;
    select count(*) from KTXINFO_TB_TEST;
    delete from KTXINFO_TB_TEST;
    select count(*),DEPPLACENAME, ARRPLACENAME from KTXINFO_TB_TEST
    group by DEPPLACENAME, ARRPLACENAME;
 select * from CITYTEST_TB;
 
 SELECT * FROM CITYTEST_TB where JEOLLA != '0';
 