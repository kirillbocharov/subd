CREATE TABLE Categories
(
        Category_id NUMBER  NOT NULL ,
        Name varchar2(200)  NOT NULL,
        CONSTRAINT XPKCategory PRIMARY KEY (Category_id)
);
/


CREATE TABLE Comments
(
        Comment_id NUMBER  NOT NULL ,
        News_id NUMBER  NOT NULL ,
        User_id NUMBER  NOT NULL ,
        Date_sent VARCHAR2(60) NOT NULL ,
        Text_cmt char(1000)  NOT NULL,
        CONSTRAINT XPKComments PRIMARY KEY (Comment_id)
);
/



CREATE TABLE Roles
(
        Role_id NUMBER  NOT NULL ,
        Name varchar2(100)  NOT NULL,
        CONSTRAINT XPKRoles PRIMARY KEY (Role_id)
);
/


CREATE TABLE Statuses
(
        Status_id NUMBER  NOT NULL ,
        Name varchar2(20)  NOT NULL,
        CONSTRAINT XPKStatuses PRIMARY KEY (Status_id)
);
/


CREATE TABLE Users
(
        User_id NUMBER NOT NULL,
        User_name varchar2(100)  NOT NULL ,
        Password varchar2(500)  NOT NULL ,
        Email varchar2(100)  NOT NULL,
        Age NUMBER  NULL,
        Status_id NUMBER  NOT NULL,
        CONSTRAINT XPKUser PRIMARY KEY (User_id),
        CONSTRAINT  User_has_status FOREIGN KEY (Status_id) REFERENCES Statuses(Status_id)
);
/


CREATE TABLE Users_Roles
(
        User_id NUMBER  NOT NULL ,
        Role_id NUMBER  NOT NULL ,
        CONSTRAINT XPKUsers_Roles PRIMARY KEY (User_id,Role_id),
        CONSTRAINT  Users_Roles FOREIGN KEY (User_id) REFERENCES Users(User_id)
        ON DELETE CASCADE,
        CONSTRAINT  Roles_Users FOREIGN KEY (Role_id) REFERENCES Roles(Role_id)
        ON DELETE CASCADE

);
/

CREATE TABLE News
(
        News_id NUMBER NOT NULL ,
        Text_news varchar2(3000) NOT NULL ,
        Header varchar2(500) NOT NULL,
        Foto varchar2(200) NOT NULL ,
        Date_sent VARCHAR2(60) NOT NULL ,
        Is_sand NUMBER NOT NULL ,
        NUMBER_LIKES number not null,
        Number_likes_journalist NUMBER DEFAULT(0) NOT NULL,
        User_id NUMBER NOT NULL,
        CONSTRAINT XPKNews PRIMARY KEY (News_id),
        CONSTRAINT User_write_news FOREIGN KEY (User_id) REFERENCES Users(User_id)
        ON DELETE CASCADE
);
/

CREATE TABLE News_Categories
(
        Category_id NUMBER  NOT NULL ,
        News_id NUMBER  NOT NULL,
        CONSTRAINT XPKNews_Categories PRIMARY KEY (Category_id,News_id),
        CONSTRAINT  Categories_News FOREIGN KEY (Category_id) REFERENCES Categories(Category_id)
        ON DELETE CASCADE,
        CONSTRAINT  News_Categories FOREIGN KEY (News_id) REFERENCES News(News_id)
        ON DELETE CASCADE
);
/


CREATE TABLE News_Comments
(
        News_id NUMBER  NOT NULL ,
        Comment_id NUMBER  NOT NULL,
        CONSTRAINT XPKNews_Comments PRIMARY KEY (News_id,Comment_id),
        CONSTRAINT  News_Comments FOREIGN KEY (News_id) REFERENCES News(News_id)
        ON DELETE CASCADE,
        CONSTRAINT  Comments_News FOREIGN KEY (Comment_id) REFERENCES Comments(Comment_id)
        ON DELETE CASCADE
);
/


CREATE TABLE Likes
(
        Like_id NUMBER  NOT NULL ,
        News_id NUMBER  NOT NULL ,
        User_id NUMBER  NOT NULL,
        CONSTRAINT XPKLike PRIMARY KEY (Like_id),
        CONSTRAINT  News_has_like FOREIGN KEY (News_id) REFERENCES News(News_id)
        ON DELETE CASCADE,
        CONSTRAINT  User_put_like FOREIGN KEY (User_id) REFERENCES Users(User_id)
        ON DELETE CASCADE

);
/


CREATE TABLE Logs
(
        Log_id NUMBER  NOT NULL ,
        Before varchar2(20)  NOT NULL ,
        After varchar2(20)  NOT NULL ,
        User_id NUMBER  NOT NULL,
        CONSTRAINT XPKLogs PRIMARY KEY (Log_id),
        CONSTRAINT  User_put_log FOREIGN KEY (User_id) REFERENCES Users(User_id)
        ON DELETE CASCADE
);
/


CREATE TABLE Private_messages
(
        MESSAGE_ID NUMBER NOT NULL,
        SENDER_ID NUMBER NOT NULL,
        RECEIVER_ID NUMBER NOT NULL,
        DATE_SENT DATE,
        TEXT VARCHAR2(4000),
        CONSTRAINT PRIVATE_MESSAGES_PK PRIMARY KEY (MESSAGE_ID)
        ENABLE
);
/


CREATE TABLE News_approvals
(
        APPROVAL_ID NUMBER NOT NULL,
        NEWS_ID NUMBER NOT NULL,
        USER_ID NUMBER NOT NULL,
        APPROVAL_DATE DATE,
        STATUS NUMBER NOT NULL,
        CONSTRAINT NEWS_APPROVALS_PK PRIMARY KEY (APPROVAL_ID)
        ENABLE
);
/
