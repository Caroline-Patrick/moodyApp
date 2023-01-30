DROP TABLE IF EXISTS users, userLogs, moods, skills;

CREATE TABLE `employees`.`users` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `userName` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `userId_UNIQUE` (`userId` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `userName_UNIQUE` (`userName` ASC) VISIBLE);

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

CREATE TABLE `employees`.`userLogs` (
  `logId` INT NOT NULL AUTO_INCREMENT,
  `createDate` DATE NOT NULL,
  `createTime` DATETIME NOT NULL,
  `moodId` INT NOT NULL,
  `skillId` INT NOT NULL,
  `userId` INT NOT NULL,
  PRIMARY KEY (`logId`),
  UNIQUE INDEX `logId_UNIQUE` (`logId` ASC) VISIBLE,
  INDEX `fk_moodId_idx` (`moodId` ASC) VISIBLE,
  INDEX `fk_skillId_idx` (`skillId` ASC) VISIBLE,
  INDEX `fk_userId_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_moodId_logs`
    FOREIGN KEY (`moodId`)
    REFERENCES `employees`.`moods` (`moodId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_skillId`
    FOREIGN KEY (`skillId`)
    REFERENCES `employees`.`skills` (`skillId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_userId`
    FOREIGN KEY (`userId`)
    REFERENCES `employees`.`users` (`userId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `employees`.`moods` (
  `moodId` INT NOT NULL AUTO_INCREMENT,
  `moodName` VARCHAR(50) NOT NULL,
  `moodDesc` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`moodId`),
  UNIQUE INDEX `moodId_UNIQUE` (`moodId` ASC) VISIBLE);

CREATE TABLE `employees`.`skills` (
  `skillId` INT NOT NULL AUTO_INCREMENT,
  `skillName` VARCHAR(45) NOT NULL,
  `skillDesc` VARCHAR(45) NOT NULL,
  `moodId` INT NOT NULL,
  PRIMARY KEY (`skillId`),
  UNIQUE INDEX `skillId_UNIQUE` (`skillId` ASC) VISIBLE,
  INDEX `fk_moodId_idx` (`moodId` ASC) VISIBLE,
  CONSTRAINT `fk_moodId`
    FOREIGN KEY (`moodId`)
    REFERENCES `employees`.`moods` (`moodId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


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
  