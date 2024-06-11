CREATE TABLE [dbo].[StaffLogin] (
    [LoginID]  INT           IDENTITY (1, 1) NOT NULL,
    [Username] NVARCHAR (20) NULL,
    [Password] NVARCHAR (20) NULL,
    PRIMARY KEY CLUSTERED ([LoginID] ASC)
);
