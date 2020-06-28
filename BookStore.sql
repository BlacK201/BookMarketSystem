use BookStore

create table Users
(
UserId int identity primary key not null, -- 用户UID：由数据库生成
UserEMail varchar(25) not null, -- 用户信息：邮箱
UserName varchar(30) not null, -- 用户名
UserPassword varchar(18),  -- 用户密码
UserGender tinyint,  -- 用户信息：性别 0男 1女 NULL不愿透露
UserRegTime datetime not null, -- 用户信息：注册时间
UserStatus tinyint not null, -- 用户状态，0正常 1封禁 2永封
UserBanUntil datetime, -- 用户解封时间
UserFlag tinyint not null -- 用户等级，0普通用户 1VIP 99管理员
)

create table Authors
(
AuthorId int identity primary key not null, -- 作者ID
AuthorName varchar(50) not null -- 作者姓名
)

create table BookClass                       --                                                     ////
(
ClassId int identity primary key not null, -- 类别ID                              ////
ClassName varchar(50) not null -- 类名                                               /////
)

create table Books
(
BookId int identity primary key not null, -- 图书ID：由数据库生成
BookName varchar(100) not null, -- 书名：                                                 /////
BookContent ntext not null,   --图书信息                                     ////
AuthorId int FOREIGN KEY REFERENCES Authors(AuthorId) not null, -- 图书作者ID
BookAddTime datetime not null, -- 图书上架时间
ClassId int FOREIGN KEY REFERENCES BookClass(ClassId) not null,  -- 图书类别ID                                                      ////
BookPrice money,  -- 图书价格
BookSales int not null, -- 图书销量
BookAllowance int not null, -- 图书库存
BookImageUrl varchar(50) -- 图书封面链接
)


create table Orders
(
OrderId int primary key identity not null, -- 订单号
UserId int FOREIGN KEY REFERENCES Users(UserId) not null, -- 订单用户id
BookId int FOREIGN KEY REFERENCES Books(BookId) not null, -- 订单图书id
OrderBookCount int not null, -- 购买数量
OrderPrice money not null, -- 订单成交价格
OrderCreateTime datetime not null, -- 订单创建时间
OrderStatus tinyint not null -- 订单状态 0为未付款 1为已付款 2为已取消
)

create table Cart
(
UserId int FOREIGN KEY REFERENCES Users(UserId) not null, -- 用户id
BookId int FOREIGN KEY REFERENCES Books(BookId) not null, -- 图书id
BookCount int not null, -- 购买数量 
)
-- /////////////////////////////////////////////////////////////////////////////
CREATE PROCEDURE Checkout(@UserId int) AS  -- 订单存储过程
DECLARE @Rows int
DECLARE @Row int
DECLARE @BookId int
DECLARE @OrderBookCount int
DECLARE @OrderPrice money
SET @Rows = (SELECT COUNT(*) FROM Cart WHERE UserId = @UserId)
SET @Row = 1
WHILE(@Row <= @Rows)
BEGIN
	SET @BookId = (SELECT TOP 1 BookId FROM Cart WHERE UserId = @UserId)
	SET @OrderBookCount = (SELECT TOP 1 BookCount FROM Cart WHERE UserId = @UserId)
	SET @OrderPrice = (SELECT BookPrice FROM Cart, Books WHERE Cart.BookId = Books.BookId AND Cart.BookId = (SELECT TOP 1 BookId FROM Cart WHERE UserId = @UserId) AND Cart.UserId = @UserId) * @OrderBookCount
	INSERT INTO Orders(UserId, BookId, OrderBookCount,OrderPrice,OrderCreateTime,OrderStatus) 
	VALUES(@UserId,@BookId,@OrderBookCount,@OrderPrice,GETDATE(),1)
	DELETE FROM Cart WHERE BookId = @BookId AND UserId = @UserId
	UPDATE Books SET BookSales = BookSales + 1 WHERE BookId = @BookId
	UPDATE Books SET BookAllowance = BookAllowance - 1 WHERE BookId = @BookId
	SET @Row = @Row + 1
END

