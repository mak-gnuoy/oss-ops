### mysql_user
CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'changeit';
GRANT ALL PRIVILEGES ON `playground`.* TO `admin`@`%`;
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'changeit';
GRANT ALL PRIVILEGES ON `playground`.* TO `admin`@`localhost`;
###

flush privileges;
