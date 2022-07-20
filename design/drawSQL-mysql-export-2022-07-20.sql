CREATE TABLE `users`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `firstname` VARCHAR(255) NOT NULL,
    `secondname` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `phonenumber` BIGINT NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `followers` INT NOT NULL,
    `following` INT NOT NULL
);
CREATE TABLE `posts`(
    `postid` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(255) NOT NULL,
    `userid` INT NOT NULL,
    `medialink` VARCHAR(255) NOT NULL,
    `likes` INT NOT NULL,
    `comments` INT NOT NULL
);
CREATE TABLE `likes`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `userid` INT NOT NULL,
    `postid` INT NOT NULL
);
CREATE TABLE `comments`(
    `commentid` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `postid` INT NOT NULL,
    `parrentcommandid` INT NULL
);
CREATE TABLE `follow`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `requesterid` INT NOT NULL,
    `requestedid` INT NOT NULL,
    `status` TINYINT(1) NOT NULL
);
CREATE TABLE `rooms`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user1id` INT NOT NULL,
    `user2id` INT NOT NULL
);
CREATE TABLE `messages`(
    `messageid` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `roomid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `message` VARCHAR(255) NOT NULL,
    `senderid` INT NOT NULL,
    `receiverid` INT NOT NULL
);
ALTER TABLE
    `likes` ADD CONSTRAINT `likes_postid_foreign` FOREIGN KEY(`postid`) REFERENCES `posts`(`postid`);
ALTER TABLE
    `posts` ADD CONSTRAINT `posts_userid_foreign` FOREIGN KEY(`userid`) REFERENCES `users`(`id`);
ALTER TABLE
    `likes` ADD CONSTRAINT `likes_userid_foreign` FOREIGN KEY(`userid`) REFERENCES `users`(`id`);
ALTER TABLE
    `rooms` ADD CONSTRAINT `rooms_user1id_foreign` FOREIGN KEY(`user1id`) REFERENCES `users`(`id`);
ALTER TABLE
    `rooms` ADD CONSTRAINT `rooms_user1id_foreign` FOREIGN KEY(`user1id`) REFERENCES `users`(`id`);
ALTER TABLE
    `comments` ADD CONSTRAINT `comments_parrentcommandid_foreign` FOREIGN KEY(`parrentcommandid`) REFERENCES `comments`(`commentid`);