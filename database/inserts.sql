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
/

CREATE OR REPLACE PROCEDURE ADD_NEWS(
	p_data_sent VARCHAR2,
	p_user_id IN NUMBER,
	p_news IN VARCHAR2,
	p_header IN VARCHAR2,
	p_foto IN VARCHAR2,
	p_number_likes IN VARCHAR2,
	p_is_sand IN NUMBER,
  p_category_id IN NUMBER) AS
  v_id NUMBER;
BEGIN
	INSERT INTO NEWS(Date_sent, Is_sand, Text_news, Header, Foto, Number_likes, User_id)
		VALUES(p_data_sent, p_is_sand, p_news, p_header, p_foto, p_number_likes, p_user_id);
  SELECT MAX(News_id) INTO v_id FROM NEWS;
  INSERT INTO NEWS_CATEGORIES (Category_id, News_id) VALUES (p_category_id, v_id);
		commit;
END ADD_NEWS;
/

CREATE OR REPLACE PROCEDURE ADD_COMMENT(
	p_news_id IN NUMBER, 
	p_user_id IN NUMBER, 
	p_data_sent IN VARCHAR2, 
	p_text_cmt IN VARCHAR2) AS
BEGIN
	INSERT INTO COMMENTS(News_id, User_id, Date_sent, Text_cmt)
		VALUES(p_news_id, p_user_id, p_data_sent, p_text_cmt);
		commit;
END ADD_COMMENT;
/

CREATE OR REPLACE PROCEDURE ADD_BOOKMARK(
	p_article_id IN NUMBER,
	p_user_id IN NUMBER) AS
BEGIN
	INSERT INTO LIKES(News_id, User_id)
		VALUES(p_article_id, p_user_id);
		commit;
END ADD_BOOKMARK;
/

CREATE OR REPLACE PROCEDURE SEND_MESSAGE(
	u_from_id IN NUMBER,
	u_to_id IN NUMBER,
	in_text IN VARCHAR) AS
BEGIN
	INSERT INTO PRIVATE_MESSAGES(Sender_id, Receiver_id, Date_sent, Text)
		VALUES(u_from_id, u_to_id, CURRENT_DATE, in_text);
		commit;
END SEND_MESSAGE;

CREATE OR REPLACE PROCEDURE INSERT_APPROVAL(
	p_article_id IN NUMBER,
	p_user_id IN NUMBER,
	p_status IN NUMBER) AS
BEGIN
	INSERT INTO NEWS_APPROVALS (News_id, User_id, Approval_date, Status)
		VALUES (p_article_id, p_user_id, CURRENT_DATE, p_status);
		commit;
END INSERT_APPROVAL;
/
