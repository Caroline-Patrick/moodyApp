DROP TABLE IF EXISTS usersContact, usersAddress, users, usersCredentials, userLogs, moods, skills;

CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  PRIMARY KEY (id)
);

CREATE TABLE usersContact (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  email VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (user_id)
  REFERENCES users (id)
    ON DELETE CASCADE
);


CREATE TABLE usersCredentials (
  id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(25),
  password VARCHAR(100),
  PRIMARY KEY (id),
  UNIQUE KEY (username)
);

CREATE TABLE userLogs (
	id INT NOT NULL auto_increment,
	user_id VARCHAR(25),
	createDate date,
	createTime timestamp,
	moodName VARCHAR(25),
	skillName VARCHAR(200),
	PRIMARY KEY(id),
	FOREIGN KEY(user_id) 
    REFERENCES users (id)
 );
 
 CREATE TABLE moods (
	moodId INT NOT NULL,
    moodName VARCHAR(25),
    moodDesc VARCHAR(300)
 );
 
 CREATE TABLE skills (
	skillId INT NOT NULL auto_increment,
    skillName VARCHAR(50),
    skillDesc VARCHAR(300),
    moodId INT NOT NULL,
    FOREIGN KEY(moodId)
    REFERENCES moods(moodId)
 );


INSERT INTO users
	(first_name, last_name)
VALUES 
  ("James","Butt"),
  ("Josephine","Darakjy"),
  ("Art","Venere"),
  ("Lenna","Paprocki"),
  ("Donette","Foller"),
  ("Simona","Morasca"),
  ("Mitsue","Tollner"),
  ("Leota","Dilliard"),
  ("Sage","Wieser"),
  ("Kris","Marrier");

INSERT INTO usersContact
	(user_id, email)
VALUES 
  (92, "cory.gibes@gmail.com"),
  (332, "kirk.herritt@aol.com"),
  (177, "joesph_degonia@degonia.org"),
  (495, "lai@gmail.com"),
  (207, "norah.waymire@gmail.com"),
  (398, "levi.munis@gmail.com"),
  (201, "barrett.toyama@toyama.org"),
  (237, "taryn.moyd@hotmail.com"),
  (496, "bgillaspie@gillaspie.com");


INSERT INTO moods
	(moodId, moodName, moodDesc)
VALUES 
  (001,"Anger", "feeling mad"),
  (002,"Joyful", "Feeling happy"),
  (003, "Sad", "feeling down"),
  (004, "Bored", "feeling blah");
  
  
  INSERT INTO skills
	(skillId, skillName, skillDesc, moodId)
VALUES 
  (11,"Scribbling", "scribble through paper", 001),
  (12,"Log", "I listened to music", 002),
  (13, "Journal", "write down your feelings", 003),
  (14,"Gratitude", "what are you grateful for", 004);
  