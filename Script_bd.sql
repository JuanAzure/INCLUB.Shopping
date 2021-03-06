USE [SHOPPING]
GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 27/05/2022 13:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE FUNCTION [dbo].[Split]
(
    @Cadena varchar(8000),
    @Delimitador char(1)
)
RETURNS TABLE
AS
RETURN
(
    WITH Split(stpos,endpos)
    AS(
        SELECT 0, CHARINDEX(@Delimitador,@Cadena)
        UNION ALL
        SELECT endpos + 1, CHARINDEX(@Delimitador,@Cadena,endpos+1) FROM Split WHERE endpos > 0
    )
    SELECT 
             'id' = ROW_NUMBER() OVER (ORDER BY (SELECT 1)),
             'data' = SUBSTRING(@Cadena,stpos,COALESCE(NULLIF(endpos,0),LEN(@Cadena)+1)-stpos)
    FROM Split
)
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 27/05/2022 13:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[N_ProductId] [int] IDENTITY(1,1) NOT NULL,
	[V_Name] [varchar](50) NOT NULL,
	[V_Description] [varchar](250) NULL,
	[D_Price] [decimal](18, 2) NOT NULL,
	[N_Stock] [int] NOT NULL,
	[N_UserId] [int] NOT NULL,
	[DT_CreatedDate] [datetime] NOT NULL,
	[DT_ModifiedDate] [datetime] NULL,
	[B_IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[N_ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHOPPING]    Script Date: 27/05/2022 13:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHOPPING](
	[N_ShoppingId] [int] IDENTITY(1,1) NOT NULL,
	[DT_TransactionDate] [datetime] NOT NULL,
	[D_Igv] [decimal](18, 2) NOT NULL,
	[D_SubTotal] [decimal](18, 2) NOT NULL,
	[D_Neto] [decimal](18, 2) NOT NULL,
	[V_Status] [varchar](15) NOT NULL,
	[N_UserId] [int] NOT NULL,
	[DT_CreatedDate] [datetime] NOT NULL,
	[DT_ModifiedDate] [datetime] NULL,
	[B_IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SHOPPING] PRIMARY KEY CLUSTERED 
(
	[N_ShoppingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHOPPING_DETAILS]    Script Date: 27/05/2022 13:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHOPPING_DETAILS](
	[N_ShoppingDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[N_ShoppingId] [int] NOT NULL,
	[N_ProductId] [int] NOT NULL,
	[N_Amount] [decimal](18, 2) NOT NULL,
	[N_UserId] [int] NOT NULL,
	[DT_CreatedDate] [datetime] NOT NULL,
	[DT_ModifiedDate] [datetime] NULL,
	[B_IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SHOPPING_DETAILS] PRIMARY KEY CLUSTERED 
(
	[N_ShoppingDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 27/05/2022 13:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[N_UserId] [int] IDENTITY(1,1) NOT NULL,
	[V_Name] [varchar](50) NOT NULL,
	[V_Email] [varchar](50) NOT NULL,
	[V_NumberIdentity] [varchar](8) NOT NULL,
	[V_Password] [varbinary](max) NOT NULL,
	[DT_CreatedDate] [datetime] NOT NULL,
	[DT_ModifiedDate] [datetime] NULL,
	[B_IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[N_UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 

INSERT [dbo].[PRODUCT] ([N_ProductId], [V_Name], [V_Description], [D_Price], [N_Stock], [N_UserId], [DT_CreatedDate], [DT_ModifiedDate], [B_IsDeleted]) VALUES (112, N'Producto 01', N'producto de primera necesida. ', CAST(45.60 AS Decimal(18, 2)), 180, 1, CAST(N'2022-05-27T10:45:45.747' AS DateTime), CAST(N'2022-05-27T10:45:45.747' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([N_ProductId], [V_Name], [V_Description], [D_Price], [N_Stock], [N_UserId], [DT_CreatedDate], [DT_ModifiedDate], [B_IsDeleted]) VALUES (113, N'Leche', N'Leche evaporada', CAST(3.50 AS Decimal(18, 2)), 120, 2, CAST(N'2022-05-27T10:51:11.227' AS DateTime), CAST(N'2022-05-27T10:51:11.227' AS DateTime), 1)
INSERT [dbo].[PRODUCT] ([N_ProductId], [V_Name], [V_Description], [D_Price], [N_Stock], [N_UserId], [DT_CreatedDate], [DT_ModifiedDate], [B_IsDeleted]) VALUES (114, N'Leche', N'Leche evaporada', CAST(3.50 AS Decimal(18, 2)), 120, 2, CAST(N'2022-05-27T10:51:23.390' AS DateTime), CAST(N'2022-05-27T10:51:23.390' AS DateTime), 1)
INSERT [dbo].[PRODUCT] ([N_ProductId], [V_Name], [V_Description], [D_Price], [N_Stock], [N_UserId], [DT_CreatedDate], [DT_ModifiedDate], [B_IsDeleted]) VALUES (115, N'Producto 01', N'producto de primera necesida. ', CAST(45.60 AS Decimal(18, 2)), 180, 1, CAST(N'2022-05-27T10:56:18.203' AS DateTime), CAST(N'2022-05-27T11:14:14.710' AS DateTime), 1)
INSERT [dbo].[PRODUCT] ([N_ProductId], [V_Name], [V_Description], [D_Price], [N_Stock], [N_UserId], [DT_CreatedDate], [DT_ModifiedDate], [B_IsDeleted]) VALUES (116, N'Producto 01', N'producto de primera necesida. ', CAST(45.60 AS Decimal(18, 2)), 180, 1, CAST(N'2022-05-27T10:57:00.227' AS DateTime), CAST(N'2022-05-27T10:57:00.227' AS DateTime), 0)
INSERT [dbo].[PRODUCT] ([N_ProductId], [V_Name], [V_Description], [D_Price], [N_Stock], [N_UserId], [DT_CreatedDate], [DT_ModifiedDate], [B_IsDeleted]) VALUES (117, N'Producto upd', N'producto de primera necesida. ', CAST(45.60 AS Decimal(18, 2)), 180, 1, CAST(N'2022-05-27T12:00:39.923' AS DateTime), CAST(N'2022-05-27T12:03:48.070' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
GO
SET IDENTITY_INSERT [dbo].[USER] ON 

INSERT [dbo].[USER] ([N_UserId], [V_Name], [V_Email], [V_NumberIdentity], [V_Password], [DT_CreatedDate], [DT_ModifiedDate], [B_IsDeleted]) VALUES (1, N'Carlos Rojas', N'carlos@gmail.com', N'21434567', 0x02000000D1A5832382A8979060ED559404D649934A0FF8B4BB9DBCBBDE0902EF2A396CC0, CAST(N'2022-05-25T16:19:44.397' AS DateTime), CAST(N'2022-05-25T16:19:44.397' AS DateTime), 1)
INSERT [dbo].[USER] ([N_UserId], [V_Name], [V_Email], [V_NumberIdentity], [V_Password], [DT_CreatedDate], [DT_ModifiedDate], [B_IsDeleted]) VALUES (2, N'Carlos Rojas', N'carlos@gmail.com', N'21434567', 0x02000000C11A52A0B9E66988C0C56A4924ED3CC265F14106BCA92AE7409923377B5A53F3, CAST(N'2022-05-25T16:19:51.083' AS DateTime), CAST(N'2022-05-25T16:19:51.083' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[USER] OFF
GO
ALTER TABLE [dbo].[SHOPPING]  WITH CHECK ADD  CONSTRAINT [FK_SHOPPING_USER] FOREIGN KEY([N_UserId])
REFERENCES [dbo].[USER] ([N_UserId])
GO
ALTER TABLE [dbo].[SHOPPING] CHECK CONSTRAINT [FK_SHOPPING_USER]
GO
ALTER TABLE [dbo].[SHOPPING_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_SHOPPING_DETAILS_PRODUCT] FOREIGN KEY([N_ProductId])
REFERENCES [dbo].[PRODUCT] ([N_ProductId])
GO
ALTER TABLE [dbo].[SHOPPING_DETAILS] CHECK CONSTRAINT [FK_SHOPPING_DETAILS_PRODUCT]
GO
ALTER TABLE [dbo].[SHOPPING_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_SHOPPING_DETAILS_SHOPPING] FOREIGN KEY([N_ShoppingId])
REFERENCES [dbo].[SHOPPING] ([N_ShoppingId])
GO
ALTER TABLE [dbo].[SHOPPING_DETAILS] CHECK CONSTRAINT [FK_SHOPPING_DETAILS_SHOPPING]
GO
/****** Object:  StoredProcedure [dbo].[Up_ManagementProduct]    Script Date: 27/05/2022 13:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Up_ManagementProduct]

  @pOpcion    Int                            
 ,@parameter Varchar(Max) 
as
BEGIN

 Declare @tParametro As Table
						(id Int Identity(1,1) Primary key, 
						 valor Varchar(max)
						);  

 If(Len(Ltrim(Rtrim(@parameter))) > 0)                             
  Begin                            
    Insert Into @tParametro(valor)  Select * From string_split(@parameter, '|');     		
  End
  
  BEGIN
  DECLARE       @pN_ProductId    INT
			   ,@pV_Name         Varchar(50)
               ,@pV_Description  Varchar(250)
               ,@pD_Price        DECIMAL(18,2)
			   ,@pN_Stock        INT
			   ,@pN_UserId       INT

  END

  IF @pOpcion = 1
  BEGIN		
		 SET   @pV_Name        = (Select valor From @tParametro where id = 1);      
		 SET   @pV_Description = (Select valor From @tParametro where id = 2);      
		 SET   @pD_Price       = (Select replace(valor,',','.') From @tParametro where id = 3);      
		 SET   @pN_Stock       = (Select valor From @tParametro where id = 4);      
		 SET   @pN_UserId      = (Select valor From @tParametro where id = 5);      
		 BEGIN
			INSERT INTO dbo.PRODUCT (
									  V_Name,V_Description,D_Price
									  ,N_Stock,N_UserId,DT_CreatedDate
									  ,DT_ModifiedDate,B_IsDeleted
									)
			VALUES (
						@pV_Name,
						@pV_Description,@pD_Price,@pN_Stock,@pN_UserId,
						GETDATE(),GETDATE(),1
					)
					SELECT IDENT_CURRENT ('dbo.PRODUCT') as productId
		  END		 
  END

  IF @pOpcion = 2
  BEGIN	
		 SET   @pN_ProductId    = (Select valor From @tParametro where id =1);        		     
		 SET   @pV_Name        = (Select valor From @tParametro where id = 2);      
		 SET   @pV_Description = (Select valor From @tParametro where id = 3);      
		 SET   @pD_Price       = (Select replace(valor,',','.') From @tParametro where id = 4);  		 
		 SET   @pN_UserId      = (Select valor From @tParametro where id = 5);        		     

		 BEGIN		 
		 
		 UPDATE [dbo].PRODUCT SET
					V_Name	      = @pV_Name,
					V_Description = @pV_Description,
					D_Price       = @pD_Price,
					N_UserId      = @pN_UserId,
					DT_ModifiedDate =GETDATE()
		 WHERE   N_ProductId      = @pN_ProductId
		 END		 
  END

  IF @pOpcion = 3
	BEGIN		
	    
	    SET   @pN_ProductId    = (Select valor From @tParametro where id =1);
		BEGIN
			UPDATE [dbo].PRODUCT SET [B_IsDeleted] = 0
			 WHERE   N_ProductId      = @pN_ProductId		      
		END		 
	END

  IF @pOpcion = 4
	BEGIN			    
		 SET   @pN_ProductId    = (Select valor From @tParametro where id =1); 
		
		SELECT N_ProductId,V_Name,V_Description,D_Price,N_Stock
		FROM [dbo].PRODUCT   WHERE   N_ProductId = @pN_ProductId AND B_IsDeleted = 1	 		      						      		 
	END

END
--	exec  Up_ManagementProduct 1,N'Leche|Leche evaporada|3,5|120|2'
--exec  Up_ManagementProduct 1,N'Producto 02|producto Bebidas |12.98|50|2'
--exec  Up_ManagementProduct 2,N'1|Producto 01|producto lacteos|2.89|1'
--exec  Up_ManagementProduct 3,N'1'
--exec  Up_ManagementProduct 4,N'2'

--select * from product
--truncate table product

--delete from product
GO
/****** Object:  StoredProcedure [dbo].[Up_ManagementUser]    Script Date: 27/05/2022 13:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Up_ManagementUser]

  @pOpcion    Int                            
 ,@pParametro Varchar(Max) 
as
BEGIN

 Declare @tParametro As Table
						(id Int Identity(1,1) Primary key, 
						 valor Varchar(max)
						);  

 If(Len(Ltrim(Rtrim(@pParametro))) > 0)                             
  Begin                            
    Insert Into @tParametro(valor)  Select * From string_split(@pParametro, '|');     	
  End
  
  BEGIN
  DECLARE       @pN_UserId         INT
			   ,@pV_Name           Varchar(50)
			   ,@pV_Email          Varchar(50) 
			   ,@pV_NumberIdentity Varchar(50)
			   ,@pV_Password       Varchar(8)			   
			   ,@pV_OldPassword   Varchar(8) 
  END

  IF @pOpcion = 1
  BEGIN		
		 SET   @pV_Name =		    (Select valor From @tParametro where id = 1);      
		 SET   @pV_Email =          (Select valor From @tParametro where id = 2);      
		 SET   @pV_NumberIdentity = (Select valor From @tParametro where id = 3);      
		 SET   @pV_Password =       (Select valor From @tParametro where id = 4);      

		 BEGIN
			INSERT INTO [dbo].[USER] (
									  V_Name,V_Email,V_NumberIdentity,
									  V_Password,
									  DT_CreatedDate,
									  DT_ModifiedDate,B_IsDeleted
									  )
			VALUES (
						@pV_Name,@pV_Email,
						@pV_NumberIdentity,ENCRYPTBYPASSPHRASE('password', @pV_Password),
						GETDATE(),GETDATE(),1
					)
		  END		 
  END

  IF @pOpcion = 2
  BEGIN	
		 SET   @pN_UserId         = (Select valor From @tParametro where id = 1);      
		 SET   @pV_Name           = (Select valor From @tParametro where id = 2);      
		 SET   @pV_Email          = (Select valor From @tParametro where id = 3);      
		 SET   @pV_NumberIdentity = (Select valor From @tParametro where id = 4);      		     

		 BEGIN		 
		 
		 UPDATE [dbo].[USER] SET
						      V_Name           = @pV_Name
							 ,V_Email          = @pV_Email
							 ,V_NumberIdentity = @pV_NumberIdentity
							 ,DT_ModifiedDate   = GETDATE()
		 WHERE  N_UserId   = @pN_UserId
		 END		 
  END

  IF @pOpcion = 3
	BEGIN		
	    
		SET   @pN_UserId = (Select valor From @tParametro where id = 1);      
		BEGIN
			UPDATE [dbo].[USER] SET [B_IsDeleted] = 0
			WHERE  N_UserId = @pN_UserId			      
		END		 
	END

  IF @pOpcion = 4
	BEGIN			    
		SET   @pN_UserId = (Select valor From @tParametro where id = 1);     
		
		SELECT N_UserId, V_Name,V_Email, V_NumberIdentity,V_Password
		FROM [dbo].[USER]  WHERE  N_UserId = @pN_UserId			      						      		
	END

  IF @pOpcion = 5
	BEGIN		
	    
		 DECLARE @V_V_OldPassword AS VARCHAR(8),@V_V_CurrentPassword AS VARCHAR(8);
		 
		 SET     @pN_UserId       = (Select valor From @tParametro where id = 1);      		 
		 SET     @pV_Password     = (Select valor From @tParametro where id = 2);      		 
		 SET     @pV_OldPassword  = (Select valor From @tParametro where id = 3);      		 				 

		 SET     @V_V_CurrentPassword = ( SELECT CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('password', V_Password)) FROM 
										  [USER] WHERE  N_UserId = @pN_UserId
										)	
		
		IF(@V_V_CurrentPassword = @pV_OldPassword)		 		       
		BEGIN
			UPDATE [dbo].[USER] SET V_Password = ENCRYPTBYPASSPHRASE('password', @pV_Password) WHERE  N_UserId = @pN_UserId			      
		END	
		ELSE
		BEGIN
			Select 'old password error.' as messages
		END
	END

END
GO
