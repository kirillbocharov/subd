CREATE OR REPLACE PROCEDURE INC_NUMBERS_LIKE(p_article_id IN NUMBER)
AS
BEGIN
	UPDATE NEWS SET Number_likes = Number_likes + 1 WHERE News_id = p_article_id;
	commit;
END INC_NUMBERS_LIKE;
/

CREATE OR REPLACE PROCEDURE INC_NUMBERS_LIKE_JOURNALIST(p_article_id IN NUMBER)
AS
BEGIN
	UPDATE NEWS SET Number_likes_journalist = Number_likes_journalist + 1 
		WHERE News_id = p_article_id;
	commit;
END INC_NUMBERS_LIKE_JOURNALIST;
/

CREATE OR REPLACE PROCEDURE MAKE_JOURNALIST(p_user_id IN NUMBER)
AS
BEGIN
	UPDATE USERS SET Status_id = 2 WHERE User_id = p_user_id;
	commit;
END MAKE_JOURNALIST;