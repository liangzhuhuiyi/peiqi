CREATE DATABASE peiqi
go
use peiqi
drop table admin

--����Ա
create table admin(
	id int identity(1001,1) primary key  not null ,--����
	adminname varchar(100)UNIQUE not null, --����Ա�˺�
	adminpass varchar(100) not null ,--����Ա����
) 

insert into admin(adminname,adminpass) values('admin','123456');
select*from admin;


 
select *from Userinfo
insert into Userinfo (number, upass,idcard) values (123,123,123);
drop table Userinfo

--�û���Ϣ��
create table Userinfo(
	id int identity(1001,1) primary key  not null ,--����
	number varchar(100) UNIQUE not null,--�˺�
	username  varchar(100) UNIQUE   null,-- �û���
	upass varchar(100) not null,-- ����
	uname varchar(100)   null,-- ����
	phone varchar(100) UNIQUE null,-- �ֻ�
	sex varchar(100)  null,-- �Ա�
	age varchar(100)  null,-- ����
	[address] varchar(100)  null,-- ��ͥסַ
	idcard varchar(100) UNIQUE  null ,--���֤
	insertDate datetime default getdate() null ,--ע��ʱ��
	headPic varchar(100)  null ,-- ͷ��
	grade varchar(100)  null ,--�ȼ�
	authority varchar(100)  null ,--����Ȩ��
	Purview varchar(100)  null ,--����Ȩ��
) 


--�ҵ���Ϣ
create table information(
	 id int identity(1001,1) primary key  not null ,--����
	customerId int  foreign key references Userinfo(id) not null,-- �û�id
	title varchar(100)  null,-- ����
	pic varchar(100)  null,-- ͼƬ
	content varchar(100)  null,-- ����
	insertDate datetime default getdate() not null, ---��������
	nologin varchar(100)default'��'  null, --�ο��Ƿ�ɼ�
	scores varchar(100) default'100' null,--��Ա����
	plateid int foreign key references plate(id)  null ,--��̳���ID
) 
select *from information


drop table instruction
--��̳˵��
create table instruction (
    id int identity(1001,1) primary key  not null ,--����
	title varchar(100)  null,-- ��̳˵��
) 
select * from instruction


drop table plate
--��̳���
create table plate(
	id int identity(1001,1) primary key  not  null,--����
	bkName varchar(100)  null,-- �������
)



drop table comment
--������Ϣ��
create table comment(
	 id int identity(1001,1) primary key  not null ,--����
	messageid int foreign key references information(id) null ,-- ������Ϣ
	Userinfoid int foreign key references Userinfo(id) null,-- �û�ID
	content varchar(100)  null,--��������
	commentDate datetime default getdate() null,-- ��������
) 
select *from comment

drop table information




--��������
create table friendlink(
 id int identity(1001,1) primary key  not null ,--����
 linkltype int null,--����
 linkaddress varchar(100) null,--��ַ
 linkinfo varchar(100) null,--��վlogo
 linkexplain varchar(200) null,--˵��
 linktime datetime default getdate() null,-- ����
 linkname varchar(100) null--��������

)


