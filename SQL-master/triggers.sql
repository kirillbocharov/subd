CREATE OR REPLACE TRIGGER AUTO_INC_CATEGORIES
                BEFORE INSERT ON CATEGORIES
                FOR EACH ROW
              DECLARE
              v_id NUMBER;
              BEGIN
                SELECT MAX(Category_id) + 1 INTO v_id FROM CATEGORIES;  
                IF v_id IS NULL THEN
                  v_id := 1;
                END IF;
                :new.Category_id := v_id;
END AUTO_INC_CATEGORIES;
/

CREATE OR REPLACE TRIGGER AUTO_INC_COMMENTS
                BEFORE INSERT ON COMMENTS
                FOR EACH ROW
              DECLARE
              v_id NUMBER;
              BEGIN
                SELECT MAX(Comment_id) + 1 INTO v_id FROM COMMENTS;  
                IF v_id IS NULL THEN
                  v_id := 1;
                END IF;
                :new.Comment_id := v_id;
END AUTO_INC_COMMENTS;
/

CREATE OR REPLACE TRIGGER AUTO_INC_LIKES
                BEFORE INSERT ON LIKES
                FOR EACH ROW
              DECLARE
              v_id NUMBER;
              BEGIN
                SELECT MAX(Like_id) + 1 INTO v_id FROM LIKES;  
                IF v_id IS NULL THEN
                  v_id := 1;
                END IF;
                :new.Like_id := v_id;
END AUTO_INC_LIKES;
/

CREATE OR REPLACE TRIGGER AUTO_INC_LOGS
                BEFORE INSERT ON LOGS
                FOR EACH ROW
              DECLARE
              v_id NUMBER;
              BEGIN
                SELECT MAX(Log_id) + 1 INTO v_id FROM LOGS;  
                IF v_id IS NULL THEN
                  v_id := 1;
                END IF;
                :new.Log_id := v_id;
END AUTO_INC_LOGS;
/

CREATE OR REPLACE TRIGGER AUTO_INC_NEWS
                BEFORE INSERT ON NEWS
                FOR EACH ROW
              DECLARE
              v_id NUMBER;
              BEGIN
                SELECT MAX(News_id) + 1 INTO v_id FROM NEWS;  
                IF v_id IS NULL THEN
                  v_id := 1;
                END IF;
                :new.News_id := v_id;
END AUTO_INC_NEWS;
/

CREATE OR REPLACE TRIGGER AUTO_INC_ROLES
                BEFORE INSERT ON ROLES
                FOR EACH ROW
              DECLARE
              v_id NUMBER;
              BEGIN
                SELECT MAX(Role_id) + 1 INTO v_id FROM ROLES;  
                IF v_id IS NULL THEN
                  v_id := 1;
                END IF;
                :new.Role_id := v_id;
END AUTO_INC_ROLES;
/

CREATE OR REPLACE TRIGGER AUTO_INC_USERS
                BEFORE INSERT ON USERS
                FOR EACH ROW
              DECLARE
              v_id NUMBER;
              BEGIN
                SELECT MAX(User_id) + 1 INTO v_id FROM USERS;  
                IF v_id IS NULL THEN
                  v_id := 1;
                END IF;
                :new.User_id := v_id;
END AUTO_INC_USERS;
/

CREATE OR REPLACE TRIGGER AUTO_INC_STATUSES
                BEFORE INSERT ON STATUSES
                FOR EACH ROW
              DECLARE
              v_id NUMBER;
              BEGIN
                SELECT MAX(Status_id) + 1 INTO v_id FROM STATUSES;  
                IF v_id IS NULL THEN
                  v_id := 1;
                END IF;
                :new.Status_id := v_id;
END AUTO_INC_STATUSES;
