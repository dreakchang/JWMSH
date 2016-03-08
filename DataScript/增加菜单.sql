USE [JWMSH_2016]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[ManualAddFunction]
		@cFunction = N'产成品出库明细表',
		@cModule = N'报表中心',
		@bMenu = 1,
		@cClass = N'JWMSH.RptProDeliveryDetail'

SELECT	'Return Value' = @return_value

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[ManualAddFunction]
		@cFunction = N'产成品入库明细表',
		@cModule = N'报表中心',
		@bMenu = 1,
		@cClass = N'JWMSH.RptProStoreDetail'

SELECT	'Return Value' = @return_value

GO

