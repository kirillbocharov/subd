CREATE OR REPLACE PROCEDURE INC_NUMBERS_LIKE(p_article_id IN NUMBER)
AS
BEGIN
	UPDATE NEWS SET Number_likes = Number_likes + 1 WHERE News_id = p_article_id;
	commit;
END INC_NUMBERS_LIKE;
/
