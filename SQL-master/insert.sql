INSERT INTO Categories(Name) VALUES("Auto");
INSERT INTO Categories(Name) VALUES("Nature");
INSERT INTO Categories(Name) VALUES("Country");


INSERT INTO Roles(Name) VALUES("Admin");
INSERT INTO Roles(Name) VALUES("User");


INSERT INTO Statuses(Name) VALUES("Child");
INSERT INTO Statuses(Name) VALUES("Journalist");


INSERT INTO Users(User_name, Password, Age, Status_id) VALUES("Vadik", "pass", 19, 1);
INSERT INTO Users(User_name, Password, Age, Status_id) VALUES("Nikita", "pass", 20, 1);
INSERT INTO Users(User_name, Password, Age, Status_id) VALUES("Petya", "pass", 22, 1);
INSERT INTO Users(User_name, Password, Age, Status_id) VALUES("Dimas", "pass", 21, 2);
INSERT INTO Users(User_name, Password, Age, Status_id) VALUES("Valera", "pass", 17, 2);
INSERT INTO Users(User_name, Password, Age, Status_id) VALUES("Boss", "pass", 187, 1);


INSERT INTO Users_Roles(User_id, Role_id) VALUES(1, 1);
INSERT INTO Users_Roles(User_id, Role_id) VALUES(2, 1);
INSERT INTO Users_Roles(User_id, Role_id) VALUES(3, 2);
INSERT INTO Users_Roles(User_id, Role_id) VALUES(4, 2);
INSERT INTO Users_Roles(User_id, Role_id) VALUES(5, 2);


INSERT INTO News(Text_news, Header, Foto, Number_likes, User_id) VALUES("Text article1", "Article1", "Url Article1", 1, 1);
INSERT INTO News(Text_news, Header, Foto, Number_likes, User_id) VALUES("Text article2", "Article2", "Url Article2", 1, 3);
INSERT INTO News(Text_news, Header, Foto, Number_likes, User_id) VALUES("Text article3", "Article3", "Url Article3", 1, 4);
INSERT INTO News(Text_news, Header, Foto, Number_likes, User_id) VALUES("Text article4", "Article4", "Url Article4", 1, 1);
INSERT INTO News(Text_news, Header, Foto, Number_likes, User_id) VALUES("Text article5", "Article5", "Url Article5", 5, 2);


INSERT INTO Comments(News_id, User_id, Date_sent, Text_cmt) VALUES(1, 1, "12.02.2015", "Comment_vadik1");
INSERT INTO Comments(News_id, User_id, Date_sent, Text_cmt) VALUES(2, 3, "10.02.2015", "Comment_nikita1");
INSERT INTO Comments(News_id, User_id, Date_sent, Text_cmt) VALUES(2, 1, "19.02.2015", "Comment_vadik2");
INSERT INTO Comments(News_id, User_id, Date_sent, Text_cmt) VALUES(3, 4, "12.11.2015", "Comment_petya1");
INSERT INTO Comments(News_id, User_id, Date_sent, Text_cmt) VALUES(4, 4, "17.11.2015", "Comment_petya2");
INSERT INTO Comments(News_id, User_id, Date_sent, Text_cmt) VALUES(5, 2, "12.04.2015", "Comment_dimas1");


INSERT INTO Likes(News_id, User_id) VALUES(1, 1);
INSERT INTO Likes(News_id, User_id) VALUES(2, 1);
INSERT INTO Likes(News_id, User_id) VALUES(3, 1);
INSERT INTO Likes(News_id, User_id) VALUES(1, 3);
INSERT INTO Likes(News_id, User_id) VALUES(2, 3);
INSERT INTO Likes(News_id, User_id) VALUES(1, 4);
INSERT INTO Likes(News_id, User_id) VALUES(1, 2);


INSERT INTO News_Comments(News_id, Comment_id) VALUES(1,1);
INSERT INTO News_Comments(News_id, Comment_id) VALUES(1,2);
INSERT INTO News_Comments(News_id, Comment_id) VALUES(1,3);
INSERT INTO News_Comments(News_id, Comment_id) VALUES(2,4);
INSERT INTO News_Comments(News_id, Comment_id) VALUES(3,5);
INSERT INTO News_Comments(News_id, Comment_id) VALUES(4,6);


INSERT INTO News_Categories(News_id, Category_id) VALUES(1,1);
INSERT INTO News_Categories(News_id, Category_id) VALUES(2,1);
INSERT INTO News_Categories(News_id, Category_id) VALUES(3,2);
INSERT INTO News_Categories(News_id, Category_id) VALUES(4,3);


