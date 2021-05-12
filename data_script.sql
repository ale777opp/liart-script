BEGIN
DECLARE var1 varchar(255);
DECLARE var2 VARCHAR(20);
DECLARE var3 varchar(255);
DECLARE n int(255) DEFAULT 0;
DECLARE i int(255) DEFAULT 0;
SET @var4 = 5;
-- @var5 := 6;
SELECT COUNT(*)  FROM text_note INTO n;
WHILE i <= n DO
SELECT id FROM text_note LIMIT i,1 INTO @var4;
SELECT color INTO var2 FROM text_note WHERE id=@var4;
SELECT text_note INTO var1 FROM text_note WHERE id=@var4;
SELECT CONCAT(var2,var1) INTO var3; 
update text_note set text_note = var3 where id = @var4;
SET i = i + 1;
END WHILE;
END
