--------------------------------------------------------
--  ������ ������ - �����-7��-13-2017   
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
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (41,'001','������','Q. ȸ�����ī��� ����ī�� �� �������� ī���ȣ�� �����ؼ� ����� �� �ֳ���?','�ڷ������� ��� ���� �޴� ���� �� ���־��� ī�� ���� �޴����� �ִ� �ſ�ī�� ��ȣ �� ���� ī�庰Ī�� �Բ� ������ ���� �� �ֽ��ϴ�. ������ ���� �ſ�ī���ȣ�� ������ �Ǵ� �����ǰ ���� �� �ſ�ī�� ��ȣ �Է��� ���ŷο� ���� �Է��� ���Ǹ� �����մϴ�.<br>
                                               	��, �ſ�ī�� ����(�ſ�ī���ȣ, ��ȿ�Ⱓ)�� ������ ������� �����Ƿ� ������ ���� �� �� ������, ���� �� ���� ��й�ȣ�� ���� �Է��ϼž� �մϴ�.
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (42,'001','������','Q. ������ ������� �����ΰ���?','<p>�������� �������� ���� �ǹ��մϴ�.</p>

<p>������ ����&nbsp;�� ���� ���� ��� Ȥ�� ȯ���� �� ��� ������ �� �� �ֽ��ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (43,'001','������','Q. �����Ǵ� ���� ������ �����ð��� �ݿ� �� ������ ���� �ð��� �˰� �;��.','<p>���� ��ȸ �� ������ ���� �Ǿ��� ��� ��ȸ ������� �������� �ź��� ���������� ǥ�����ݴϴ�. ���� ��ȸȭ�鿡�� �����ð��� �����Ͻø� ���� �� �ð��� �ݿ��� ���� �ð�ǥ�� Ȯ�� �Ͻ� �� �ֽ��ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (44,'001','������','Q. �ڷ��������� �������� �����ϰ� �;��.','<p>������ �߱� ����, ������ Ȯ�� &rarr; �����ϱ⸦ �����ϸ� ���� ���� ȸ�� ���� �Է� �� �������� ������ �� �ֽ��ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (45,'001','������','Q. ���� �� ����Ʈ KTX ���ϸ���/����Ʈ�� ��� ��� �ϳ���?','<p>KTX ���ϸ���/����Ʈ�� ���� ȭ�鿡�� ������ �� ��� ������ KTX ���ϸ��� ������ Ȯ���ϰ�, �� �� �ϳ��� �����Ͽ� ��� �Ͻ� �� �ֽ��ϴ�.</p>

<p>KTX ���ϸ���, ����ܸӴ�(���), OKĳ�ù� ����Ʈ�� ���� �ݾ��� �����Ǵ� ���� ����̸�, ��Ƽ����Ʈ�� ���� ���� �ſ�ī�� û�� ���� ���·� ��� �˴ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (46,'001','������','Q. ��������� ���� �� ������ ��� �ϳ���?','<p>�����/�н� &rarr; ��������� �޴����� ��ȸ �� ���� ���� �Ͻ� �� �ֽ��ϴ�. ����������� ���� ���������� �α��� �Ͻ� �� ���ɿ� �´� �����Ǹ� ��ȸ �����ϸ�, �߱� �Ŀ��� ǥ��� ���� ���Ͽ� ����ϼž� �մϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (47,'001','������','Q. ��ȯ������ �ȳ�','<p>������ �������� ��ȯ�ϴ� ��� ��ȯ������ ���� ��ȯ�����ᰡ �߻��մϴ�. �ڼ��� ������ �ڷ��� Ȩ�������� �����Ͻ� �� �ֽ��ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (48,'001','������','Q. ��� ����Ʈ������ �̿� �����Ѱ���?','<p>����Ʈ���� �ü���� &#39;�ȵ���̵�&#39;, &#39;iOS&#39;�� ��쿡 �̿��� �����մϴ�.</p>

<p>&nbsp;</p>

<p>�ٸ�, ������ �� �Ϻ� ����Ʈ���� ���Ӱ� ��õǴ� ����Ʈ�� �� �Ϻδ� �ػ� ���� ���̷� ���� �̿��� �Ұ��� �� ������ �����Ͻñ� �ٶ��ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (49,'001','������','Q. �ڷ�����(ö�������� ����)���� ���೻���� ������ �� �ֳ���?','<p>�ڷ�����(ö�������� ����)������ ���� �� ���೻���� ������ �� �����ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (50,'001','������','Q. ���ã�� ������ ����� �� �ֳ���?','<p>��ܿ��� �޴� ���� &rarr; ���ã�� ���� ���� �޴����� ���� �̿��ϴ� ��߿��� �������� ������ �� �ֽ��ϴ�. ������ �� ������ ������ ���Ÿ� ���� �� �˻��� Ȯ�� �� ������ �� �ֽ��ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (51,'001','������','Q. ������ ������ ������� �Ǵ� ���������?','<p>�ڷ������� ��� ���� ���������� ���� &rarr; ���� ������ ��ȸ�޴����� ����Ϸ�� �������� ����� �� ������, �ڷ����忡���� �ſ�ī��� �Ϻ� �����ǿ� ���� KTX ���ϸ���/����Ʈ ������ �����մϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (52,'001','������','Q. �߱��� �������� ��ȯ �����?','<p>�ڷ������� ������ Ȯ�� &rarr; ��ȯ�ϱ� ��ư���� �߱��� �������� ����� �� ������ ���&middot;��ȯ ������ �߻��� �ڷ����忡���� ���������� �Ǵ� ���ϸ����� ������ �� �ֽ��ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (53,'001','������','Q. ���ͳݿ��� ������ �������� ����Ʈ������ ����, �߱��� �� �ֳ���?','<p>�ڷ������� ���� ������ ��ȸ&middot;��� �޴����� ���ͳ����� ������ �����ǵ� ����Ʈ������ ����(�߱�)�� �� �ֽ��ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (54,'001','������','Q. ȨƼ�ϵ� ����Ʈ������ ��ȸ �� ��ȯ�� �����Ѱ���?','<p>����Ʈ�������� ����Ʈ������������ �߱��� ������ Ȯ���� �����ϸ�, ȨƼ������ ��ȸ���� �����Ƿ� ��ȯ�� �Ұ����մϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (55,'001','������','Q. �����ð�, ���೻�� ���� ��ȸ���� �ʽ��ϴ�.','<p>������ �����ڰ� ���� ���೻�� ���� ��ȸ�� �ʾ����� ��쵵 �ֽ��ϴ�. �׷��� ��κ��� �������ͳ�(��������)�� �Ҿ����� ������ �������� ���ϴ� ���� ��ȭ��(3G)�� ��ȯ�Ͽ� �ٽ� �õ��Ͻñ� �ٶ��ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (56,'001','������','Q. ������ �߰� �Ϸ��� ��� �ؾ� �ϳ���?','<p>�����ο��� ���� �Ͻø� ���� �°� ������ �ο����� �Է��ϰ�, �Ʒ��� ������ ���� �Ͻø� �˴ϴ�.</p>

<p>�����ο� ���� &rarr; ������ȸ &rarr; �����ϱ� &rarr; �����ϱ� &rarr; �������� ���� ��, �ϴ��� ���� ��ư���� ���� �����մϴ�.</p>

<p>�����밡�� ���� ����: ����������, ��������, ȸ������ ��</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (57,'001','������','Q. ����Ʈ�������� �������� ��� �߱� ���� �� �ֳ���?','<p>����Ʈ���������� �������� �ڷ��� Ȩ������(www.letskorail.com)���� �߱� ���� �� �ֽ��ϴ�.</p>

<p>- �ڷ��ϸ���� : ������ &gt; �߱�/���/���� &gt; �̿볻��/��������ȸ</p>

<p>- �̵�ϰ� : ������ &gt; �̵�ϰ����� &gt; �̿볻��/���������</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (58,'001','������','Q. ������, �����е�ε� ����Ʈ���������� �߱��� �� �ֳ���?','<p>��ȭ�� ����� ���� ������, �����е� ���� ��⿡���� �������ͳ�(��������)�� �̿��Ͽ� ����Ʈ���� �����ϰ� �ڷ�����(ö�������� ����)�� ��ġ�Ͽ� ����Ʈ���������� ����&middot;�߱��� �� ������, ���� ������ �������� Ȯ���� �� ���� ������ �߻��ϹǷ� ȨƼ�� �� �ٸ� �������� �̿��Ͻñ� �ٶ��ϴ�. (ö�������� ���������� ������ ��û�ϴ� ����� ������ �����ϴ� ���� �Ұ����մϴ�)</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (59,'001','������','Q. ������ �̿��Ҷ� ����Ʈ���� �޴��ؾ� �ϳ���?','<p>������ �̿��� ������ �ݵ�� �������� �����Ͽ��� �ϹǷ� ����Ʈ���������� ��ȸ�� ���� ����Ʈ���� �ݵ�� �����Ͽ��� �մϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (60,'001','������','Q. ������Ȯ���� �ȵ˴ϴ�. ������ �������� ������ �ʳ׿�.','<p>�ڷ����忡�� ����&middot;�߱��� �������� ������ ����Ʈ�������� ��ȸ�� �����մϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (61,'001','������','Q. ����Ʈ������ �߱��� ������ �����Ǿ����ϴ�. ��� ���ι��� �� �������?','<p>�����Ͻ� ������ ������ ���, �ش� ���������� ������ ������ �ްų�, �������������� ����� �� �ֽ��ϴ�.</p>

<p>&nbsp;</p>

<p>������Ȯ�� &rarr; ������ �����̷��� Ȯ���ϸ� ������&ldquo;����&rdquo;ǥ�ð� �Ǿ� �ֽ��ϴ�.</p>

<p>&nbsp;</p>

<p>�� �������� ��â���� �����ϸ� ������ ������ ���� �� �ְ�,</p>

<p>&nbsp;</p>

<p>�������������� ���������� ��� ��ư�� �����ϸ� ������ ���� �� �ֽ��ϴ�.</p>

<p>&nbsp;</p>

<p>���� ������ �����̷¿��� ��ȯ, ����������, �����ǵ� ���еǾ� ��ȸ�Ǵ�, �����Ͻñ� �ٶ��ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (62,'001','������','Q. ��߿� �Ǵ� ������ ã��','<p>��߿�, �������� �⺻���δ� ����-�λ����� �����Ǿ� �ְ�, &quot;����&quot;�� �����ϸ�, ����, ���ã�� ����, �ֿ俪 ������</p>

<p>&nbsp;</p>

<p>��ȸ�Ҽ� ������, ������ �ʼ� �Ǵ� ��ü�� ��ȸ�� �����ϰ�, �������� ��, ��, �� �� �����ϸ�</p>

<p>�ش� �������� �����ϴ� ���� ã���Ǽ� �ֽ��ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (63,'001','������','Q. �ڵ� �α��� ����� �ֳ���?','<p>�α��� ȭ�鿡 &quot;�ڵ��α���&quot;����� �ֽ��ϴ�.</p>

<p>�ڵ��α����� �����ϸ�, ������ �޴���ȭ�� ȸ����ȣ�� ��й�ȣ�� ��ȣȭ�ؼ� �����ϰ�</p>

<p>�����̳� ������ Ȯ���Ҷ� �ڵ����� �α����� �Ǿ�, ȸ����ȣ�� ��й�ȣ�� �Է����� �ʾƵ� �����մϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (64,'001','������','Q. ȸ����ȣ/��й�ȣ�� �𸦶��� ��� �ϳ���?','<p>�α��� ȭ�鿡�� ȸ����ȣ ã�� �Ǵ� ��й�ȣ ã�⸦ ���� �� ���������� �Ϸ� ��, ȸ����ȣ ã�� �Ǵ� ��й�ȣ ������ �� �� �ֽ��ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (65,'001','������','Q. ����, �߱� �� ��ȯ�ð���?','<p>����� �ٷ� �߱��ϼž� �մϴ�.</p>

<p>����Ʈ�� �������� ������߽ð����� ��ȯ�� �� �ֽ��ϴ�.</p>

<p>����Ʈ�� �������� �ڷ��� Ȩ������(www.letskorail.com)������ ���� ��� �� ��ȯ�� �����մϴ�.</p>

<p>- Ȩ������&gt;������&gt;�߱�/���/����(��ȯ)</p>

<p>��� �� ��ȯ�� �����ð� ������ �� â�������� �����մϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (66,'001','������','Q. �������� ���߱ǡ����� ������ �� �ǳ���?','<p>�������� ��۰�࿡ ���� ��ǥ�μ� �ݵ�� ������ �����ϱ� ���� &lsquo;�߱�&rsquo;�Ͽ� �޴��Ͽ��� �մϴ�.</p>

<p>&lsquo;�߱�&rsquo;�̶� ����(�������)�� ��ǰ(������)�� �޴� �����μ� &lsquo;�߱�&rsquo;���� �����ø� ������ �̿��� �ǻ簡 ���� ������ ���� ������߽ð��� �ڵ����� ����ϰ� ������(15%)�� �ΰ��˴ϴ�.</p>
',to_date('17/07/10','RR/MM/DD'));
Insert into KORAIL.FAQ_TB (FAQNO,ADMINNO,ADMINNAME,FAQTITLE,FAQCONTENT,FAQREGDATE) values (67,'001','������','Q. ����Ʈ���������̶�?','<p>����Ʈ���� �ڷ�����(ö�������� ����) ���ø����̼��� �̿��Ͽ� ����Ʈ������ �߱� ���� �������Դϴ�.</p>

<p>�� �۽����(������) �Ǵ� �ȵ���̵帶��(�ȵ���̵���) ��� &lsquo;�ڷ�����&rsquo;, &lsquo;ö��&rsquo;, &lsquo;�ڷ���&rsquo;�� �˻��Ͽ� ���ø����̼��� �ٿ� ���� �� �ֽ��ϴ�.</p>
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
