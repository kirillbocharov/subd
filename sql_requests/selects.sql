CREATE OR REPLACE PROCEDURE HAS_LOGIN(p_user_name IN VARCHAR2, p_is_exists OUT NUMBER)
AS
	v_count NUMBER;
BEGIN
	SELECT COUNT(*) INTO v_count FROM USERS WHERE User_name = p_user_name;
	IF v_count != 0 THEN
		p_is_exists := 1;
	ELSE
		p_is_exists := 0;
	END IF;
END HAS_LOGIN;
/

CREATE OR REPLACE PROCEDURE HAS_EMAIL(p_email IN VARCHAR2, p_out_is_exists OUT NUMBER)
AS
	v_count NUMBER;
BEGIN
	SELECT COUNT(*) INTO v_count FROM USERS WHERE Email = p_email;
	IF v_count != 0 THEN
		p_out_is_exists := 1;
	ELSE
		p_out_is_exists := 0;
	END IF;
END HAS_EMAIL;
/

CREATE OR REPLACE PROCEDURE VERIFY_USER(p_email IN VARCHAR2, p_password IN VARCHAR2, p_out_user_id OUT NUMBER)
AS
	v_is_email_exists NUMBER;
	v_pass VARCHAR2(500);
BEGIN
	HAS_EMAIL(p_email, v_is_email_exists);
		IF v_is_email_exists = 1 THEN
			
			SELECT USERS.Password, User_id INTO v_pass, p_out_user_id 
				FROM USERS WHERE Email=p_email;
			
			IF v_pass != p_password THEN
				p_out_user_id := 0;
			END IF;
		ELSE
		 	p_out_user_id := 0;
		END IF;
END VERIFY_USER;
/

CREATE OR REPLACE PROCEDURE GET_NEWS(p_out_cursor OUT sys_refcursor)
AS
BEGIN
	OPEN p_out_cursor FOR SELECT * FROM NEWS WHERE Is_sand=0;
END GET_NEWS;
/

CREATE OR REPLACE PROCEDURE GET_NEWS_BY_NAME(p_user_name IN VARCHAR2, p_out_cursor OUT sys_refcursor)
AS
BEGIN
	OPEN p_out_cursor FOR SELECT * FROM NEWS N, USERS U 
		WHERE N.User_id = U.User_id AND U.User_name = p_user_name;
END GET_NEWS_BY_NAME;
/

CREATE OR REPLACE PROCEDURE GET_NAME_USER(p_user_id IN NUMBER, p_out_cursor OUT sys_refcursor)
AS
BEGIN
	OPEN p_out_cursor FOR SELECT * FROM USERS WHERE User_id = p_user_id;
END GET_NAME_USER;
/

CREATE OR REPLACE PROCEDURE GET_COMMENTS(p_article_id IN NUMBER, p_out_cursor OUT sys_refcursor)
AS
BEGIN
	OPEN p_out_cursor FOR SELECT COMMENTS.*, USERS.User_name FROM
		COMMENTS INNER JOIN USERS ON News_id = p_article_id 
		AND USERS.User_id = COMMENTS.User_id;
END GET_COMMENTS;
/

CREATE OR REPLACE PROCEDURE IS_JOURNALIST(p_user_id IN NUMBER, p_out_is_journ OUT NUMBER)
AS
	v_status_id NUMBER;
BEGIN
	SELECT Status_id INTO v_status_id FROM USERS WHERE User_id = p_user_id;
	IF v_status_id = 2 THEN
		p_out_is_journ := 1;
	ELSE
		p_out_is_journ := 0;
	END IF;
END IS_JOURNALIST;
/

CREATE OR REPLACE PROCEDURE IS_LEFT_LIKE(
	p_article_id IN NUMBER,
	p_user_id IN NUMBER,
	p_out_is_left OUT NUMBER)
AS
	v_count NUMBER;
BEGIN
	SELECT COUNT(*) INTO v_count FROM LIKES 
		WHERE User_id = p_user_id AND News_id = p_article_id;
		IF v_count = 0 THEN
			p_out_is_left := 0;
		ELSE
			p_out_is_left := 1;
		END IF;
END IS_LEFT_LIKE;
/

CREATE OR REPLACE PROCEDURE GET_CHILDS_ARTICLES(p_out_cursor OUT sys_refcursor)
AS
BEGIN
	OPEN p_out_cursor FOR SELECT * FROM NEWS WHERE Is_sand = 1;
END GET_CHILDS_ARTICLES;
/

CREATE OR REPLACE PROCEDURE GET_NUMLIKES_JOURN(p_user_id IN NUMBER, p_out_value OUT NUMBER)
AS
BEGIN
	SELECT SUM(N.Number_likes_journalist) INTO p_out_value FROM USERS U INNER JOIN NEWS N 
		ON U.User_id = N.User_id AND U.User_id = p_user_id; 
END GET_NUMLIKES_JOURN;
/

CREATE OR REPLACE PROCEDURE GET_OWNER_ARTICLE(
	p_article_id IN NUMBER, 
	p_out_user_id OUT NUMBER)
AS
BEGIN
	SELECT User_id INTO p_out_user_id FROM NEWS WHERE News_id = p_article_id;
END GET_OWNER_ARTICLE;
/

CREATE OR REPLACE PROCEDURE GET_ARTICLE(
	p_article_id IN NUMBER,
	p_out_cursor OUT sys_refcursor)
AS
BEGIN
	OPEN p_out_cursor FOR SELECT * FROM NEWS WHERE News_id = p_article_id;
END GET_ARTICLE;
/

CREATE OR REPLACE PROCEDURE GET_MAX_ID_USER(p_out_id OUT NUMBER)
AS
BEGIN
  SELECT MAX(User_Id) INTO p_out_id FROM Users;
END GET_MAX_ID_USER;
