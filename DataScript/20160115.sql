USE [JWMSH_2016]
GO
/****** Object:  StoredProcedure [dbo].[Query_RmTrackingUseInProduct]    Script Date: 2016/1/15 23:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		upjd
-- Create date: 20160115	
-- Description:	Rm Batch Tracking
-- =============================================
CREATE PROCEDURE [dbo].[Query_RmTrackingUseInProduct]
	@cInvCode nvarchar(50),
	@FBatchNo nvarchar(50)
AS
BEGIN
	select * from View_ProductLabel where cSerialNumber in
	(select cSerialNumber from ShiftDetail where cInvCode=@cInvCode and FBatchNo=@FBatchNo group by cSerialNumber)
END

GO
/****** Object:  View [dbo].[View_ProductLabel]    Script Date: 2016/1/15 23:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ProductLabel]
AS
SELECT   a.AutoID, a.cSerialNumber, a.cBarCode, a.iQuantity, a.cDefine1, a.cDefine2, a.cDefine3, a.cDefine4, a.cMemo, b.BomID, 
                b.cFitemID, b.cInvCode, b.cInvName, b.cInvStd, b.cFullName, b.cOrderNumber, b.iQuantity AS iSheduleQty, b.dDate, 
                b.cMemo AS iSheduleMemo, b.cDeptName, b.dAddTime
FROM      dbo.ProductLabel AS a INNER JOIN
                dbo.Shift AS b ON a.cSerialNumber = b.cSerialNumber

GO




INSERT INTO [dbo].[BFunction]
           ([cFunction]
           ,[cModule]
           ,[bMenu]
           ,[cClass])
     VALUES
           ('产成品标签打印记录表'
           ,'报表中心'
           ,1
           ,'JWMSH.RptProLabelPrint')
GO


INSERT INTO [dbo].[BFunction]
           ([cFunction]
           ,[cModule]
           ,[bMenu]
           ,[cClass])
     VALUES
           ('产成品追溯表'
           ,'报表中心'
           ,1
           ,'JWMSH.RptProductSerialTracking')
GO

INSERT INTO [dbo].[BFunction]
           ([cFunction]
           ,[cModule]
           ,[bMenu]
           ,[cClass])
     VALUES
           ('原料批次追溯'
           ,'报表中心'
           ,1
           ,'JWMSH.RptRmLotTracking')
GO