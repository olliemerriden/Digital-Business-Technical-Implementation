CREATE TABLE [dbo].[products] (
    [ComputerID]    INT             NOT NULL,
    [ComputerName]  NVARCHAR (50)   NULL,
    [ComputerPrice] DECIMAL (10, 2) NULL,
	[ComputerCpu] NVARCHAR(50) NULL,

    PRIMARY KEY CLUSTERED ([ComputerID] ASC)
);

