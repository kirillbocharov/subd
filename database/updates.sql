CREATE OR REPLACE PROCEDURE UPDATE_ARTICLE(p_article_id IN NUMBER, p_title IN VARCHAR, p_text IN VARCHAR, p_cat_id IN NUMBER )
AS
BEGIN
	UPDATE NEWS SET Header = p_title, Text_news = p_text WHERE News_id = p_article_id;
	UPDATE NEWS_CATEGORIES SET Category_id = p_cat_id WHERE News_id = p_article_id;
	commit;
END UPDATE_ARTICLE;
/



