-- Databases
CREATE DATABASE IF NOT EXISTS recensement;
CREATE DATABASE IF NOT EXISTS group_rh;

-- Users
CREATE USER IF NOT EXISTS 'recensement'@'%' IDENTIFIED BY 'pwd';
CREATE USER IF NOT EXISTS 'group_rh'@'%' IDENTIFIED BY 'pwd';

-- Privileges
GRANT ALL PRIVILEGES ON recensement.* TO 'recensement'@'%';
GRANT ALL PRIVILEGES ON group_rh.* TO 'group_rh'@'%';

FLUSH PRIVILEGES;