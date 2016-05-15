CREATE OR REPLACE PROCEDURE ADD_USER(
 	p_user_name IN VARCHAR2,
 	p_password IN VARCHAR2,
 	p_email IN VARCHAR2,
	p_status_id IN NUMBER) AS 
BEGIN
	INSERT INTO USERS(User_name, Password, Status_id, Email)
		VALUES(p_user_name, p_password, p_status_id, p_email);
		commit;
END ADD_USER;


CREATE OR REPLACE PROCEDURE ADD_NEWS(
	p_data_sent VARCHAR2,
	p_user_id IN NUMBER,
	p_news IN VARCHAR2,
	p_header IN VARCHAR2,
	p_foto IN VARCHAR2,
	p_number_likes IN VARCHAR2,
	p_is_sand IN NUMBER) AS
BEGIN
	INSERT INTO NEWS(Date_sent, Is_sand, Text_news, Header, Foto, Number_likes, User_id)
		VALUES(p_data_sent, p_is_sand, p_news, p_header, p_foto, p_number_likes, p_user_id);
		commit;
END ADD_NEWS;


CREATE OR REPLACE PROCEDURE ADD_COMMENT(
	p_news_id IN NUMBER, 
	p_user_id IN NUMBER, 
	p_data_sent IN VARCHAR2, 
	p_text_cmt IN VARCHAR2) AS
BEGIN
	INSERT INTO COMMETS(News_id, User_id, Date_sent, Text_cmt)
		VALUES(p_news_id, p_user_id, p_data_sent, p_text_cmt);
		commit;
END ADD_COMMENT;


CREATE OR REPLACE PROCEDURE ADD_LIKE(
	p_article_id IN NUMBER,
	p_user_id IN NUMBER) AS
BEGIN
	INSERT INTO LIKES(News_id, User_id)
		VALUES(p_article_id, p_user_id);
END ADD_LIKE;