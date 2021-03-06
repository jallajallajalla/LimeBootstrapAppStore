USE []
GO
/****** Object:  StoredProcedure [dbo].[csp_getActivityTypes]    Script Date: 8.9.2014 17:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<ILE>
-- Create date: <2014-09-05>
-- Description:	<Used to return activity types>
-- =============================================
CREATE PROCEDURE [dbo].[csp_getActivityTypes]
		@@lang nvarchar(5)
AS
BEGIN
	-- FLAG_EXTERNALACCESS --
	
	DECLARE @lang nvarchar(5)
	set @lang = @@lang
	--CORRECT LANGUAGE BUG
	IF @lang = N'en-us'
		SET @lang = N'en_us'

	DECLARE @string nvarchar(512)
		
	SELECT
		CASE
			WHEN @@lang = 'en-us' THEN [en_us]

			WHEN @@lang = N'sv' THEN [sv]
			WHEN @@lang = N'en_us' THEN [en_us]
			WHEN @@lang = N'da' THEN [da]
			WHEN @@lang = N'no' THEN [no]
			WHEN @@lang = N'fi' THEN [fi]
			WHEN @@lang = N'is' THEN [is]
			WHEN @@lang = N'et' THEN [et]
			WHEN @@lang = N'lv' THEN [lv]
			WHEN @@lang = N'lt' THEN [lt]
			WHEN @@lang = N'de' THEN [de]
			WHEN @@lang = N'fr' THEN [fr]
			WHEN @@lang = N'nl' THEN [nl]
			WHEN @@lang = N'it' THEN [it]
			WHEN @@lang = N'es' THEN [es]
			WHEN @@lang = N'pt' THEN [pt]
			WHEN @@lang = N'pl' THEN [pl]
			WHEN @@lang = N'cs' THEN [cs]
			WHEN @@lang = N'sk' THEN [sk]
			WHEN @@lang = N'hu' THEN [hu]
			WHEN @@lang = N'hr' THEN [hr]
			WHEN @@lang = N'sl' THEN [sl]
			WHEN @@lang = N'ru' THEN [ru]
			WHEN @@lang = N'uk' THEN [uk]
			WHEN @@lang = N'ar' THEN [ar]
            ELSE ''
        END as [activityname]
	from string s
	where idcategory = dbo.lfn_getidcategory('type', 'history') and ([fi] <> '' or [en_us] <> '' or [sv] <> '' or [no] <> '')
	FOR XML RAW ('typename'), TYPE, ROOT ('activitytypes')
	
	
	
END