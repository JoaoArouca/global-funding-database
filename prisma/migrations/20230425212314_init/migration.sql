BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[fund] (
    [id] NVARCHAR(1000) NOT NULL,
    [title] NVARCHAR(1000) NOT NULL,
    [institution] NVARCHAR(1000) NOT NULL,
    [program] NVARCHAR(1000),
    [call] NVARCHAR(1000),
    [supportType] NVARCHAR(1000) NOT NULL,
    [requiresPartner] BIT,
    [TRLmin] NVARCHAR(1000) NOT NULL,
    [TRLmax] NVARCHAR(1000) NOT NULL,
    [term] NVARCHAR(1000) NOT NULL,
    [objective] NVARCHAR(1000),
    [elegibility] NVARCHAR(1000),
    [expenses] NVARCHAR(1000),
    [currency] NVARCHAR(1000) NOT NULL CONSTRAINT [fund_currency_df] DEFAULT 'BRL',
    [minValueReembolsaveis] NVARCHAR(1000) NOT NULL,
    [maxValueReembolsaveis] NVARCHAR(1000) NOT NULL,
    [minValueSubvencao] NVARCHAR(1000) NOT NULL,
    [maxValueSubvencao] NVARCHAR(1000) NOT NULL,
    [supportTax] NVARCHAR(1000) NOT NULL,
    [duration] NVARCHAR(1000) NOT NULL,
    [tax] NVARCHAR(1000) NOT NULL,
    [shortage] NVARCHAR(1000) NOT NULL,
    [amortization] NVARCHAR(1000) NOT NULL,
    [isESG] BIT NOT NULL CONSTRAINT [fund_isESG_df] DEFAULT 0,
    [link] NVARCHAR(1000) NOT NULL,
    [status] NVARCHAR(1000) NOT NULL,
    [lastRelease] NVARCHAR(1000) NOT NULL,
    [observation] NVARCHAR(1000),
    CONSTRAINT [fund_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [fund_title_key] UNIQUE NONCLUSTERED ([title])
);

-- CreateTable
CREATE TABLE [dbo].[Country] (
    [id] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [Country_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Region] (
    [id] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [Region_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Organization] (
    [id] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [Organization_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Sector] (
    [id] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [Sector_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[PartnerType] (
    [id] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [PartnerType_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Technology] (
    [id] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [Technology_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[_fund_region] (
    [A] NVARCHAR(1000) NOT NULL,
    [B] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [_fund_region_AB_unique] UNIQUE NONCLUSTERED ([A],[B])
);

-- CreateTable
CREATE TABLE [dbo].[_fund_organization] (
    [A] NVARCHAR(1000) NOT NULL,
    [B] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [_fund_organization_AB_unique] UNIQUE NONCLUSTERED ([A],[B])
);

-- CreateTable
CREATE TABLE [dbo].[_fund_sector] (
    [A] NVARCHAR(1000) NOT NULL,
    [B] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [_fund_sector_AB_unique] UNIQUE NONCLUSTERED ([A],[B])
);

-- CreateTable
CREATE TABLE [dbo].[_fund_partner] (
    [A] NVARCHAR(1000) NOT NULL,
    [B] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [_fund_partner_AB_unique] UNIQUE NONCLUSTERED ([A],[B])
);

-- CreateTable
CREATE TABLE [dbo].[_fund_technology] (
    [A] NVARCHAR(1000) NOT NULL,
    [B] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [_fund_technology_AB_unique] UNIQUE NONCLUSTERED ([A],[B])
);

-- CreateTable
CREATE TABLE [dbo].[_fund_country] (
    [A] NVARCHAR(1000) NOT NULL,
    [B] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [_fund_country_AB_unique] UNIQUE NONCLUSTERED ([A],[B])
);

-- CreateIndex
CREATE NONCLUSTERED INDEX [_fund_region_B_index] ON [dbo].[_fund_region]([B]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [_fund_organization_B_index] ON [dbo].[_fund_organization]([B]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [_fund_sector_B_index] ON [dbo].[_fund_sector]([B]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [_fund_partner_B_index] ON [dbo].[_fund_partner]([B]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [_fund_technology_B_index] ON [dbo].[_fund_technology]([B]);

-- CreateIndex
CREATE NONCLUSTERED INDEX [_fund_country_B_index] ON [dbo].[_fund_country]([B]);

-- AddForeignKey
ALTER TABLE [dbo].[_fund_region] ADD CONSTRAINT [_fund_region_A_fkey] FOREIGN KEY ([A]) REFERENCES [dbo].[fund]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[_fund_region] ADD CONSTRAINT [_fund_region_B_fkey] FOREIGN KEY ([B]) REFERENCES [dbo].[Region]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[_fund_organization] ADD CONSTRAINT [_fund_organization_A_fkey] FOREIGN KEY ([A]) REFERENCES [dbo].[fund]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[_fund_organization] ADD CONSTRAINT [_fund_organization_B_fkey] FOREIGN KEY ([B]) REFERENCES [dbo].[Organization]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[_fund_sector] ADD CONSTRAINT [_fund_sector_A_fkey] FOREIGN KEY ([A]) REFERENCES [dbo].[fund]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[_fund_sector] ADD CONSTRAINT [_fund_sector_B_fkey] FOREIGN KEY ([B]) REFERENCES [dbo].[Sector]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[_fund_partner] ADD CONSTRAINT [_fund_partner_A_fkey] FOREIGN KEY ([A]) REFERENCES [dbo].[fund]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[_fund_partner] ADD CONSTRAINT [_fund_partner_B_fkey] FOREIGN KEY ([B]) REFERENCES [dbo].[PartnerType]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[_fund_technology] ADD CONSTRAINT [_fund_technology_A_fkey] FOREIGN KEY ([A]) REFERENCES [dbo].[fund]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[_fund_technology] ADD CONSTRAINT [_fund_technology_B_fkey] FOREIGN KEY ([B]) REFERENCES [dbo].[Technology]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[_fund_country] ADD CONSTRAINT [_fund_country_A_fkey] FOREIGN KEY ([A]) REFERENCES [dbo].[Country]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[_fund_country] ADD CONSTRAINT [_fund_country_B_fkey] FOREIGN KEY ([B]) REFERENCES [dbo].[fund]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
