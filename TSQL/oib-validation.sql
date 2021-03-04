 
-------------------------------------------------------------------
-- Provjerava ispravnosti OIB-a
-------------------------------------------------------------------

--Dropaj funkciju ako postoji
IF (OBJECT_ID(N'dbo.CheckOIB', N'FN') IS NOT NULL)
	DROP FUNCTION dbo.CheckOIB;
GO
CREATE FUNCTION dbo.CheckOIB
(
	@oib varchar(20)
)
RETURNS bit
AS
BEGIN
	DECLARE @res AS BIT = 0;
	IF (LEN(@oib) <> 11) 
	BEGIN
		SET @res = 0;
	END;
	ELSE
	BEGIN
		DECLARE @i AS INT = 1;
		DECLARE @a AS INT = 10;
		DECLARE @invalid AS BIT = 0;
		WHILE (@i < 11)
		BEGIN
			DECLARE @znamenka AS char = SUBSTRING(@oib, @i, 1);
			IF (@znamenka IN ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9'))
			BEGIN 
				SET @a = @a + CAST(@znamenka as int);
				SET @a = @a % 10;
				IF (@a = 0)
					SET @a = 10;
				SET @a = (@a * 2) % 11;
			END;
			ELSE
			BEGIN
				SET @res = 0;
				SET @invalid = 1;
				BREAK;
			END;
			SET @i = @i + 1;
		END;
		IF (@invalid = 0)
		BEGIN
			DECLARE @kontrolni AS INT = 11 - @a;
			if (@kontrolni = 10)
				SET @kontrolni = 0;
			DECLARE @zadnjaznamenka AS char(1) = SUBSTRING(@oib, 11, 1);
		
			IF (CAST(@zadnjaznamenka AS INT) = @kontrolni)
				SET @res = 1;			
		END;
	END;
	RETURN @res;
END;
----TEST - UPOTREBA
--SELECT dbo.CheckOIB('00000000001');