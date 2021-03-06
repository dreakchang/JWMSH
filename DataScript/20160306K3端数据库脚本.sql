

CREATE Procedure [dbo].[develop_StockBill]
     @FBillNo   nvarchar(255) output,       --入库单号
     @FInterID   int               --单据内码
     as
/*入库主表要写入的数据*/
/*作者:zqs*/
/*日期:2013年7月8日 15:21:37*/
     declare    
          @FBrNo   varchar(10),               --公司机构内码
          @FTranType   smallint,               --单据类型
          @FCancellation   bit,               --作废
          @FStatus   smallint,               --状态
          @FUpStockWhenSave   bit,          --更新库存
          @FROB   smallint,                    --红蓝字
          @FHookStatus   smallint,          --钩稽标志
          @Fdate   datetime,                    --单据日期
          @FDeptID   int,                         --部门
          @FCheckDate   datetime,               --审核日期
          @FFManagerID   int,                    --验收人
          @FSManagerID   int,                    --保管人
          @FBillerID   int,                    --制单人
          @FVchInterID   int,                    --凭证内码
          @FSelTranType   int,               --源单类型
          @FManageType   int,                    --保税监管类型
          @FPrintCount   smallint               --打印次数
/*以上为主表要写入的数据*/


--获取入库单号
select  @FBillNo=replace(FDesc,'+','') from ICBillNo Where FBillID = '2';

--设置公司机构内码
set @FBrNo='0';

--设置单据类型 是否作废 设置状态
set @FTranType=2;
set @FCancellation=0;
set @FStatus=0;
--设置是否已经更新库存标志
set @FUpStockWhenSave=0;
--设置红蓝字
set @FROB=1;  
--设置 钩稽标志
set @FHookStatus=0;

--单据日期
set @Fdate=(select Convert(varchar(100),GETDATE(),23))
--部门
set @FDeptID=272;   --部门是从这里取   select * from t_Department
--验收人  保管人  制单人
set @FFManagerID=251;
set @FSManagerID=276;
set @FBillerID=16422;
--凭证内码
set @FVchInterID=0;
--源单类型 581   来源 select * from ICTransactiontype
set @FSelTranType=0;
--保税监管类型      打印次数   
set @FManageType=0;
set @FPrintCount=0;

/*以上为主表要写入的数据*/
begin transaction
                    INSERT INTO ICStockBill(FInterID,FBillNo,FBrNo,FTranType,FCancellation,FStatus,
     FUpStockWhenSave,FROB,FHookStatus,Fdate,FDeptID,FCheckDate,FFManagerID,FSManagerID,FBillerID,
     FVchInterID,FSelTranType,FManageType,FPrintCount)
                    VALUES(@FInterID,@FBillNo,@FBrNo,@FTranType,@FCancellation,@FStatus,@FUpStockWhenSave,
     @FROB,@FHookStatus,@Fdate,@FDeptID,@FCheckDate,@FFManagerID,@FSManagerID,@FBillerID,@FVchInterID,
     @FSelTranType,@FManageType,@FPrintCount)
     update ICBillNo set FcurNo=FcurNo+1,Fdesc='RKD+'+right('000000'+convert(nvarchar,(FcurNo+2)),6) Where FBillID = '2';

	

if @@ERROR<>0
begin
     rollback transaction
     return -1
end
commit transaction
return 1
GO
/****** Object:  StoredProcedure [dbo].[develop_StockBill_Delivery]    Script Date: 2016/3/6 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[develop_StockBill_Delivery]
     @FBillNo   nvarchar(255) output,       --入库单号
     @FInterID   int               --单据内码
     as
/*入库主表要写入的数据*/
/*作者:zqs*/
/*日期:2013年7月8日 15:21:37*/
     declare    
          @FBrNo   varchar(10),               --公司机构内码
          @FTranType   smallint,               --单据类型
          @FCancellation   bit,               --作废
          @FStatus   smallint,               --状态
          @FUpStockWhenSave   bit,          --更新库存
          @FROB   smallint,                    --红蓝字
          @FHookStatus   smallint,          --钩稽标志
          @Fdate   datetime,                    --单据日期
          @FDeptID   int,                         --部门
          @FCheckDate   datetime,               --审核日期
          @FFManagerID   int,                    --验收人
          @FSManagerID   int,                    --保管人
          @FBillerID   int,                    --制单人
          @FVchInterID   int,                    --凭证内码
          @FSelTranType   int,               --源单类型
          @FManageType   int,                    --保税监管类型
          @FPrintCount   smallint               --打印次数
/*以上为主表要写入的数据*/


--获取入库单号
select  @FBillNo=replace(FDesc,'+','') from ICBillNo Where FBillID = '21';

--设置公司机构内码
set @FBrNo='0';

--设置单据类型 是否作废 设置状态
set @FTranType=21;
set @FCancellation=0;
set @FStatus=0;
--设置是否已经更新库存标志
set @FUpStockWhenSave=0;
--设置红蓝字
set @FROB=1;  
--设置 钩稽标志
set @FHookStatus=0;

--单据日期
set @Fdate=(select Convert(varchar(100),GETDATE(),23))
--部门
set @FDeptID=272;   --部门是从这里取   select * from t_Department
--验收人  保管人  制单人
set @FFManagerID=275;
set @FSManagerID=276;
set @FBillerID=16447;
--凭证内码
set @FVchInterID=0;
--源单类型 581   来源 select * from ICTransactiontype
set @FSelTranType=0;
--保税监管类型      打印次数   
set @FManageType=0;
set @FPrintCount=0;

/*以上为主表要写入的数据*/
begin transaction
                    INSERT INTO ICStockBill(FInterID,FBillNo,FBrNo,FTranType,FCancellation,FStatus,
     FUpStockWhenSave,FROB,FHookStatus,Fdate,FDeptID,FCheckDate,FFManagerID,FSManagerID,FBillerID,
     FVchInterID,FSelTranType,FManageType,FPrintCount)
                    VALUES(@FInterID,@FBillNo,@FBrNo,@FTranType,@FCancellation,@FStatus,@FUpStockWhenSave,
     @FROB,@FHookStatus,@Fdate,@FDeptID,@FCheckDate,@FFManagerID,@FSManagerID,@FBillerID,@FVchInterID,
     @FSelTranType,@FManageType,@FPrintCount)
     update ICBillNo set FcurNo=FcurNo+1,Fdesc='CKD+'+right('000000'+convert(nvarchar,(FcurNo+2)),6) Where FBillID = '21';

	

if @@ERROR<>0
begin
     rollback transaction
     return -1
end
commit transaction
return 1
GO
/****** Object:  StoredProcedure [dbo].[develop_StockBill_Purchase]    Script Date: 2016/3/6 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[develop_StockBill_Purchase]
     @FBillNo   nvarchar(255) output,       --入库单号
     @FInterID   int               --单据内码
     as
/*入库主表要写入的数据*/
/*作者:zqs*/
/*日期:2013年7月8日 15:21:37*/
     declare    
          @FBrNo   varchar(10),               --公司机构内码
          @FTranType   smallint,               --单据类型
          @FCancellation   bit,               --作废
          @FStatus   smallint,               --状态
          @FUpStockWhenSave   bit,          --更新库存
          @FROB   smallint,                    --红蓝字
          @FHookStatus   smallint,          --钩稽标志
          @Fdate   datetime,                    --单据日期
          @FDeptID   int,                         --部门
          @FCheckDate   datetime,               --审核日期
          @FFManagerID   int,                    --验收人
          @FSManagerID   int,                    --保管人
          @FBillerID   int,                    --制单人
          @FVchInterID   int,                    --凭证内码
          @FSelTranType   int,               --源单类型
          @FManageType   int,                    --保税监管类型
          @FPrintCount   smallint               --打印次数
/*以上为主表要写入的数据*/


--获取入库单号
select  @FBillNo=replace(FDesc,'+','') from ICBillNo Where FBillID = '1';

--设置公司机构内码
set @FBrNo='0';

--设置单据类型 是否作废 设置状态
set @FTranType=1;
set @FCancellation=0;
set @FStatus=0;
--设置是否已经更新库存标志
set @FUpStockWhenSave=0;
--设置红蓝字
set @FROB=1;  
--设置 钩稽标志
set @FHookStatus=0;

--单据日期
set @Fdate=(select Convert(varchar(100),GETDATE(),23))
--部门
set @FDeptID=272;   --部门是从这里取   select * from t_Department
--验收人  保管人  制单人
set @FFManagerID=251;
set @FSManagerID=277;
set @FBillerID=16441;
--凭证内码
set @FVchInterID=0;
--源单类型 581   来源 select * from ICTransactiontype
set @FSelTranType=0;
--保税监管类型      打印次数   
set @FManageType=0;
set @FPrintCount=0;

/*以上为主表要写入的数据*/
begin transaction
                    INSERT INTO ICStockBill(FInterID,FBillNo,FBrNo,FTranType,FCancellation,FStatus,
     FUpStockWhenSave,FROB,FHookStatus,Fdate,FDeptID,FCheckDate,FFManagerID,FSManagerID,FBillerID,
     FVchInterID,FSelTranType,FManageType,FPrintCount)
                    VALUES(@FInterID,@FBillNo,@FBrNo,@FTranType,@FCancellation,@FStatus,@FUpStockWhenSave,
     @FROB,@FHookStatus,@Fdate,@FDeptID,@FCheckDate,@FFManagerID,@FSManagerID,@FBillerID,@FVchInterID,
     @FSelTranType,@FManageType,@FPrintCount)
     update ICBillNo set FcurNo=FcurNo+1,Fdesc='SHD+'+right('000000'+convert(nvarchar,(FcurNo+2)),6) Where FBillID = '1';

	

if @@ERROR<>0
begin
     rollback transaction
     return -1
end
commit transaction
return 1
GO
/****** Object:  StoredProcedure [dbo].[develop_StockBillEntry]    Script Date: 2016/3/6 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[develop_StockBillEntry]
/*子表要传入的数据*/
/*作者:zqs*/
/*2013年7月8日 16:50:50*/
     @FInterID               int,                    --单据内码
     @FBrNo                  varchar(10),          --公司机构内码
     @FItemID                int,         --产品内码
     @FEntryID               int,                    --分录号 即行号
     @FQty                   decimal(28, 10),    --实际数量
     @Fnote                  varchar(255) ,         --备注
     @FSPNumber              nvarchar(50)                         --目标仓位
     
     as
     /*以下为子表定义变量*/
          declare
          
          @FAuxPropID               int,               --辅助属性
          @FBatchNo               varchar(200),               --批次
          @FQtyMust               decimal(28, 10),          --申请数量
          @FUnitID               int,                         --单位内码
          @FAuxQtyMust          decimal(28, 10),          --辅助账存数量
          @Fauxqty               decimal(28, 10),          --辅助实际数量
          @FSecCoefficient     decimal(28, 10),          --换算率
          @FSecQty               decimal(28, 10),          --辅助数量
          @FAuxPlanPrice          decimal(28, 10),          --辅助计划价
          @FPlanAmount          decimal(20, 2),               --计划价金额
          @Fauxprice               decimal(28, 10),          --辅助单价
          @Famount               decimal(20, 2),               --金额
          @FKFPeriod               int,                         --保质期
          @FDCStockID             int,                         --调入仓库
		  @FDCSPID                int,                         --目标仓位
          @FSNListID               int,                         --序列号
          @FSourceBillNo          nvarchar(255),               --源单单号
          @FSourceTranType    int,                         --源单类型
          @FSourceInterId          int,                         --源单内码
          @FSourceEntryID          int,                         --原分录号
          @FICMOBillNo          nvarchar(255),               --生产任务单号
          @FICMOInterID          int,                         --任务单内码
          @FPPBomEntryID          int,                         --投料单分录号
          @FPlanMode               int,                         --计划模式
          @FMTONo                    nvarchar(50),               --计划跟踪号
          @FChkPassItem          int                              --PassItem
			
	--仓位
	set @FDCSPID=(select top 1 FSPID from t_StockPlace where FNumber=@FSPNumber);

     --辅助属性
     set     @FAuxPropID=0;
     --批次
     set     @FBatchNo='';
     --申请数量
     set     @FQtyMust=0;
     --辅助账存数量
     set @FAuxQtyMust=0;
     --单位内码
     set @FUnitID=(select FUnitID  from t_ICItem where FItemID=@FItemID);
     --辅助实际数量
     set     @Fauxqty=@FQty;    
     --换算率
     set     @FSecCoefficient=0;
     --辅助数量
     set     @FSecQty=0;
     --辅助计划价
     set     @FAuxPlanPrice=0;
     --计划价金额
     set     @FPlanAmount=0;
     --辅助单价
     set     @Fauxprice=0;
     --金额
     set     @Famount=0;
     --保质期
     set     @FKFPeriod=null;
     ----调入仓库
     set     @FDCStockID=284;
     ----目标仓位
     --set     @FDCSPID=0;
     --序列号
     set     @FSNListID=0;
     --源单单号
     set     @FSourceBillNo='';
     --源单类型
     set     @FSourceTranType=0;
     --源单内码
     set     @FSourceInterId     =0;
     --原分录号
     set     @FSourceEntryID     =0;
     --生产任务单号
     set     @FICMOBillNo='';
     --任务单内码
     set     @FICMOInterID=0;
     --投料单分录号    
     set     @FPPBomEntryID=0;
     --计划模式
     set     @FPlanMode=14036;
     --计划跟踪号    
     set     @FMTONo='';
     set     @FChkPassItem=1058;

    
begin transaction
          INSERT INTO ICStockBillEntry (FInterID,FEntryID,FBrNo,FItemID,FAuxPropID,FBatchNo,FQtyMust,
     FQty,FUnitID,FAuxQtyMust,Fauxqty,FSecCoefficient,FSecQty,FAuxPlanPrice,FPlanAmount,Fauxprice,
     Famount,Fnote,FPeriodDate,FDCStockID,FDCSPID,FSNListID,FSourceBillNo,
     FSourceTranType,FSourceInterId,FSourceEntryID,FICMOBillNo,FICMOInterID,
     FPPBomEntryID,FPlanMode,FMTONo,FChkPassItem)
     VALUES (@FInterID,@FEntryID,@FBrNo,@FItemID,@FAuxPropID,@FBatchNo,@FQtyMust,@FQty,@FUnitID,@FAuxQtyMust,@Fauxqty,
               @FSecCoefficient,@FSecQty,@FAuxPlanPrice,@FPlanAmount,@Fauxprice,@Famount,@Fnote,@FKFPeriod,@FDCStockID,
               @FDCSPID,@FSNListID,@FSourceBillNo,@FSourceTranType,@FSourceInterId,@FSourceEntryID,@FICMOBillNo,@FICMOInterID,
               @FPPBomEntryID,@FPlanMode,@FMTONo,@FChkPassItem)
          EXEC p_UpdateBillRelateData 2,@FInterID,'ICStockBill','ICStockBillEntry'
if @@ERROR<>0
begin
     rollback transaction;
     return -1;
end
commit transaction
return 1;
GO
/****** Object:  StoredProcedure [dbo].[develop_StockBillEntry_Delivery]    Script Date: 2016/3/6 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[develop_StockBillEntry_Delivery]
/*子表要传入的数据*/
/*作者:zqs*/
/*2013年7月8日 16:50:50*/
     @FInterID               int,                    --单据内码
     @FBrNo                  varchar(10),          --公司机构内码
     @FItemID                int,         --产品内码
     @FEntryID               int,                    --分录号 即行号
     @FQty                   decimal(28, 10),    --实际数量
     @Fnote                  varchar(255) ,         --备注
     @FSPNumber              nvarchar(50)                         --目标仓位
 
     as
     /*以下为子表定义变量*/
          declare
          
          @FAuxPropID               int,               --辅助属性
          @FBatchNo               varchar(200),               --批次
          @FQtyMust               decimal(28, 10),          --申请数量
          @FUnitID               int,                         --单位内码
          @FAuxQtyMust          decimal(28, 10),          --辅助账存数量
          @Fauxqty               decimal(28, 10),          --辅助实际数量
          @FSecCoefficient     decimal(28, 10),          --换算率
          @FSecQty               decimal(28, 10),          --辅助数量
          @FAuxPlanPrice          decimal(28, 10),          --辅助计划价
          @FPlanAmount          decimal(20, 2),               --计划价金额
          @Fauxprice               decimal(28, 10),          --辅助单价
          @Famount               decimal(20, 2),               --金额
          @FKFPeriod               int,                         --保质期
          @FDCStockID             int,                         --调入仓库
		  @FDCSPID                int,                         --目标仓位
          @FSNListID               int,                         --序列号
          @FSourceBillNo          nvarchar(255),               --源单单号
          @FSourceTranType    int,                         --源单类型
          
          @FSourceInterId    int,							--源单内码
          @FICMOBillNo          nvarchar(255),               --生产任务单号
          @FICMOInterID          int,                         --任务单内码
          @FPPBomEntryID          int,                         --投料单分录号
          @FPlanMode               int,                         --计划模式
          @FMTONo                    nvarchar(50),               --计划跟踪号
          @FChkPassItem          int                              --PassItem
			
	--仓位
	set @FDCSPID=(select top 1 FSPID from t_StockPlace where FNumber=@FSPNumber);

     --辅助属性
     set     @FAuxPropID=0;
     --批次
     set     @FBatchNo='';
     --申请数量
     set     @FQtyMust=0;
     --辅助账存数量
     set @FAuxQtyMust=0;
     --单位内码
     set @FUnitID=(select FUnitID  from t_ICItem where FItemID=@FItemID);
     --辅助实际数量
     set     @Fauxqty=@FQty;    
     --换算率
     set     @FSecCoefficient=0;
     --辅助数量
     set     @FSecQty=0;
     --辅助计划价
     set     @FAuxPlanPrice=0;
     --计划价金额
     set     @FPlanAmount=0;
     --辅助单价
     set     @Fauxprice=0;
     --金额
     set     @Famount=0;
     --保质期
     set     @FKFPeriod=null;
     ----调入仓库
     set     @FDCStockID=284;
     ----目标仓位
     --set     @FDCSPID=0;
     --序列号
     set     @FSNListID=0;
     --源单单号
     set     @FSourceBillNo='';
     --源单类型
     set     @FSourceTranType=0;
     --源单内码
     set     @FSourceInterId  ='';
     
     --生产任务单号
     set     @FICMOBillNo='';
     --任务单内码
     set     @FICMOInterID=0;
     --投料单分录号    
     set     @FPPBomEntryID=0;
     --计划模式
     set     @FPlanMode=14036;
     --计划跟踪号    
     set     @FMTONo='';
     set     @FChkPassItem=1058;

    
begin transaction
          INSERT INTO ICStockBillEntry (FInterID,FEntryID,FBrNo,FItemID,FAuxPropID,FBatchNo,FQtyMust,
     FQty,FUnitID,FAuxQtyMust,Fauxqty,FSecCoefficient,FSecQty,FAuxPlanPrice,FPlanAmount,Fauxprice,
     Famount,Fnote,FPeriodDate,FDCStockID,FDCSPID,FSNListID,FSourceBillNo,
     FSourceTranType,FSourceInterId,FSourceEntryID,FICMOBillNo,FICMOInterID,
     FPPBomEntryID,FPlanMode,FMTONo,FChkPassItem)
     VALUES (@FInterID,@FEntryID,@FBrNo,@FItemID,@FAuxPropID,@FBatchNo,@FQtyMust,@FQty,@FUnitID,@FAuxQtyMust,@Fauxqty,
               @FSecCoefficient,@FSecQty,@FAuxPlanPrice,@FPlanAmount,@Fauxprice,@Famount,@Fnote,@FKFPeriod,@FDCStockID,
               @FDCSPID,@FSNListID,@FSourceBillNo,@FSourceTranType,@FSourceInterId,'',@FICMOBillNo,@FICMOInterID,
               @FPPBomEntryID,@FPlanMode,@FMTONo,@FChkPassItem)
          EXEC p_UpdateBillRelateData 21,@FInterID,'ICStockBill','ICStockBillEntry'
if @@ERROR<>0
begin
     rollback transaction;
     return -1;
end
commit transaction
return 1;
GO
/****** Object:  StoredProcedure [dbo].[develop_StockBillEntry_Purchase]    Script Date: 2016/3/6 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[develop_StockBillEntry_Purchase]
/*子表要传入的数据*/
/*作者:zqs*/
/*2013年7月8日 16:50:50*/
     @FInterID               int,                    --单据内码
     @FBrNo                  varchar(10),          --公司机构内码
     @FItemID                int,         --产品内码
     @FEntryID               int,                    --分录号 即行号
     @FQty                   decimal(28, 10),    --实际数量
     @Fnote                  varchar(255) ,         --备注
     @FSPNumber              nvarchar(50),                         --目标仓位
     @FSourceEntryID          int,                         --原分录号
	 @cOrderNumber			 nvarchar(50)     --采购单号
     as
     /*以下为子表定义变量*/
          declare
          
          @FAuxPropID               int,               --辅助属性
          @FBatchNo               varchar(200),               --批次
          @FQtyMust               decimal(28, 10),          --申请数量
          @FUnitID               int,                         --单位内码
          @FAuxQtyMust          decimal(28, 10),          --辅助账存数量
          @Fauxqty               decimal(28, 10),          --辅助实际数量
          @FSecCoefficient     decimal(28, 10),          --换算率
          @FSecQty               decimal(28, 10),          --辅助数量
          @FAuxPlanPrice          decimal(28, 10),          --辅助计划价
          @FPlanAmount          decimal(20, 2),               --计划价金额
          @Fauxprice               decimal(28, 10),          --辅助单价
          @Famount               decimal(20, 2),               --金额
          @FKFPeriod               int,                         --保质期
          @FDCStockID             int,                         --调入仓库
		  @FDCSPID                int,                         --目标仓位
          @FSNListID               int,                         --序列号
          @FSourceBillNo          nvarchar(255),               --源单单号
          @FSourceTranType    int,                         --源单类型
          
          @FSourceInterId    int,							--源单内码
          @FICMOBillNo          nvarchar(255),               --生产任务单号
          @FICMOInterID          int,                         --任务单内码
          @FPPBomEntryID          int,                         --投料单分录号
          @FPlanMode               int,                         --计划模式
          @FMTONo                    nvarchar(50),               --计划跟踪号
          @FChkPassItem          int                              --PassItem
			
	--仓位
	set @FDCSPID=(select top 1 FSPID from t_StockPlace where FNumber=@FSPNumber);

     --辅助属性
     set     @FAuxPropID=0;
     --批次
     set     @FBatchNo='';
     --申请数量
     set     @FQtyMust=0;
     --辅助账存数量
     set @FAuxQtyMust=0;
     --单位内码
     set @FUnitID=(select FUnitID  from t_ICItem where FItemID=@FItemID);
     --辅助实际数量
     set     @Fauxqty=@FQty;    
     --换算率
     set     @FSecCoefficient=0;
     --辅助数量
     set     @FSecQty=0;
     --辅助计划价
     set     @FAuxPlanPrice=0;
     --计划价金额
     set     @FPlanAmount=0;
     --辅助单价
     set     @Fauxprice=0;
     --金额
     set     @Famount=0;
     --保质期
     set     @FKFPeriod=null;
     ----调入仓库
     set     @FDCStockID=284;
     ----目标仓位
     --set     @FDCSPID=0;
     --序列号
     set     @FSNListID=0;
     --源单单号
     set     @FSourceBillNo=@cOrderNumber;
     --源单类型
     set     @FSourceTranType=71;
     --源单内码
     set     @FSourceInterId  =(select top 1 FInterID from POOrder where FBillNo=@cOrderNumber);
     
     --生产任务单号
     set     @FICMOBillNo='';
     --任务单内码
     set     @FICMOInterID=0;
     --投料单分录号    
     set     @FPPBomEntryID=0;
     --计划模式
     set     @FPlanMode=14036;
     --计划跟踪号    
     set     @FMTONo='';
     set     @FChkPassItem=1058;

    
begin transaction
          INSERT INTO ICStockBillEntry (FInterID,FEntryID,FBrNo,FItemID,FAuxPropID,FBatchNo,FQtyMust,
     FQty,FUnitID,FAuxQtyMust,Fauxqty,FSecCoefficient,FSecQty,FAuxPlanPrice,FPlanAmount,Fauxprice,
     Famount,Fnote,FPeriodDate,FDCStockID,FDCSPID,FSNListID,FSourceBillNo,
     FSourceTranType,FSourceInterId,FSourceEntryID,FICMOBillNo,FICMOInterID,
     FPPBomEntryID,FPlanMode,FMTONo,FChkPassItem)
     VALUES (@FInterID,@FEntryID,@FBrNo,@FItemID,@FAuxPropID,@FBatchNo,@FQtyMust,@FQty,@FUnitID,@FAuxQtyMust,@Fauxqty,
               @FSecCoefficient,@FSecQty,@FAuxPlanPrice,@FPlanAmount,@Fauxprice,@Famount,@Fnote,@FKFPeriod,@FDCStockID,
               @FDCSPID,@FSNListID,@FSourceBillNo,@FSourceTranType,@FSourceInterId,@FSourceEntryID,@FICMOBillNo,@FICMOInterID,
               @FPPBomEntryID,@FPlanMode,@FMTONo,@FChkPassItem)
          EXEC p_UpdateBillRelateData 1,@FInterID,'ICStockBill','ICStockBillEntry'
if @@ERROR<>0
begin
     rollback transaction;
     return -1;
end
commit transaction
return 1;
GO
