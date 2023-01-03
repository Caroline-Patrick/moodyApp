# moodyApp

## Data Needs
### Users
* Id
* firstName
* lastName

Relationships:
* *user could have zero or many logs*
* *user could have one or many userContacts*
* *user could have zero or many logs*

### UsersContact
* UserId
* email

### UsersCredentials
* UserId
* UserName
* password


### UserLogs
* Id
* createDate
* createTime
* moodName
* skillName
* userId

Relationships: 
* *log has one and only one Mood*
* *log has zero or many skills*

### Moods
* moodId
* moodName
* moodDescription

Relationships: 
* *Mood could have 1 or many skills*


### Skills/Interventions
* skillId
* skillName
* skillDescription
* moodName

Relationships: 
* *Skill could have 1 or many moods*

## Connect to a Database

## Create SQL Files
* write SQL commands to create data tables
* store commands in appropriate files (userSeedData.sql, productSeedData.sql, etc.)
* store files in repo
