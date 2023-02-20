-- Tabelle
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;

-- Struktur
DESCRIBE mydb.users;

INSERT INTO `mydb`.`users` (`id`, `username`, `create_time`) VALUES (DEFAULT, "max", DEFAULT);
INSERT INTO `mydb`.`users` (`id`, `username`, `create_time`) VALUES (DEFAULT, "maxine", DEFAULT);
INSERT INTO `mydb`.`users` (`id`, `username`, `create_time`) VALUES (DEFAULT, "maxl", DEFAULT);

-- Inhalte
SELECT * FROM mydb.users;