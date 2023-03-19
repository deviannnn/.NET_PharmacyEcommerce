USE master
GO
IF exists( SELECT * FROM sysdatabases WHERE name='Pharmacy')
	DROP DATABASE Pharmacy
GO
CREATE DATABASE Pharmacy
GO
USE Pharmacy
GO
CREATE TABLE Menu
(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[name] nvarchar(50) NULL,
	[isDropdown] bit NULL,
	[meta] nvarchar(50) NULL,
	[hide] bit NULL,
	[order] int NULL,
	[datebegin] smalldatetime NULL
)
GO
INSERT Menu ([name], [isDropdown], [meta], [hide], [order], [datebegin]) VALUES (N'Trang chủ',0,'trang-chu',1,1,'2023-03-03')
INSERT Menu ([name], [isDropdown], [meta], [hide], [order], [datebegin]) VALUES (N'Sản Phẩm',0,'san-pham',1,2,'2023-03-03')
INSERT Menu ([name], [isDropdown], [meta], [hide], [order], [datebegin]) VALUES (N'Danh mục',1,'',1,3,'2023-03-03')
INSERT Menu ([name], [isDropdown], [meta], [hide], [order], [datebegin]) VALUES (N'Tin tức',0,'tin-tuc',1,4,'2023-03-03')
INSERT Menu ([name], [isDropdown], [meta], [hide], [order], [datebegin]) VALUES (N'Hệ thống nhà thuốc',1,'',1,4,'2023-03-03')
INSERT Menu ([name], [isDropdown], [meta], [hide], [order], [datebegin]) VALUES (N'Liên hệ',0,'lien-he',1,5,'2023-03-03')


GO
CREATE TABLE SubMenu
(
	[id] int IDENTITY(1,1) PRIMARY KEY ,
	[name] nvarchar(50) NULL,
	[meta] nvarchar(50) NULL,
	[hide] bit NULL,
	[order] int NULL,
	[datebegin] smalldatetime NULL,
	[id_menu] int NOT NULL
	CONSTRAINT SubMenu_idMenu_fk FOREIGN KEY (id_menu) REFERENCES Menu(id)
)
GO
INSERT SubMenu ([name], [meta], [hide], [order], [datebegin], [id_menu]) VALUES (N'Dược phẩm','san-pham/duoc-pham',1,1,'2023-03-03',3)
INSERT SubMenu ([name], [meta], [hide], [order], [datebegin], [id_menu]) VALUES (N'Thực phẩm chức năng','san-pham/thuc-pham-chuc-nang',1,2,'2023-03-03',3)
INSERT SubMenu ([name], [meta], [hide], [order], [datebegin], [id_menu]) VALUES (N'Chăm sóc sức khoẻ','san-pham/cham-soc-suc-khoe',1,3,'2023-03-03',3)
INSERT SubMenu ([name], [meta], [hide], [order], [datebegin], [id_menu]) VALUES (N'Chăm sóc cá nhân','san-pham/cham-soc-ca-nhan',1,4,'2023-03-03',3)
INSERT SubMenu ([name], [meta], [hide], [order], [datebegin], [id_menu]) VALUES (N'Thiết bị y tế','san-pham/thiet-bi-y-te',1,4,'2023-03-03',3)
INSERT SubMenu ([name], [meta], [hide], [order], [datebegin], [id_menu]) VALUES (N'Thông tin','thong-tin',1,4,'2023-03-03',5)
INSERT SubMenu ([name], [meta], [hide], [order], [datebegin], [id_menu]) VALUES (N'Chi nhánh','chi-nhanh',1,4,'2023-03-03',5)



GO
CREATE TABLE News
(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[tittle] nvarchar(50) NULL,
	[content] nvarchar(MAX) NULL,
	[meta] nvarchar(50) NULL,
	[hide] bit NULL,
	[order] int NULL,
	[datebegin] smalldatetime NULL
)
GO
INSERT News ([tittle], [content], [meta], [hide], [order],[datebegin]) VALUES (N'Giao hàng nhanh chóng, miễn phí', N'Bạn đang cần thuốc nhưng ngại ra đường. Đừng lo, sản phẩm sẽ được giao tận nơi ...', 'tin-tuc', 1, 1, '2023-03-03')
INSERT News ([tittle], [content], [meta], [hide], [order],[datebegin]) VALUES (N'Mùa giảm giá lên tới 50%', N'Từ 01/03/2023 đến 03/07/2023 Giảm giá một số sản phẩm sau ...', 'tin-tuc', 1, 2, '2023-03-03')
INSERT News ([tittle], [content], [meta], [hide], [order],[datebegin]) VALUES (N'Sở hữu thẻ quà tặng', N'Khách hàng sẽ nhận được nhiều lợi ích hơn với thẻ quà tặng của chúng tôi ...', 'tin-tuc', 1, 3, '2023-03-03')
INSERT News ([tittle], [content], [meta], [hide], [order],[datebegin]) VALUES (N'Hội viên & Quyền lợi', N'Hơn 1000 khách hàng đã trở thành Hội viên của Pharmacy và nhận ...', 'tin-tuc', 1, 4, '2023/02/28')


GO
CREATE TABLE Banner
(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[tittle] nvarchar(50) NULL,
	[content] nvarchar(MAX) NULL,
	[page] nvarchar(50) NULL,
	[img] nvarchar(50) NULL,
	[meta] nvarchar(50) NULL,
	[hide] bit NULL,
	[order] int NULL,
	[datebegin] smalldatetime NULL
)
GO
INSERT Banner ([tittle], [content], [page], [img], [meta], [hide], [order], [datebegin]) VALUES ('Welcome To Pharma', N'Thuốc Hiệu Quả, Thuốc Mới Mỗi Ngày.','HOME','hero_1.jpg','trang-chu',1,1,'2023/03/04')
INSERT Banner ([tittle], [content], [page], [img], [meta], [hide], [order], [datebegin]) VALUES ('About Us', N'Tại Pharmacy, mỗi Dược sĩ luôn hết lòng phục vụ, rèn luyện để hoàn thành xuất sắc nhiệm vụ được giao.','ABOUT','hero_1.jpg','thong-tin',1,1,'2023/03/04')

GO
CREATE TABLE QuickLink
(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[name] nvarchar(50) NULL,
	[meta] nvarchar(50) NULL,
	[hide] bit NULL,
	[order] int NULL,
	[datebegin] smalldatetime NULL
)
GO
INSERT QuickLink ([name], [meta], [hide], [order], [datebegin]) VALUES (N'Dược phẩm','san-pham/duoc-pham',1,1,'2023-03-03')
INSERT QuickLink ([name], [meta], [hide], [order], [datebegin]) VALUES (N'Thực phẩm chức năng','san-pham/thuc-pham-chuc-nang',1,2,'2023-03-03')
INSERT QuickLink ([name], [meta], [hide], [order], [datebegin]) VALUES (N'Chăm sóc sức khoẻ','san-pham/cham-soc-suc-khoe',1,3,'2023-03-03')
INSERT QuickLink ([name], [meta], [hide], [order], [datebegin]) VALUES (N'Chăm sóc cá nhân','san-pham/cham-soc-ca-nhan',1,4,'2023-03-03')
INSERT QuickLink ([name], [meta], [hide], [order], [datebegin]) VALUES (N'Thiết bị y tế','san-pham/thiet-bi-y-te',1,5,'2023-03-03')
INSERT QuickLink ([name], [meta], [hide], [order], [datebegin]) VALUES (N'Chính sách giao hàng','chinh-sach-giao-hang',1,6,'2023-03-03')
INSERT QuickLink ([name], [meta], [hide], [order], [datebegin]) VALUES (N'Chính sách đổi trả','chinh-sach-doi-tra',1,7,'2023-03-03')
INSERT QuickLink ([name], [meta], [hide], [order], [datebegin]) VALUES (N'Chi nhánh Pharmacy','chi-nhanh',1,8,'2023-03-03')


GO
CREATE TABLE ContactInfo
(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[content] nvarchar(MAX) NULL,
	[type] nvarchar(50) NULL,
	[meta] nvarchar(50) NULL,
	[hide] bit NULL,
	[order] int NULL,
	[datebegin] smalldatetime NULL
)
GO
INSERT ContactInfo ([content], [type], [meta], [hide], [order], [datebegin]) VALUES (N'19 Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh','address','https://GOo.gl/maps/dQwxg1MyK2wMUaNFA',1,1,'2023-03-03')
INSERT ContactInfo ([content], [type], [meta], [hide], [order], [datebegin]) VALUES ('1800 1911','phone','tel:1800 1911',1,2,'2023-03-03')
INSERT ContactInfo ([content], [type], [meta], [hide], [order], [datebegin]) VALUES ('pharmacy.contact@gmail.com','email','mailto:pharmacy.contact@gmail.com',1,3,'2023-03-03')


GO
CREATE TABLE CompanyInfo
(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[tittle] nvarchar(50) NULL,
	[content] nvarchar(MAX) NULL,
	[img] nvarchar(50) NULL,
	[meta] nvarchar(50) NULL,
	[hide] bit NULL,
	[order] int NULL,
	[datebegin] smalldatetime NULL
)
GO
INSERT CompanyInfo ([tittle], [content], [img], [meta], [hide], [order], [datebegin]) VALUES (N'Về Pharmacy',N'Tại Pharmacy, mỗi Dược sĩ luôn hết lòng phục vụ, rèn luyện để hoàn thành xuất sắc nhiệm vụ được giao.','','about',1,-1,'2023-03-03')
INSERT CompanyInfo ([tittle], [content], [img], [meta], [hide], [order], [datebegin]) VALUES ('How We Started',N'Được thành lập vào năm 2023, Pharmacy là một trong những chuỗi bán lẻ dược phẩm đầu tiên tại Việt Nam. Đến nay, Nhà thuốc sở hữu mạng lưới hơn 200 nhà thuốc đạt GPP trên toàn quốc cùng đội ngũ hơn 2000 trình dược viên uy tín, cung cấp thuốc và sản phẩm chăm sóc sức khỏe hàng đầu với giá cạnh tranh nhất.','bg_1.jpg','',1,1,'2023-03-03')
INSERT CompanyInfo ([tittle], [content], [img], [meta], [hide], [order], [datebegin]) VALUES ('We Are Trusted Company',N'Nhà thuốc luôn hướng tới mục tiêu nâng cao chất lượng chăm sóc sức khỏe cho từng khách hàng. Điều này trước đây chỉ nằm trong ý tưởng của DS.An – người sáng lập công ty, một dược sĩ đã làm việc nhiều năm tại Việt Nam. Bằng niềm đam mê và sự sáng tạo của mình, DS.An đã thành lập Nhà thuốc và mang đến những trải nghiệm tốt nhất cho khách hàng.','hero_1.jpg','',1,2,'2023-03-03')


GO
CREATE TABLE TeamInfo
(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[name] nvarchar(50) NULL,
	[role] nvarchar(50) NULL,
	[description] nvarchar(MAX) NULL,
	[img] nvarchar(50) NULL,
	[meta] nvarchar(50) NULL,
	[hide] bit NULL,
	[order] int NULL,
	[datebegin] smalldatetime NULL
)
GO
INSERT TeamInfo ([name], [role], [description], [img], [meta], [hide], [order], [datebegin]) VALUES (N'Lý Tuấn An',N'CEO/CO-FOUNDER',N'Anh sinh năm 2002 tại Thành phố Hồ Chí Minh, Việt Nam và tốt nghiệp ngành công nghệ phần mềm tại Đại học Tôn Đức Thắng năm 2024.','person_2.jpg','',1,1,'2023-03-03')
INSERT TeamInfo ([name], [role], [description], [img], [meta], [hide], [order], [datebegin]) VALUES (N'Prean Mesa',N'CO-FOUNDER',N'Anh sinh năm 2002 tại Campuchia và tốt nghiệp ngành công nghệ phần mềm tại Đại học Tôn Đức Thắng năm 2024.','person_3.jpg','',1,2,'2023-03-03')
INSERT TeamInfo ([name], [role], [description], [img], [meta], [hide], [order], [datebegin]) VALUES (N'Huỳnh Công Chánh',N'CO-FOUNDER',N'Anh sinh năm 2001 tại Trà Vinh, Việt Nam và tốt nghiệp ngành công nghệ phần mềm tại Đại học Tôn Đức Thắng năm 2023.','person_4.jpg','',1,3,'2023-03-03')


GO
CREATE TABLE Office
(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[location] nvarchar(50) NULL,
	[address] nvarchar(150) NULL,
	[meta] nvarchar(50) NULL,
	[hide] bit NULL,
	[order] int NULL,
	[datebegin] smalldatetime NULL
)
GO
INSERT Office ([location], [address], [meta], [hide], [order], [datebegin]) VALUES (N'Quận 8',N'175 Cao Xuân Dục, Phường 12, Quận 8, Thành phố Hồ Chí Minh','https://GOo.gl/maps/GVhs5ET7Bm3FXCzB9',1,1,'2023-03-03')
INSERT Office ([location], [address], [meta], [hide], [order], [datebegin]) VALUES (N'Quận 7',N'139 Tôn Dật Tiên, Phường Tân Phong, Quận 7, Thành phố Hồ Chí Minh','https://GOo.gl/maps/CuqFiAMUm9CDfHbNA',1,2,'2023-03-03')
INSERT Office ([location], [address], [meta], [hide], [order], [datebegin]) VALUES (N'Quận 1',N'22-36 Nguyễn Huệ, Phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh','https://GOo.gl/maps/L9coFpmgT9JJMGGa6',1,3,'2023-03-03')


GO
CREATE TABLE Category
(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[name] nvarchar(50) NULL,
	[meta] nvarchar(50) NULL,
	[hide] bit NULL,
	[order] int NULL,
	[datebegin] smalldatetime NULL
)
GO
INSERT Category ([name], [meta], [hide], [order], [datebegin]) VALUES (N'Dược phẩm','duoc-pham',1,1,'2023-03-03')
INSERT Category ([name], [meta], [hide], [order], [datebegin]) VALUES (N'Thực phẩm chức năng','thuc-pham-chuc-nang',1,2,'2023-03-03')
INSERT Category ([name], [meta], [hide], [order], [datebegin]) VALUES (N'Chăm sóc sức khoẻ','cham-soc-suc-khoe',1,3,'2023-03-03')
INSERT Category ([name], [meta], [hide], [order], [datebegin]) VALUES (N'Chăm sóc cá nhân','cham-soc-ca-nhan',1,4,'2023-03-03')
INSERT Category ([name], [meta], [hide], [order], [datebegin]) VALUES (N'Thiết bị y tế','thiet-bi-y-te',1,4,'2023-03-03')


GO
CREATE TABLE Product
(
	[id] int IDENTITY(1,1) PRIMARY KEY,
	[name] nvarchar(50) NULL,
	[img] nvarchar(50) NULL,
	[price] int NULL,
	[description] nvarchar(MAX) NULL,
	[ingredient] nvarchar(MAX) NULL,
	[quantity] int NULL,
	[purchase] int NULL,
	[isSale] bit NULL,
	[priceSale] int NULL,
	[meta] nvarchar(50) NULL,
	[hide] bit NULL,
	[order] int NULL,
	[datebegin] smalldatetime NULL,
	[id_category] int NOT NULL
	CONSTRAINT Product_idCategory_fk FOREIGN KEY (id_category) REFERENCES Category(id)
)
GO
INSERT Product ([name], [img], [price], [description], [ingredient], [quantity], [purchase], [isSale], [priceSale], [meta], [hide], [order], [datebegin], [id_category]) VALUES (N'Dược phẩm 1','product_01.png',100000,N'Thực phẩm bảo vệ sức khỏe Solgar Vitamin C 500mg w Rose Hips giúp hỗ trợ tăng cường sức khỏe đề kháng.',N'Vitamin C(Axid Ascorbic) 500mg. Tầm xuân (Rose Hips) (Rosa Canina) (quả) 75mg.',1000,50,1,60000,'duoc-pham',1,1,'2023-03-03',1)
INSERT Product ([name], [img], [price], [description], [ingredient], [quantity], [purchase], [isSale], [priceSale], [meta], [hide], [order], [datebegin], [id_category]) VALUES (N'Dược phẩm 2','product_02.png',200000,N'Thực phẩm bảo vệ sức khỏe Solgar Vitamin C 500mg w Rose Hips giúp hỗ trợ tăng cường sức khỏe đề kháng.',N'Vitamin C(Axid Ascorbic) 500mg. Tầm xuân (Rose Hips) (Rosa Canina) (quả) 75mg.',1000,500,0,0,'duoc-pham',1,2,'2023-03-03',1)
INSERT Product ([name], [img], [price], [description], [ingredient], [quantity], [purchase], [isSale], [priceSale], [meta], [hide], [order], [datebegin], [id_category]) VALUES (N'Thực phẩm chức năng 1','product_03.png',300000,N'Thực phẩm bảo vệ sức khỏe Solgar Vitamin C 500mg w Rose Hips giúp hỗ trợ tăng cường sức khỏe đề kháng.',N'Vitamin C(Axid Ascorbic) 500mg. Tầm xuân (Rose Hips) (Rosa Canina) (quả) 75mg.',1000,700,0,0,'duoc-pham',1,3,'2023-03-18',2)
INSERT Product ([name], [img], [price], [description], [ingredient], [quantity], [purchase], [isSale], [priceSale], [meta], [hide], [order], [datebegin], [id_category]) VALUES (N'Thực phẩm chức năng 2','product_04.png',400000,N'Thực phẩm bảo vệ sức khỏe Solgar Vitamin C 500mg w Rose Hips giúp hỗ trợ tăng cường sức khỏe đề kháng.',N'Vitamin C(Axid Ascorbic) 500mg. Tầm xuân (Rose Hips) (Rosa Canina) (quả) 75mg.',1000,500,0,0,'duoc-pham',1,4,'2023-03-11',2)
INSERT Product ([name], [img], [price], [description], [ingredient], [quantity], [purchase], [isSale], [priceSale], [meta], [hide], [order], [datebegin], [id_category]) VALUES (N'Chăm sóc sức khoẻ 1','product_05.png',500000,N'Thực phẩm bảo vệ sức khỏe Solgar Vitamin C 500mg w Rose Hips giúp hỗ trợ tăng cường sức khỏe đề kháng.',N'Vitamin C(Axid Ascorbic) 500mg. Tầm xuân (Rose Hips) (Rosa Canina) (quả) 75mg.',1000,900,0,0,'duoc-pham',1,5,'2023-03-03',3)
INSERT Product ([name], [img], [price], [description], [ingredient], [quantity], [purchase], [isSale], [priceSale], [meta], [hide], [order], [datebegin], [id_category]) VALUES (N'Chăm sóc sức khoẻ 2','product_06.png',600000,N'Thực phẩm bảo vệ sức khỏe Solgar Vitamin C 500mg w Rose Hips giúp hỗ trợ tăng cường sức khỏe đề kháng.',N'Vitamin C(Axid Ascorbic) 500mg. Tầm xuân (Rose Hips) (Rosa Canina) (quả) 75mg.',1000,600,1,20000,'duoc-pham',1,6,'2023-03-10',3)
INSERT Product ([name], [img], [price], [description], [ingredient], [quantity], [purchase], [isSale], [priceSale], [meta], [hide], [order], [datebegin], [id_category]) VALUES (N'Chăm sóc cá nhân 1','product_01.png',700000,N'Thực phẩm bảo vệ sức khỏe Solgar Vitamin C 500mg w Rose Hips giúp hỗ trợ tăng cường sức khỏe đề kháng.',N'Vitamin C(Axid Ascorbic) 500mg. Tầm xuân (Rose Hips) (Rosa Canina) (quả) 75mg.',1000,500,0,0,'duoc-pham',1,7,'2023-03-19',4)
INSERT Product ([name], [img], [price], [description], [ingredient], [quantity], [purchase], [isSale], [priceSale], [meta], [hide], [order], [datebegin], [id_category]) VALUES (N'Chăm sóc cá nhân 2','product_02.png',800000,N'Thực phẩm bảo vệ sức khỏe Solgar Vitamin C 500mg w Rose Hips giúp hỗ trợ tăng cường sức khỏe đề kháng.',N'Vitamin C(Axid Ascorbic) 500mg. Tầm xuân (Rose Hips) (Rosa Canina) (quả) 75mg.',1000,200,0,0,'duoc-pham',1,8,'2023-03-03',4)
INSERT Product ([name], [img], [price], [description], [ingredient], [quantity], [purchase], [isSale], [priceSale], [meta], [hide], [order], [datebegin], [id_category]) VALUES (N'Thiết bị y tế 1','product_03.png',900000,N'Thực phẩm bảo vệ sức khỏe Solgar Vitamin C 500mg w Rose Hips giúp hỗ trợ tăng cường sức khỏe đề kháng.',N'Vitamin C(Axid Ascorbic) 500mg. Tầm xuân (Rose Hips) (Rosa Canina) (quả) 75mg.',1000,100,0,0,'duoc-pham',1,9,'2023-03-03',5)
INSERT Product ([name], [img], [price], [description], [ingredient], [quantity], [purchase], [isSale], [priceSale], [meta], [hide], [order], [datebegin], [id_category]) VALUES (N'Thiết bị y tế 2','product_04.png',1000000,N'Thực phẩm bảo vệ sức khỏe Solgar Vitamin C 500mg w Rose Hips giúp hỗ trợ tăng cường sức khỏe đề kháng.',N'Vitamin C(Axid Ascorbic) 500mg. Tầm xuân (Rose Hips) (Rosa Canina) (quả) 75mg.',1000,500,1,60000,'duoc-pham',1,10,'2023-03-03',5)

