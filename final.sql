go
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
insert into Menu (name,isDropdown,meta,hide,[order],datebegin) values ('HOME',0,'/Home',1,1,'2023-02-27')
insert into Menu (name,isDropdown,meta,hide,[order],datebegin) values ('STORE',0,'/Store',1,2,'2023-02-27')
insert into Menu (name,isDropdown,meta,hide,[order],datebegin) values ('CATEGORY',1,'',1,3,'2023-02-27')
insert into Menu (name,isDropdown,meta,hide,[order],datebegin) values ('ABOUT',0,'/About',1,4,'2023-02-27')
insert into Menu (name,isDropdown,meta,hide,[order],datebegin) values ('CONTACT',0,'/Contact',1,5,'2023-02-27')


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
create table Banner
(
	id int IDENTITY(1,1) PRIMARY KEY,
	tittle nvarchar(50),
	content nvarchar(MAX),
	page nvarchar(50),
	img nvarchar(50),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime
)
go
insert into Banner (tittle,content,page,img,meta,hide,[order],datebegin) values ('Welcome To Pharma','Effective Medicine, New Medicine Everyday','HOME','../../wwwroot/images/hero_1.jpg','',1,1,'2023/03/04')
insert into Banner (tittle,content,page,img,meta,hide,[order],datebegin) values ('About Us','At the Pharmacy, each Pharmacist is always dedicated to serving and trained to successfully complete the assigned tasks.','ABOUT','../../wwwroot/images/hero_1.jpg','/About/Index',1,1,'2023/03/04')

go
create table QuickLink
(
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(50),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime
)
go
insert into QuickLink (name,meta,hide,[order],datebegin) values ('Supplements','',1,1,'2023-02-27')
insert into QuickLink (name,meta,hide,[order],datebegin) values ('Vitamins','',1,2,'2023-02-27')
insert into QuickLink (name,meta,hide,[order],datebegin) values ('Diet &amp; Nutrition','',1,3,'2023-02-27')
insert into QuickLink (name,meta,hide,[order],datebegin) values ('Tea &amp; Coffee','',1,4,'2023-02-27')


go
create table ContactInfo
(
	id int IDENTITY(1,1) PRIMARY KEY,
	content nvarchar(50),
	type nvarchar(50),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime
)
go
insert into ContactInfo (content,type,meta,hide,[order],datebegin) values ('19 D. Nguyen Huu Tho, Tan Hung, District 7, Ho Chi Minh City, Vietnam','address','https://goo.gl/maps/dQwxg1MyK2wMUaNFA',1,1,'2023-02-27')
insert into ContactInfo (content,type,meta,hide,[order],datebegin) values ('1800 1911','phone','tel:1800 1911',1,2,'2023-02-27')
insert into ContactInfo (content,type,meta,hide,[order],datebegin) values ('pharmacy.contact@gmail.com','email','mailto:pharmacy.contact@gmail.com',1,3,'2023-02-27')


go
create table CompanyInfo
(
	id int IDENTITY(1,1) PRIMARY KEY,
	tittle nvarchar(50),
	content nvarchar(MAX),
	img nvarchar(50),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime
)
go
insert into CompanyInfo (tittle,content,img,meta,hide,[order],datebegin) values ('About Us','At the Pharmacy, each Pharmacist is always dedicated to serving and trained to successfully complete the assigned tasks.','','/About/Index',1,1,'2023-02-27')
insert into CompanyInfo (tittle,content,img,meta,hide,[order],datebegin) values ('How We Started','Established in 2023, Pharmacy is one of the first pharmaceutical retail chains in Vietnam. To date, Pharmacy owns a network of more than 1,100 GPP-certified pharmacies nationwide and a team of more than 3,500 trusted pharmacists, providing leading medicines and healthcare products at the most competitive prices.','../../wwwroot/images/bg_1.jpg','',1,2,'2023-02-27')
insert into CompanyInfo (tittle,content,img,meta,hide,[order],datebegin) values ('We Are Trusted Company','Pharmacy always aims to improve the quality of health care for each customer. This, previously, was only in the idea of Mr. An - the founder of the company, an pharmacist who worked for many years in Vietnam. With his passion and creativity, Mr.An founded Pharmacy and brings the best experiences to customers.','../../wwwroot/images/hero_1.jpg','',1,3,'2023-02-27')


go
create table TeamInfo
(
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(50),
	role nvarchar(50),
	description nvarchar(MAX),
	img nvarchar(50),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime
)
go
insert into TeamInfo (name,role,description,img,meta,hide,[order],datebegin) values ('Ly Tuan An','CEO/CO-FOUNDER','He was born in 2002 in Ho Chi Minh City, Vietnam and graduated in software engineering from Ton Duc Thang University in 2024.','../../wwwroot/images/person_2.jpg','',1,1,'2023/03/03')
insert into TeamInfo (name,role,description,img,meta,hide,[order],datebegin) values ('Prean Mesa','CO-FOUNDER','He was born in 2002 in Cambodia and graduated in software engineering from Ton Duc Thang University in 2024.','../../wwwroot/images/person_3.jpg','',1,2,'2023/03/03')
insert into TeamInfo (name,role,description,img,meta,hide,[order],datebegin) values ('Huynh Cong Chanh','CO-FOUNDER','He was born in 2001 in Ho Chi Minh City, Vietnam and graduated in software engineering from Ton Duc Thang University in 2023.','../../wwwroot/images/person_4.jpg','',1,3,'2023/03/03')


go
create table Office
(
	id int IDENTITY(1,1) PRIMARY KEY,
	location nvarchar(50),
	address nvarchar(150),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime
)
go
insert into Office (location,address,meta,hide,[order],datebegin) values ('District 8','175 Cao Xuan Duc, Ward 12, District 8, Ho Chi Minh City, Vietnam','https://goo.gl/maps/GVhs5ET7Bm3FXCzB9',1,1,'2023/03/03')
insert into Office (location,address,meta,hide,[order],datebegin) values ('District 7','139 Ton Dat Tien, Tan Phong, District 7, Ho Chi Minh City 700000, Vietnam','https://goo.gl/maps/CuqFiAMUm9CDfHbNA',1,2,'2023/03/03')
insert into Office (location,address,meta,hide,[order],datebegin) values ('District 1','22-36 E. Nguyen Hue, Ben Nghe, District 1, Ho Chi Minh City, Vietnam','https://goo.gl/maps/L9coFpmgT9JJMGGa6',1,3,'2023/03/03')
