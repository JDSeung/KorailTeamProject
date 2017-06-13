CREATE TABLE ADMIN_DB(
    ID VARCHAR2(50),
    PW VARCHAR2(1000)
);insert into ADMIN_DB values ('test','1234');
commit;
select * from admin_tb where ID ='test' and pw='1234';
