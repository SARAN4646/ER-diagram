CREATE TABLE `Contact`(
    `contact_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `e-mail` VARCHAR(255) NOT NULL,
    `phone number` INT NOT NULL,
    `Address` VARCHAR(255) NOT NULL
);
CREATE TABLE `Group`(
    `group_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `group_name` VARCHAR(255) NOT NULL
);
CREATE TABLE `Contact_group`(
    `contact_group_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `contact_id` INT NOT NULL,
    `group_id` INT NOT NULL
);
CREATE TABLE `user`(
    `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL
);
CREATE TABLE `Note`(
    `note_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `contact_id` INT NOT NULL,
    `note_text` TEXT NOT NULL
);
CREATE TABLE `Tag`(
    `tag_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `tag_name` VARCHAR(255) NOT NULL
);
CREATE TABLE `Contact_tag`(
    `contact_tag_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `contact-id` INT NOT NULL,
    `tag_id` INT NOT NULL
);
CREATE TABLE `table_8`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `user` ADD CONSTRAINT `user_username_foreign` FOREIGN KEY(`username`) REFERENCES `Contact`(`e-mail`);
ALTER TABLE
    `Contact_group` ADD CONSTRAINT `contact_group_group_id_foreign` FOREIGN KEY(`group_id`) REFERENCES `Tag`(`tag_id`);
ALTER TABLE
    `Note` ADD CONSTRAINT `note_note_text_foreign` FOREIGN KEY(`note_text`) REFERENCES `Contact_tag`(`contact_tag_id`);
ALTER TABLE
    `Note` ADD CONSTRAINT `note_contact_id_foreign` FOREIGN KEY(`contact_id`) REFERENCES `user`(`username`);
ALTER TABLE
    `Tag` ADD CONSTRAINT `tag_tag_id_foreign` FOREIGN KEY(`tag_id`) REFERENCES `table_8`(`id`);
ALTER TABLE
    `Group` ADD CONSTRAINT `group_group_name_foreign` FOREIGN KEY(`group_name`) REFERENCES `Contact_group`(`contact_id`);