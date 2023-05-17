-- Create replica_user and grant replication privileges
CREATE USER 'replica_user'@'%' IDENTIFIED BY 'asakipaam';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
FLUSH PRIVILEGES;

-- Grant SELECT privileges on mysql.user table to holberton_user
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
