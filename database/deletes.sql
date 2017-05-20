CREATE OR REPLACE PROCEDURE DELETE_NEWS(p_id IN NUMBER)
AS
BEGIN
	DELETE FROM NEWS WHERE NEWS_ID = p_id;
	commit;
END DELETE_NEWS;
/

CREATE OR REPLACE PROCEDURE DELETE_BOOKMARK(p_news_id IN NUMBER, p_user_id IN NUMBER)
AS
BEGIN
	DELETE FROM Likes WHERE News_id = p_news_id AND User_id = p_user_id;
	commit;
END DELETE_BOOKMARK;
/
