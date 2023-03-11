use master
go
drop database Pharmacy
go
create database Pharmacy
go
use Pharmacy
go
create table Menu
(
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(50),
	isDropdown bit,
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime
)
go
insert into Menu (name,isDropdown,meta,hide,[order],datebegin) values ('HOME',0,'',1,1,'2023-02-27')
insert into Menu (name,isDropdown,meta,hide,[order],datebegin) values ('STORE',0,'',1,2,'2023-02-27')
insert into Menu (name,isDropdown,meta,hide,[order],datebegin) values ('CATEGORY',1,'',1,3,'2023-02-27')
insert into Menu (name,isDropdown,meta,hide,[order],datebegin) values ('ABOUT',0,'',1,4,'2023-02-27')
insert into Menu (name,isDropdown,meta,hide,[order],datebegin) values ('CONTACT',0,'',1,5,'2023-02-27')


go
create table SubMenu
(
	id int IDENTITY(1,1) PRIMARY KEY ,
	id_menu int not null,
	name nvarchar(50),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime
	CONSTRAINT SubMenu_idMenu_fk FOREIGN KEY (id_menu) REFERENCES Menu(id)
)
go
insert into SubMenu (id_menu,name,meta,hide,[order],datebegin) values (3,'Sup1','',1,1,'2023-02-27')
insert into SubMenu (id_menu,name,meta,hide,[order],datebegin) values (3,'Vitamin','',1,2,'2023-02-27')
insert into SubMenu (id_menu,name,meta,hide,[order],datebegin) values (3,'Diet & Nutrition','',1,3,'2023-02-27')
insert into SubMenu (id_menu,name,meta,hide,[order],datebegin) values (3,'Tea & Coffee','',1,4,'2023-02-27')


go
create table Footer
(
	id int IDENTITY(1,1) PRIMARY KEY,
	content nvarchar(MAX),
	note nvarchar(50),
	[column] int,
	[order] int,
	hide bit,
	meta nvarchar(50),
	datebegin smalldatetime
)
go
insert into Footer (content,note,[column],[order],hide,meta,datebegin) values ('Lorem ipsum dolor','information',1,1,1,'','2023-02-27')
insert into Footer (content,note,[column],[order],hide,meta,datebegin) values ('Supplements','quick link',2,1,1,'','2023-02-27')
insert into Footer (content,note,[column],[order],hide,meta,datebegin) values ('Vitamins','quick link',2,2,1,'','2023-02-27')
insert into Footer (content,note,[column],[order],hide,meta,datebegin) values ('Diet &amp; Nutrition','quick link',2,3,1,'','2023-02-27')
insert into Footer (content,note,[column],[order],hide,meta,datebegin) values ('Tea &amp; Coffee','quick link',2,4,1,'','2023-02-27')
insert into Footer (content,note,[column],[order],hide,meta,datebegin) values ('19 Nguyen Huu Tho Street, Q7, HCM, VN','address',3,1,1,'','2023-02-27')
insert into Footer (content,note,[column],[order],hide,meta,datebegin) values ('+2 392 3929 443','phone',3,2,1,'','2023-02-27')
insert into Footer (content,note,[column],[order],hide,meta,datebegin) values ('pharma.contact@gmail.com','email',3,3,1,'','2023-02-27')


go
create table Product
(
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(50),
	img nvarchar(50),
	isSale bit,
	price int,
	salePrice int,
	quantity int,
	purchase int,
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime
)
go
insert into Product (name,img,isSale,price,salePrice,quantity,purchase,meta,hide,[order],datebegin) values ('Bioderma','../../wwwroot/images/product_01.png',1,95000,55000,1000,500,'',1,1,'2023/02/27')
insert into Product (name,img,isSale,price,salePrice,quantity,purchase,meta,hide,[order],datebegin) values ('Chanca Piedra','../../wwwroot/images/product_02.png',0,0,120000,1000,100,'',1,2,'2023/02/27')
insert into Product (name,img,isSale,price,salePrice,quantity,purchase,meta,hide,[order],datebegin) values ('Umcka Cold Care','../../wwwroot/images/product_03.png',0,0,70000,1000,200,'',1,3,'2023/02/27')
insert into Product (name,img,isSale,price,salePrice,quantity,purchase,meta,hide,[order],datebegin) values ('Cetyl Pure','../../wwwroot/images/product_04.png',1,45000,20000,1000,400,'',1,4,'2023/02/27')
insert into Product (name,img,isSale,price,salePrice,quantity,purchase,meta,hide,[order],datebegin) values ('CLA Core','../../wwwroot/images/product_05.png',0,0,38000,1000,480,'',1,5,'2023/02/27')
insert into Product (name,img,isSale,price,salePrice,quantity,purchase,meta,hide,[order],datebegin) values ('Poo Pourri','../../wwwroot/images/product_06.png',1,89000,38000,1000,350,'',1,6,'2023/02/27')


go
create table News
(
	id int IDENTITY(1,1) PRIMARY KEY,
	tittle nvarchar(50),
	content nvarchar(MAX),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime
)
go
insert into News (tittle,content,meta,hide,[order],datebegin) values ('Free Shipping', 'Customer can be at home and medicine will be delivered to you','',1,1,'2023/02/27')
insert into News (tittle,content,meta,hide,[order],datebegin) values ('Season Sale 50% Off', 'From 01/03/2023 to 07/03/2023 Some product sale','',1,2,'2023/02/27')
insert into News (tittle,content,meta,hide,[order],datebegin) values ('Buy A Gift Card', 'Let get more benefits with our gift card','',1,3,'2023/02/27')
insert into News (tittle,content,meta,hide,[order],datebegin) values ('Members & benefits', 'Approximate 10000 customers become Pharmacy member','',1,4,'2023/02/28')
go
