
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/19/2014 21:34:33
-- Generated from EDMX file: E:\02_c#_workspace\db-afs\DB_AFS\DB_AFS\Database\ERM-Modell.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Datenbank];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_KundeSendung]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SendungSet] DROP CONSTRAINT [FK_KundeSendung];
GO
IF OBJECT_ID(N'[dbo].[FK_KundeLadestelle_Kunde]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KundeLadestelle] DROP CONSTRAINT [FK_KundeLadestelle_Kunde];
GO
IF OBJECT_ID(N'[dbo].[FK_KundeLadestelle_Ladestelle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KundeLadestelle] DROP CONSTRAINT [FK_KundeLadestelle_Ladestelle];
GO
IF OBJECT_ID(N'[dbo].[FK_LadestelleSendung]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SendungSet] DROP CONSTRAINT [FK_LadestelleSendung];
GO
IF OBJECT_ID(N'[dbo].[FK_LadestelleSendung1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SendungSet] DROP CONSTRAINT [FK_LadestelleSendung1];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[KundeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KundeSet];
GO
IF OBJECT_ID(N'[dbo].[SendungSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SendungSet];
GO
IF OBJECT_ID(N'[dbo].[LadestelleSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LadestelleSet];
GO
IF OBJECT_ID(N'[dbo].[KundeLadestelle]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KundeLadestelle];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Kunde'
CREATE TABLE [dbo].[Kunde] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Adresse] nvarchar(max)  NOT NULL,
    [Hausnummer] nvarchar(max)  NOT NULL,
    [PLZ] smallint  NOT NULL,
    [LKZ] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Sendung'
CREATE TABLE [dbo].[Sendung] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [KundeId] int  NOT NULL,
    [Typ] nvarchar(max)  NOT NULL,
    [VonId] int  NOT NULL,
    [NachId] int  NOT NULL
);
GO

-- Creating table 'Ladestelle'
CREATE TABLE [dbo].[Ladestelle] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Adresse] nvarchar(max)  NOT NULL,
    [Hausnummer] smallint  NOT NULL,
    [PLZ] smallint  NOT NULL,
    [LKZ] nvarchar(10)  NOT NULL
);
GO

-- Creating table 'KundeLadestelle'
CREATE TABLE [dbo].[KundeLadestelle] (
    [Kunde_Id] int  NOT NULL,
    [Ladestelle_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Kunde'
ALTER TABLE [dbo].[Kunde]
ADD CONSTRAINT [PK_Kunde]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Sendung'
ALTER TABLE [dbo].[Sendung]
ADD CONSTRAINT [PK_Sendung]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ladestelle'
ALTER TABLE [dbo].[Ladestelle]
ADD CONSTRAINT [PK_Ladestelle]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Kunde_Id], [Ladestelle_Id] in table 'KundeLadestelle'
ALTER TABLE [dbo].[KundeLadestelle]
ADD CONSTRAINT [PK_KundeLadestelle]
    PRIMARY KEY CLUSTERED ([Kunde_Id], [Ladestelle_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [KundeId] in table 'Sendung'
ALTER TABLE [dbo].[Sendung]
ADD CONSTRAINT [FK_KundeSendung]
    FOREIGN KEY ([KundeId])
    REFERENCES [dbo].[Kunde]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_KundeSendung'
CREATE INDEX [IX_FK_KundeSendung]
ON [dbo].[Sendung]
    ([KundeId]);
GO

-- Creating foreign key on [Kunde_Id] in table 'KundeLadestelle'
ALTER TABLE [dbo].[KundeLadestelle]
ADD CONSTRAINT [FK_KundeLadestelle_Kunde]
    FOREIGN KEY ([Kunde_Id])
    REFERENCES [dbo].[Kunde]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Ladestelle_Id] in table 'KundeLadestelle'
ALTER TABLE [dbo].[KundeLadestelle]
ADD CONSTRAINT [FK_KundeLadestelle_Ladestelle]
    FOREIGN KEY ([Ladestelle_Id])
    REFERENCES [dbo].[Ladestelle]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_KundeLadestelle_Ladestelle'
CREATE INDEX [IX_FK_KundeLadestelle_Ladestelle]
ON [dbo].[KundeLadestelle]
    ([Ladestelle_Id]);
GO

-- Creating foreign key on [VonId] in table 'Sendung'
ALTER TABLE [dbo].[Sendung]
ADD CONSTRAINT [FK_LadestelleSendung]
    FOREIGN KEY ([VonId])
    REFERENCES [dbo].[Ladestelle]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LadestelleSendung'
CREATE INDEX [IX_FK_LadestelleSendung]
ON [dbo].[Sendung]
    ([VonId]);
GO

-- Creating foreign key on [NachId] in table 'Sendung'
ALTER TABLE [dbo].[Sendung]
ADD CONSTRAINT [FK_LadestelleSendung1]
    FOREIGN KEY ([NachId])
    REFERENCES [dbo].[Ladestelle]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LadestelleSendung1'
CREATE INDEX [IX_FK_LadestelleSendung1]
ON [dbo].[Sendung]
    ([NachId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------