


--管理员
create table admin(
	id int identity(1001,1) primary key  not null ,--主键
	adminname varchar(100)UNIQUE not null, --管理员账号
	adminpass varchar(100) not null ,--管理员密码
) 

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
	scores varchar(100) default'0' null,--会员积分
	plateid int foreign key references plate(id)  null ,--论坛版块ID
	
)

--论坛版块
create table plate(
	id int identity(1001,1) primary key  not  null,--主键
	bkName varchar(100)  null,-- 板块名称
)

--主贴信息表
create table information(
	id int identity(1001,1) primary key  not null ,--主键
    plateid int foreign key references plate(id),--板块连接
   	Userinfoid int foreign key references Userinfo(id)  null ,--用户ID
    title varchar(100)  null,-- 标题
    pic varchar(100)  null,-- 图片
	content text  not null,-- 内容
	clickcount varchar(100) default'0'null ,--点击数
	insertDate datetime default getdate() not null, ---发布日期
	nologin varchar(100)default'是'  null, --游客是否可见
	
) 

--回贴信息表
create table comment(
	 id int identity(1001,1) primary key  not null ,--主键
	messageid int foreign key references information(id) null ,-- 评论信息
	Userinfoid int foreign key references Userinfo(id) null,-- 用户ID
	content varchar(100)  null,--评论内容
	commentDate datetime default getdate() null,-- 评论日期
)

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



drop table admin

drop table Userinfo

drop table plate

drop table information

drop table comment

drop table friendlink