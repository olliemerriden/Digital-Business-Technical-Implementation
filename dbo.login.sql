CREATE TABLE [dbo].[login] (
    [LoginID]       INT           IDENTITY (1, 1) NOT NULL,
    [LoginUsername] NVARCHAR (20) NULL,
    [LoginPassword] NVARCHAR (20) NULL,
    [CustomerID]    INT           NULL,
    PRIMARY KEY CLUSTERED ([LoginID] ASC),
    FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[customer] ([CustomerID])
);

