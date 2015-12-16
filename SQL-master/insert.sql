INSERT INTO Categories(Name) VALUES("Auto");
INSERT INTO Categories(Name) VALUES("Nature");
INSERT INTO Categories(Name) VALUES("Country");


INSERT INTO Roles(Name) VALUES("Admin");
INSERT INTO Roles(Name) VALUES("User");


INSERT INTO Statuses(Name) VALUES("Child");
INSERT INTO Statuses(Name) VALUES("Journalist");


INSERT INTO Users(User_name, Password, Age, Status_id, Email) VALUES("Vadik", "abff60a7ffeadeb1a3da290147ee1fa7", 19, 2, "Vadik@email.com");
INSERT INTO Users(User_name, Password, Age, Status_id, Email) VALUES("Dimas", "8555f45b58e4806a1f68627339644129", 14, 2, "Dimas@email.com");
INSERT INTO Users(User_name, Password, Age, Status_id, Email) VALUES("Nikita", "189b518163ca2b8693e8dd77aa25126e", 20, 1, "Nikita@email.com");
INSERT INTO Users(User_name, Password, Age, Status_id, Email) VALUES("Petya", "189b518163ca2b8693e8dd77aa25126e", 22, 1, "Petya@email.com");
INSERT INTO Users(User_name, Password, Age, Status_id, Email) VALUES("Valera", "189b518163ca2b8693e8dd77aa25126e", 17, 2, "Valera@email.com");
INSERT INTO Users(User_name, Password, Age, Status_id, Email) VALUES("Boss", "189b518163ca2b8693e8dd77aa25126e", 187, 1, "Boss@email.com");


INSERT INTO Users_Roles(User_id, Role_id) VALUES(1, 1);
INSERT INTO Users_Roles(User_id, Role_id) VALUES(2, 1);
INSERT INTO Users_Roles(User_id, Role_id) VALUES(3, 2);
INSERT INTO Users_Roles(User_id, Role_id) VALUES(4, 2);
INSERT INTO Users_Roles(User_id, Role_id) VALUES(5, 2);


INSERT INTO News(Text_news, Header, Foto, Number_likes, User_id) VALUES("With David Cameron attending a crucial summit in Brussels this week, a poll finds the British public is now evenly split over the prospect of a British exit from the EU. British voters appetite for leaving the European Union is gathering momentum, putting the prospect of Brexit on a knife edge, a new poll has found. As David Cameron prepares to travel to Brussels for a crucial European summit to discuss his renegotiation plans, a poll has found that the British public is now evenly split about the prospect of a British exit from the EU. It came as the EU referendum bill last night passed through the House of Lords, meaning that Mr Cameron could potentially hold his vote in June next year. According to the ICM poll for the Vote Leave campaign, when undecided voters are excluded, 50 per cent of voters would choose Brexit. It is the first time since 2013 that ICM has found that voters are evenly split. The independent polling company has in recent weeks found that the gap between the Leave and Remain campaigns is narrowing significantly. The poll will come as a significant blow to the Prime Minister, who will on Thursday face opposition from European leaders over his plans to restrict EU migrants access to benefits in the UK for four years. Mr Cameron is understood to be preparing to offer concessions over the reforms in a bid to ensure a final deal can be done by February.", "UK exit from European Union on a knife edge, as poll shows British public are now 50/50 over leaving", "Url Article1", 1, 1);
INSERT INTO News(Text_news, Header, Foto, Number_likes, User_id) VALUES("Inverness hospital worker Rachel Lynn lets go of four month-old boy while holding him by the ankles over her shoulder. A nurse has been struck off after she dropped a baby headfirst on the ground while going to buy a bottle of vodka. Rachel Lynn, 38, appeared to be drunk as she pushed a pram to a shop while holding the distressed four month-old boy by the ankles over her shoulder. A shocked couple spotted the theatre nurse - who was not at work at the time - let go of the child who fell head first to the ground and suffered an 11cm fracture in his skull. Lynn pleaded guilty to a charge of willfully ill-treating a young boy in January and was then investigated by the Nursing and Midwifery Council. They concluded her fitness to practise was currently impaired and she was struck off in the public interest. The panel said she was a harm to self and others when under the influence of alcohol. Panel chairman Tim Mann said: The behaviour that led to these convictions has not been curtailed and it considered that there was a pattern of behaviour which increased the risk of repetition. Due to the seriousness of the convictions in this case and the lack of appropriate insight, the only appropriate and proportionate sanction to impose would be a striking-off order. Lynn, from Balloch, Highlands, was seen dropping the baby in June last year.  A court heard the shocking incident happened whilst she was employed by Raigmore Hospital, Inverness as a theatre nurse. Witnesses claimed she had been drunk at the time of the incident.", "Drunk nurse struck off after dropping baby on head", "Url Article2", 1, 3);
INSERT INTO News(Text_news, Header, Foto, Number_likes, User_id) VALUES("British astronaut arrives at ISS in Russian Soyuz rocket after Commander Yuri Malenchenko was forced to take control manually - follow the latest updates here. After an eight hour journey which involved a tense docking, Major Tim Peake finally unlocked the hatch and entered the International Space Station this evening. Nasas Scott Kelly and Russian astronauts Sergey Volkov and Mikhail Kornienko hugged Britains first astronaut warmly as he emerged through the hatch at around 8pm. It begins a six month mission which will see him undertaking 23 physical experiments. Speaking for the first time via videolink Major Peake spoke to his mum who asked him if he had a spectacular day in the office. He replied: We had a great time in the office, thats for sure. I hope you enjoyed the show. Major Tim Peake was this afternoon preparing to become the first Briton to set foot in the International Space Station, following a six hour flight from Earth which ended in a tense docking. The crew were making final checks and will soon be opening the hatch, where they will be welcomed be current station astronauts. The Telegraphs Roland Oliphant was in Baikonur for the tense docking in which Commander Yuri Malenchenko was forced to take manual control. Here is his dispatch from the scence: They say nothing in space flight is routine, and the plan on this mission has changed already. Apparently unhappy with the approach to the ISS plotted by the automated docking system, Commander Yuri Malenchenko took manual control of the Soyuz and backed the craft back from the station, opting to pilot the ship in himself. Colonel Malenchenko has about 10,000 hours on a simulator and has done some piloting on previous missions. He is also, of course, an experienced fighter pilot in the Russian airforce - hes used to tricky manoeuvres. Chatting through the manoeuvre with ground controllers at Roscosmos mission control centre in Korolyov, the headquarters of the Russian space program outside Moscow, Col Malenchenko brought the Soyuz craft back to a position about 100 metres from the station until he could line up with the docking port.", "Tim Peake launch: Britains first official astronaut enters International Space Station - live", "Url Article3", 1, 4);
INSERT INTO News(Text_news, Header, Foto, Number_likes, User_id) VALUES("Republican presidential hopefuls sparred over how to stop the so-called Islamic State (IS), in the first debate since attacks in California and Paris. The national security focus yielded heated exchanges between Senators Ted Cruz and Marco Rubio who clashed on surveillance and immigration policy. Jeb Bush also sought to revive his struggling campaign by forcefully attacking front-runner Donald Trump. You are not going to be able to insult your way to the presidency, he said. Mr Trump was on the defensive early in the debate for his proposed ban on Muslims entering the US, saying, We are not talking about religion, we are talking about security. However the debate quickly expanded to broader issues of foreign policy and national security. The candidates repeatedly addressed heightened fears of terrorism in the US on the same day an emailed threat shut down Los Angeles school system. The big question going into this last Republican debate of 2015 was how Donald Trumps competitors would try to take the front-runner down. It seems, however, that only Jeb Bush got that memo. He alone among the candidates engaged the New Yorker directly, and if he had been as forceful several months ago as he was on Tuesday night, his campaign might be in much better shape. Instead, most of the fireworks during the Las Vegas event occurred between the trio of first-term senators - Marco Rubio, Rand Paul and Ted Cruz. On the issues of national security and immigration, Mr Rubio faced off against his two congressional colleagues in often acrimonious exchanges. Barely mentioned over the course of an evening that focused on foreign policy was Mr Trump's call to close the US border to all Muslims. Given how all the candidates assiduously avoided the subject, one would never have guessed that it was a story that merited global headlines and ignited a firestorm of controversy.", "Republican candidates clash over how to counter IS", "Url Article4", 1, 1);
INSERT INTO News(Text_news, Header, Foto, Number_likes, User_id) VALUES("The first full reviews for the new Star Wars film The Force Awakens have hailed it as a triumph and a classic. UK newspapers were the first to publish reviews, with The Daily Telegraph and The Times each awarding it five stars. The Times critic Kate Muir wrote: Adults will be floored by tearful nostalgia because this is a classic. The Daily Mail's Brian Viner described The Force Awakens as a triumph of escapism and the most exhilarating film yet in this mighty franchise. Viner began his four-star review with the words: Boy, has the force awoken, and raved about its almost balletic airborne battle scenes, evocative of all the best Second World War films. Viner began his four-star review with the words: Boy, has the force awoken, and raved about its almost balletic airborne battle scenes, evocative of all the best Second World War films. The Telegraphs Robbie Collin, who admitted to crying three times, said director JJ Abrams and his team had taken a slightly tattered franchise and restored its sense of magic and myth. Harrison Ford is terrific, he says, giving pilot Han Solo a sardonic, rough-chinned world-weariness thats perhaps not entirely acting. The sequel - the seventh movie in the Star Wars franchise - is a humongous piece of cinema, according to Kate Muir in The Times. She went on to describe Abrams as a better action director than Star Wars creator George Lucas, concluding that the film was exactly what we were hoping for. The Daily Mirror, John Hiscock wrote: All I can say is The Force Awakens evokes magical memories of 1977s Star Wars Episode IV: A New Hope, with plenty of humour, action, drama and heart. Christopher Wooton in the Independent gave the film four stars and said: Star Wars: The Force Awakens is actually probably objectively the best Star Wars yet, and would be held up as untouchable had it come first. The Guardian also gave the film five stars, with Peter Bradshaw pointing out: The Force Awakens is ridiculous and melodramatic and sentimental of course, but exciting and brimming with energy and its own kind of generosity.", "Star Wars: The Force Awakens gets rave reviews", "Url Article5", 5, 2);


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


