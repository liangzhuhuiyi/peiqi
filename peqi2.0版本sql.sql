CREATE DATABASE peiqi
go
use peiqi
drop table admin

--管理员
create table admin(
	id int identity(1001,1) primary key  not null ,--主键
	adminname varchar(100)UNIQUE not null, --管理员账号
	adminpass varchar(100) not null ,--管理员密码
) 

insert into admin(adminname,adminpass) values('admin','123456');
select*from admin;


 
select *from Userinfo
insert into Userinfo (number, upass,idcard) values (123,123,123);
drop table Userinfo

--用户信息表
create table Userinfo(
	id int identity(1001,1) primary key  not null ,--主键
	number varchar(100) UNIQUE not null,--账号
	username  varchar(100) UNIQUE   null,-- 用户名
	upass varchar(100) not null,-- 密码
	uname varchar(100)   null,-- 姓名
	phone varchar(100) UNIQUE null,-- 手机
	sex varchar(100)  null,-- 性别
	age varchar(100)  null,-- 年龄
	[address] varchar(100)  null,-- 家庭住址
	idcard varchar(100) UNIQUE  null ,--身份证
	insertDate datetime default getdate() null ,--注册时间
	headPic varchar(100)  null ,-- 头像
	grade varchar(100)  null ,--等级
	authority varchar(100)  null ,--发帖权限
	Purview varchar(100)  null ,--评论权限
) 


--我的信息
create table information(
	 id int identity(1001,1) primary key  not null ,--主键
	customerId int  foreign key references Userinfo(id) not null,-- 用户id
	title varchar(100)  null,-- 标题
	pic varchar(100)  null,-- 图片
	content varchar(100)  null,-- 内容
	insertDate datetime default getdate() not null, ---发布日期
	nologin varchar(100)default'是'  null, --游客是否可见
	scores varchar(100) default'100' null,--会员积分
	plateid int foreign key references plate(id)  null ,--论坛版块ID
) 
select *from information


drop table instruction
--论坛说明
create table instruction (
    id int identity(1001,1) primary key  not null ,--主键
	title varchar(100)  null,-- 论坛说明
) 
select * from instruction


drop table plate
--论坛版块
create table plate(
	id int identity(1001,1) primary key  not  null,--主键
	bkName varchar(100)  null,-- 板块名称
)



drop table comment
--回贴信息表
create table comment(
	 id int identity(1001,1) primary key  not null ,--主键
	messageid int foreign key references information(id) null ,-- 评论信息
	Userinfoid int foreign key references Userinfo(id) null,-- 用户ID
	content varchar(100)  null,--评论内容
	commentDate datetime default getdate() null,-- 评论日期
) 
select *from comment

drop table information




--友情链接
create table friendlink(
 id int identity(1001,1) primary key  not null ,--主键
 linkltype int null,--类型
 linkaddress varchar(100) null,--地址
 linkinfo varchar(100) null,--网站logo
 linkexplain varchar(200) null,--说明
 linktime datetime default getdate() null,-- 日期
 linkname varchar(100) null--链接名称

)


