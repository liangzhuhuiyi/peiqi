


--����Ա
create table admin(
	id int identity(1001,1) primary key  not null ,--����
	adminname varchar(100)UNIQUE not null, --����Ա�˺�
	adminpass varchar(100) not null ,--����Ա����
) 

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
	scores varchar(100) default'0' null,--��Ա����
	plateid int foreign key references plate(id)  null ,--��̳���ID
	
)

--��̳���
create table plate(
	id int identity(1001,1) primary key  not  null,--����
	bkName varchar(100)  null,-- �������
)

--������Ϣ��
create table information(
	id int identity(1001,1) primary key  not null ,--����
    plateid int foreign key references plate(id),--�������
   	Userinfoid int foreign key references Userinfo(id)  null ,--�û�ID
    title varchar(100)  null,-- ����
    pic varchar(100)  null,-- ͼƬ
	content text  not null,-- ����
	clickcount varchar(100) default'0'null ,--�����
	insertDate datetime default getdate() not null, ---��������
	nologin varchar(100)default'��'  null, --�ο��Ƿ�ɼ�
	
) 

--������Ϣ��
create table comment(
	 id int identity(1001,1) primary key  not null ,--����
	messageid int foreign key references information(id) null ,-- ������Ϣ
	Userinfoid int foreign key references Userinfo(id) null,-- �û�ID
	content varchar(100)  null,--��������
	commentDate datetime default getdate() null,-- ��������
)

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



drop table admin

drop table Userinfo

drop table plate

drop table information

drop table comment

drop table friendlink