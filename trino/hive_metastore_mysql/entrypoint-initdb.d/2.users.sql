### mysql_user
CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'changeit';
GRANT ALL PRIVILEGES ON `metastore_db`.* TO `admin`@`%`;
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'changeit';
GRANT ALL PRIVILEGES ON `metastore_db`.* TO `admin`@`localhost`;
###

flush privileges;
