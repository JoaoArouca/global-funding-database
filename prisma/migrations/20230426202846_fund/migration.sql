/*
  Warnings:

  - You are about to drop the column `maxValueReembolsaveis` on the `fund` table. All the data in the column will be lost.
  - You are about to drop the column `maxValueSubvencao` on the `fund` table. All the data in the column will be lost.
  - You are about to drop the column `minValueReembolsaveis` on the `fund` table. All the data in the column will be lost.
  - You are about to drop the column `minValueSubvencao` on the `fund` table. All the data in the column will be lost.
  - Added the required column `maxValue` to the `fund` table without a default value. This is not possible if the table is not empty.
  - Added the required column `minValue` to the `fund` table without a default value. This is not possible if the table is not empty.
  - Made the column `requiresPartner` on table `fund` required. This step will fail if there are existing NULL values in that column.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[fund] DROP CONSTRAINT [fund_currency_df];
ALTER TABLE [dbo].[fund] ALTER COLUMN [requiresPartner] NVARCHAR(1000) NOT NULL;
ALTER TABLE [dbo].[fund] DROP COLUMN [maxValueReembolsaveis],
[maxValueSubvencao],
[minValueReembolsaveis],
[minValueSubvencao];
ALTER TABLE [dbo].[fund] ADD [maxValue] NVARCHAR(1000) NOT NULL,
[minValue] NVARCHAR(1000) NOT NULL;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
