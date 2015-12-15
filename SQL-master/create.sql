CREATE TABLE Categories
(
        Category_id integer  NOT NULL ,
        Name varchar(20)  NOT NULL,
        CONSTRAINT XPKCategory PRIMARY KEY (Category_id ASC)
);
 

CREATE TABLE Comments
(
        Comment_id integer  NOT NULL ,
        News_id integer  NOT NULL ,
        User_id integer  NOT NULL ,
        Date_sent VARCHAR(20) NOT NULL ,
        Text_cmt char(18)  NOT NULL,
        CONSTRAINT XPKComments PRIMARY KEY (Comment_id ASC)
);

 
CREATE TABLE Likes
(
        Like_id integer  NOT NULL ,
        News_id integer  NOT NULL ,
        User_id varchar(20)  NOT NULL,
        CONSTRAINT XPKLike PRIMARY KEY (Like_id ASC)
        CONSTRAINT  News_has_like FOREIGN KEY (News_id) REFERENCES News(News_id)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION
        CONSTRAINT  User_put_like FOREIGN KEY (User_id) REFERENCES Users(User_id)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION

);
 

CREATE TABLE Logs
(
        Log_id integer  NOT NULL ,
        Before varchar(20)  NOT NULL ,
        After varchar(20)  NOT NULL ,
        User_id varchar(20)  NOT NULL,
        CONSTRAINT XPKLogs PRIMARY KEY (Log_id ASC)
        CONSTRAINT  User_put_log FOREIGN KEY (User_id) REFERENCES Users(User_id)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION
);

 
CREATE TABLE News
(
        News_id integer  NOT NULL ,
        Text_news varchar(20)  NOT NULL ,
        Header varchar(20) NOT NULL,
        Foto varchar(20)  NOT NULL ,
        Number_likes integer  NOT NULL DEFAULT(0),
        Number_likes_journalist integer  NOT NULL DEFAULT(0),
        User_id char(18)  NOT NULL,
        CONSTRAINT XPKNews PRIMARY KEY (News_id ASC)
        CONSTRAINT  User_write_news FOREIGN KEY (User_id) REFERENCES Users(User_id)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION
);

 
CREATE TABLE News_Categories
(
        Category_id integer  NOT NULL ,
        News_id integer  NOT NULL,
        CONSTRAINT XPKNews_Categories PRIMARY KEY (Category_id ASC,News_id ASC)
        CONSTRAINT  Categories_News FOREIGN KEY (Category_id) REFERENCES Categories(Category_id)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION
        CONSTRAINT  News_Categories FOREIGN KEY (News_id) REFERENCES News(News_id)
                ON DELETE NO ACTION
                ON UPDATE CASCADE
);

 
CREATE TABLE News_Comments
(
        News_id integer  NOT NULL ,
        Comment_id integer  NOT NULL,
        CONSTRAINT XPKNews_Comments PRIMARY KEY (News_id ASC,Comment_id ASC)
        CONSTRAINT  News_Comments FOREIGN KEY (News_id) REFERENCES News(News_id)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION
        CONSTRAINT  Comments_News FOREIGN KEY (Comment_id) REFERENCES Comments(Comment_id)
                ON DELETE NO ACTION
                ON UPDATE CASCADE
);

 
CREATE TABLE Roles
(
        Role_id integer  NOT NULL ,
        Name varchar(20)  NOT NULL,
        CONSTRAINT XPKRoles PRIMARY KEY (Role_id ASC)
);

 
CREATE TABLE Statuses
(
        Status_id integer  NOT NULL ,
        Name varchar(20)  NOT NULL,
        CONSTRAINT XPKStatuses PRIMARY KEY (Status_id ASC)
);

 
CREATE TABLE Users
(
        User_id integer NOT NULL,
        User_name varchar(20)  NOT NULL ,
        Password varchar(20)  NOT NULL ,
        Email varchar(20)  NOT NULL,
        Age integer  NULL,
        Status_id integer  NOT NULL,
        CONSTRAINT XPKUser PRIMARY KEY (User_id ASC)
        CONSTRAINT  User_has_status FOREIGN KEY (Status_id) REFERENCES Statuses(Status_id)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION
);

 
CREATE TABLE Users_Roles
(
        User_id varchar(20)  NOT NULL ,
        Role_id integer  NOT NULL ,
        CONSTRAINT XPKUsers_Roles PRIMARY KEY (User_id ASC,Role_id ASC)
        CONSTRAINT  Users_Roles FOREIGN KEY (User_id) REFERENCES Users(User_id)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION
        CONSTRAINT  Roles_Users FOREIGN KEY (Role_id) REFERENCES Roles(Pole_id)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION
);
 
