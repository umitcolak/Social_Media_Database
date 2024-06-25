CREATE DATABASE IF NOT EXISTS social_network_db;
use social_network_db;
												/* Deleting All Tables  */
DROP TABLE IF EXISTS workExperience;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS commentOnPost;
DROP TABLE IF EXISTS postOnProfile;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS follow;

DROP TABLE IF EXISTS profile;
DROP TABLE IF EXISTS plainText;
DROP TABLE IF EXISTS picture;
DROP TABLE IF EXISTS video;

DROP TABLE IF EXISTS userHasGroup;
DROP TABLE IF EXISTS friendship;
DROP TABLE IF EXISTS hobby;


DROP TABLE IF EXISTS userr;
DROP TABLE IF EXISTS groupp;

DROP TABLE IF EXISTS workingHours;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS website;
DROP TABLE IF EXISTS company;

												/* Creating Tables */

create table groupp (
	idgroupp int primary key auto_increment,
    name varchar(50) not null
);


create table userr (
	iduserr int primary key auto_increment,
    username varchar(45) not null,
    firstName varchar(45) not null,
	lastName varchar(45) not null,
	gender varchar(10) not null,
	birthday DATE not null,
    maritalStatus TINYINT,
    
    group_idgroupp int,
    foreign key(group_idgroupp) references groupp(idgroupp)
);

create table hobby (
	idhobby int primary key auto_increment,
    name varchar(50) not null,
    user_iduserr int not null,
    
    foreign key(user_iduserr) references userr(iduserr)
);



create table userHasGroup (
	iduserHasGroup int primary key auto_increment,
    user_iduserr int,
    group_idgroupp int not null,
    
    foreign key(user_iduserr) references userr(iduserr),
    foreign key(group_idgroupp) references groupp(idgroupp)
);


create table friendship(
	idfriendship int primary key auto_increment,
    user1_iduserr int not null,
    user2_iduserr int not null,
    
    foreign key(user1_iduserr) references userr(iduserr),
    foreign key(user2_iduserr) references userr(iduserr)
);

create table company(
	idcompany int primary key auto_increment,
    name varchar(50) not null
);

create table website(
	idwebsite int primary key auto_increment,
    link varchar(100) not null,
    company_idcompany int not null,
    
    foreign key(company_idcompany) references company(idcompany)
);

create table location(
	idlocation int primary key auto_increment,
    street varchar(70) not null,
    district varchar(70) not null,
    city varchar(70) not null,
    country varchar(70) not null,
	company_idcompany int not null,
    
    foreign key(company_idcompany) references company(idcompany)
);

create table workingHours(
	idworkingHours int primary key auto_increment,
    starttime TIME not null,
    endtime TIME not null,
    company_idcompany int not null,
	
    foreign key(company_idcompany) references company(idcompany)
);



create table profile(
	idprofile int primary key auto_increment,
    user_iduserr int,
    company_idcompany int,
    
    foreign key(user_iduserr) references userr(iduserr),
    foreign key(company_idcompany) references company(idcompany),
    CHECK (
        (user_iduserr IS NOT NULL AND company_idcompany IS NULL) OR 
        (user_iduserr IS NULL AND company_idcompany IS NOT NULL)
    )
);

create table workExperience (
	idworkExperience int primary key auto_increment,
    position varchar(100) not null,
    companyName varchar(120) not null,
    startDate DATE not null,
    endDate DATE not null,
    
    profile_idprofile int not null
);

create table follow (
	idfollow int primary key auto_increment,
	profile_idprofile int not null,
    company_idcompany int not null,
    
    foreign key(company_idcompany) references company(idcompany)
);

create table message (
	idmessage int primary key auto_increment,
    content TEXT not null,
    readStatus TINYINT not null,
    sentStatus TINYINT not null,
    readTime TIMESTAMP not null,
    sentTime TIMESTAMP not null,
    profile1_idprofile int not null,
    profile2_idprofile int not null
    
);

create table video (
	idvideo int primary key auto_increment,
    duration varchar(50) not null,
    videoResolution varchar(50) not null
);

create table picture (
	idpicture int primary key auto_increment,
    pictureResolution varchar(50) not null
);

create table plainText (
	idplainText int primary key auto_increment,
    description TEXT
);


create table postOnProfile (
	idpostOnProfile int primary key auto_increment,
    profile_idprofile int not null,
    video_idvideo int,
    picture_idpicture int,
    plainText_idplainText int,
    time DATETIME not null,
    
    foreign key(picture_idpicture) references picture(idpicture),
    foreign key(plainText_idplainText) references plainText(idplainText),
    foreign key(video_idvideo) references video(idvideo)
);

create table commentOnPost (
	idCommentOnPost int primary key auto_increment,
    content TEXT not null,
    date DATETIME not null,
    post_idpostOnProfile int not null,
    profile_idprofile int not null,
    
    foreign key(post_idpostOnProfile) references postOnProfile(idpostOnProfile)
);

create table likes (
	idlike int primary key auto_increment,
    time DATE not null,
    
    post_idpostOnProfile int not null,
    profile_idprofile int not null,
    
    foreign key(post_idpostOnProfile) references postOnProfile(idpostOnProfile),
    foreign key(profile_idprofile) references profile(idprofile)
);


									/* Adding Foreign Key Constrains with Alter Table Statements */

alter table workExperience add constraint fk_workExperience_profile_idprofile foreign key(profile_idprofile) references profile(idprofile);
alter table follow add constraint  fk_follow_profile_idprofile foreign key(profile_idprofile) references profile(idprofile);
alter table message add constraint fk_message_profile1_idprofile foreign key(profile1_idprofile) references profile(idprofile);
alter table message add constraint fk_message_profile2_idprofile foreign key(profile2_idprofile) references profile(idprofile);
alter table postOnProfile add constraint fk_postOnProfile_profile_idprofile foreign key(profile_idprofile) references profile(idprofile);
alter table commentOnPost add constraint fk_commentOnPost_post_idpostOnProfile  foreign key(post_idpostOnProfile) references postOnProfile(idpostOnProfile);

/* Inserting data into groups */
INSERT INTO groupp (name) VALUES 
('Tech Enthusiasts'),
('Book Club'),
('Fitness Fans'),
('FERI group'),
('Travel Community');

/* Inserting data into users */
INSERT INTO userr (username, firstName, lastName, gender, birthday, maritalStatus, group_idgroupp) VALUES 
('john_doe', 'John', 'Doe', 'male', '1990-01-01', 1, 1),
('jane_smith', 'Jane', 'Smith', 'female', '1985-05-15', 0, 2),
('alice_jones', 'Alice', 'Jones', 'female', '1993-07-24', 0, 3),
('mike_brown', 'Mike', 'Brown', 'male', '1988-09-19', 1, 4),
('lisa_white', 'Lisa', 'White', 'female', '1992-11-30', 1, 5),
('john_jackson', 'John', 'Jackson', 'male', '2002-06-14', 0, 3),
('carol_jacobson', 'Carol', 'Jacobson', 'female', '2000-02-13', 1, 2);

/* Inserting data into companies */
INSERT INTO company (name) VALUES 
('Tech Giants'),
('Readers Inc.'),
('Fit Well'),
('Gourmet Foods'),
('World Tours');

/* Inserting data into profiles for both users and companies */
INSERT INTO profile (user_iduserr, company_idcompany) VALUES 
(1, NULL),
(2, NULL),
(3, NULL),
(4, NULL),
(5, NULL),
(NULL, 1),
(NULL, 2),
(NULL, 3),
(NULL, 4),
(NULL, 5);

/* Inserting data into hobbies */
INSERT INTO hobby (name, user_iduserr) VALUES 
('Programming', 1),
('Reading', 1),
('Reading', 2),
('Gym', 2),
('Gym', 3),
('Cooking', 4),
('Traveling', 5);

/* Inserting data into userHasGroup */
INSERT INTO userHasGroup (user_iduserr, group_idgroupp) VALUES 
(1, 5),
(2, 3),
(3, 1),
(4, 2),
(5, 4),
(6, 3),
(6, 2);

/* Inserting data into friendships */
INSERT INTO friendship (user1_iduserr, user2_iduserr) VALUES 
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);

/* Inserting data into websites */
INSERT INTO website (link, company_idcompany) VALUES 
('www.techgiants.com', 1),
('www.readersinc.com', 2),
('www.fitwell.com', 3),
('www.gourmetfoods.com', 4),
('www.worldtours.com', 5);

/* Inserting data into locations */
INSERT INTO location (street, district, city, country, company_idcompany) VALUES 
('123 Tech Rd', 'Silicon Valley', 'San Jose', 'USA', 1),
('456 Book St', 'Literature District', 'New York', 'USA', 2),
('789 Fitness Ave', 'Health Sector', 'Los Angeles', 'USA', 3),
('101 Gourmet Blvd', 'Culinary Corner', 'Chicago', 'USA', 4),
('202 Travel Way', 'Explorer Lane', 'Miami', 'USA', 5);

/* Inserting data into working hours */
INSERT INTO workingHours (starttime, endtime, company_idcompany) VALUES 
('08:00:00', '17:00:00', 1),
('09:00:00', '18:00:00', 2),
('07:00:00', '16:00:00', 3),
('10:00:00', '19:00:00', 4),
('11:00:00', '20:00:00', 5);

/* Inserting data into workExperience */
INSERT INTO workExperience (position, companyName, startDate, endDate, profile_idprofile) VALUES 
('Software Engineer', 'Tech Giants', '2015-06-01', '2020-06-30', 1),
('Project Manager', 'Readers Inc.', '2016-07-15', '2021-07-15', 2),
('Fitness Coach', 'Fit Well', '2017-08-10', '2022-08-10', 3);

/* Inserting data into follow */
INSERT INTO follow (profile_idprofile, company_idcompany) VALUES 
(1, 2),
(2, 2),
(3, 2),
(4,1),
(5,1),
(6,3),
(7,1);

/* Inserting data into messages */
INSERT INTO message (content, readStatus, sentStatus, readTime, sentTime, profile1_idprofile, profile2_idprofile) VALUES 
('Hello, how are you?', 1, 1, '2023-01-01 12:00:00', '2023-01-01 11:30:00', 1, 2),
('Good morning!', 0, 1, '2023-01-02 09:00:00', '2023-01-02 08:45:00', 2, 3),
('Are you coming to the event?', 1, 1, '2023-01-03 10:15:00', '2023-01-03 10:00:00', 3, 4);

/* Inserting data into videos */
INSERT INTO video (duration, videoResolution) VALUES 
('120s', '1920x1080'),
('90s', '1280x720'),
('150s', '1920x1080');

/* Inserting data into pictures */
INSERT INTO picture (pictureResolution) VALUES 
('1920x1080'),
('2560x1440'),
('3840x2160');

/* Inserting data into plainText */
INSERT INTO plainText (description) VALUES 
('Check out this cool event happening next week!'),
('Happy Birthday to me! Celebrated with friends and family.'),
('New Year, New Beginnings! Excited for what’s to come in 2023.');

/* Inserting data into postOnProfile */
INSERT INTO postOnProfile (profile_idprofile, video_idvideo, picture_idpicture, plainText_idplainText, time) VALUES 
(1, NULL, 1, NULL, '2023-05-01 08:00:00'),
(2, 1, NULL, NULL, '2023-05-02 09:00:00'),
(3, NULL, NULL, 1, '2023-05-03 10:00:00');

/* Inserting data into commentOnPost */
INSERT INTO commentOnPost (content, date, post_idpostOnProfile, profile_idprofile) VALUES 
('This is amazing!', '2023-05-01 09:00:00', 1, 2),
('I wish I could be there!', '2023-05-02 10:00:00', 2, 3),
('Let’s make it a great year!', '2023-05-03 11:00:00', 3, 1);

/* Inserting data into likes */
INSERT INTO likes (time, post_idpostOnProfile, profile_idprofile) VALUES 
('2023-05-01', 1, 3),
('2023-05-02', 2, 1),
('2023-05-03', 3, 2);



/*                                                        QUERIES 															*/

/* 

1. Which group is the member "John Jackson" a part of? 

*/

SELECT g.name AS GroupName
FROM userr u
INNER JOIN userHasGroup ugh ON u.iduserr = ugh.user_iduserr
INNER JOIN groupp g ON ugh.group_idgroupp = g.idgroupp
WHERE u.firstName = 'John' AND u.lastName = 'Jackson';




/* 

2. List all categories of marital status and their corresponding users. 
List all categories even if no user has selected that status yet. 

*/

SELECT 
	u.firstName as FirstName,
    u.lastName as LastName,
    CASE u.maritalStatus
		WHEN 0 THEN 'Single'
        WHEN 1 THEN 'Married'
        ELSE 'UNKNOWN'
	END AS MartialStatus
FROM userr u;



/*

3. List all users and their date of birth and calculate their current age in years for each user. 

*/


SELECT u.firstName AS FirstName, u.lastName AS LastName, u.birthday AS Birthday, TIMESTAMPDIFF(YEAR, u.birthday, CURDATE()) AS Age
FROM userr u;



/*

4. How many members are in each group? 

*/

SELECT g.name AS GroupName, COUNT(ugh.user_iduserr) AS MemberCount
FROM groupp g
LEFT JOIN userHasGroup ugh ON g.idgroupp = ugh.group_idgroupp
GROUP BY g.name;


/* 

5. Which company has the most followers? 

*/

SELECT c.name AS CompanyName, COUNT(f.company_idcompany) AS FollowerCount
FROM company c
LEFT JOIN follow f ON c.idcompany = f.company_idcompany
GROUP BY c.idcompany, c.name
HAVING COUNT(f.company_idcompany) = (
    SELECT MAX(FollowerCount) 
    FROM (
        SELECT COUNT(f.company_idcompany) AS FollowerCount
        FROM company c
        LEFT JOIN follow f ON c.idcompany = f.company_idcompany
        GROUP BY c.idcompany
    ) AS subquery
);


/*

6. Change the name of the group "FERI group" to "FERI group 2020". 

*/
UPDATE groupp SET name = 'FERI group 2020' WHERE name = 'FERI group' AND idgroupp != 0;


/*

7. Delete the user "Carol Jacobson"

*/
DELETE FROM userr
WHERE firstName = 'Carol' AND lastName = 'Jacobson' AND firstName != "";