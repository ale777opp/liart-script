BEGIN
DECLARE field_content LONGTEXT;
DECLARE field_create_date DATETIME;
DECLARE new_content LONGTEXT;
DECLARE n INT(11) DEFAULT 0;
DECLARE i INT(11) DEFAULT 0;
SELECT COUNT(*) FROM news_news INTO n;

WHILE  i <= 10 DO -- to process the entire database, change 10 to " n" and uncomment update
IF EXISTS(SELECT id  FROM news_news WHERE id BETWEEN i AND i) THEN
SELECT create_date FROM news_news WHERE id=i INTO field_create_date;
SELECT content FROM news_news WHERE id=i INTO field_content;
SELECT CONCAT('<p class="note">Дата: ',DATE_FORMAT(field_create_date,'%d.%m.%Y'),'</p>',field_content) INTO new_content;
SELECT new_content;
-- UPDATE news_news SET content = new_content WHERE id = i;
END IF;
SET i = i + 1;
END WHILE;

END
