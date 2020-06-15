-- MySQL Script generated by MySQL Workbench
-- Thu May 14 21:31:08 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bagginsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bagginsdb` ;

-- -----------------------------------------------------
-- Schema bagginsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bagginsdb` DEFAULT CHARACTER SET utf8 ;
USE `bagginsdb` ;

-- -----------------------------------------------------
-- Table `bagginsdb`.`adonis_schema`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`adonis_schema` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`adonis_schema` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `batch` INT NULL DEFAULT NULL,
  `migration_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`pessoa` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`pessoa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(240) NOT NULL,
  `anfitriao` INT NOT NULL DEFAULT '0',
  `datanasc` VARCHAR(45) NULL DEFAULT '',
  `created_at` VARCHAR(45) NULL DEFAULT NULL,
  `updated_at` VARCHAR(45) NULL DEFAULT NULL,
  `provider` VARCHAR(240) NULL DEFAULT NULL,
  `provider_id` VARCHAR(240) NULL DEFAULT NULL,
  `provider_token` VARCHAR(240) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`tipo_oportunidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`tipo_oportunidade` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`tipo_oportunidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_oportunidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`anfitriao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`anfitriao` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`anfitriao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idPessoa` INT NOT NULL,
  `tipoEmpresa` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_anfitriao_pessoa_idx` (`idPessoa` ASC),
  INDEX `fk_anfitriao_tipo_empresa_idx` (`tipoEmpresa` ASC),
  CONSTRAINT `fk_anfitriao_pessoa`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `bagginsdb`.`pessoa` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_anfitriao_tipo_empresa`
    FOREIGN KEY (`tipoEmpresa`)
    REFERENCES `bagginsdb`.`tipo_oportunidade` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`files`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`files` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`files` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `type` VARCHAR(20),
  `subtype` VARCHAR(20),
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `bagginsdb`.`oportunidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`oportunidade` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`oportunidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(240) NOT NULL,
  `descricao` VARCHAR(1000) NOT NULL,
  `idTipoOportunidade` INT NOT NULL,
  `idAnfitriao` INT NOT NULL,
  `idFile` INT NOT NULL,
  `disponibilidadeInicio` VARCHAR(45) NOT NULL,
  `disponibilidadeFinal` VARCHAR(45) NOT NULL,
  `horasSemanais` VARCHAR(45) NOT NULL,
  `requisitos` VARCHAR(240) NOT NULL,
  `mediaAvaliacao` FLOAT(3,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tipo_oportunidade_idx` (`idTipoOportunidade` ASC),
  INDEX `fk_oportunidade_anfitriao_idx` (`idAnfitriao` ASC),
  INDEX `fk_files_idx` (`idFile` ASC),
  CONSTRAINT `fk_oportunidade_anfitriao`
    FOREIGN KEY (`idAnfitriao`)
    REFERENCES `bagginsdb`.`anfitriao` (`id`),
  CONSTRAINT `fk_tipo_oportunidade`
    FOREIGN KEY (`idTipoOportunidade`)
    REFERENCES `bagginsdb`.`tipo_oportunidade` (`id`),
  CONSTRAINT `fk_files`
    FOREIGN KEY (`idFile`)
    REFERENCES `bagginsdb`.`files` (`id`))    
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`candidatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`candidatura` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`candidatura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idPessoa` INT NOT NULL,
  `idOportunidade` INT NOT NULL,
  `idAnfitriao` INT NOT NULL,
  `aprovado` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `fk_CANDIDATURA_OPORTUNIDADE1_idx` (`idOportunidade` ASC),
  INDEX `fk_CANDIDATURA_CURRICULO1_idx` (`idPessoa` ASC),
  INDEX `fk_CANDIDATURA_ANFITRIAO_idx` (`idAnfitriao` ASC),
  CONSTRAINT `fk_CANDIDATURA_ANFITRIAO`
    FOREIGN KEY (`idAnfitriao`)
    REFERENCES `bagginsdb`.`anfitriao` (`id`),
  CONSTRAINT `fk_CANDIDATURA_CURRICULO1`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `bagginsdb`.`pessoa` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_CANDIDATURA_OPORTUNIDADE1`
    FOREIGN KEY (`idOportunidade`)
    REFERENCES `bagginsdb`.`oportunidade` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`contato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`contato` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`contato` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(12) NOT NULL,
  `idPessoa` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_contato_pessoa_idx` (`idPessoa` ASC),
  CONSTRAINT `fk_contato_pessoa`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `bagginsdb`.`pessoa` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`habilidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`habilidade` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`habilidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `habilidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`habilidade_pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`habilidade_pessoa` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`habilidade_pessoa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idHabilidade` INT NOT NULL,
  `idPessoa` INT NOT NULL,
  `rateStar` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `fk_pessoa_idx` (`idPessoa` ASC),
  INDEX `fk_habilidade_idx` (`idHabilidade` ASC),
  CONSTRAINT `fk_habilidade`
    FOREIGN KEY (`idHabilidade`)
    REFERENCES `bagginsdb`.`habilidade` (`id`),
  CONSTRAINT `fk_pessoa`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `bagginsdb`.`pessoa` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`idioma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`idioma` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`idioma` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idioma` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`idioma_proficiencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`idioma_proficiencia` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`idioma_proficiencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `proficiencia` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`pessoa_idioma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`pessoa_idioma` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`pessoa_idioma` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idIdioma` INT NOT NULL,
  `idProficiencia` INT NOT NULL COMMENT '0 - Basico\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n1 - Intermediario\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\' /* comment truncated */ /*\\\\\\\\\\\\\\\\\\\\\\\\\\\\n2 - Avançado\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n3 - Fluente\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/,
  `idPessoa` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_IDIOMA_PESSOA1_idx` (`idPessoa` ASC),
  INDEX `fk_idioma_id_idx` (`idIdioma` ASC),
  INDEX `fk_proficiencia_idx` (`idProficiencia` ASC),
  CONSTRAINT `fk_idioma_id`
    FOREIGN KEY (`idIdioma`)
    REFERENCES `bagginsdb`.`idioma` (`id`),
  CONSTRAINT `fk_pessoa_id`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `bagginsdb`.`pessoa` (`id`),
  CONSTRAINT `fk_proficiencia`
    FOREIGN KEY (`idProficiencia`)
    REFERENCES `bagginsdb`.`idioma_proficiencia` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`curriculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`curriculo` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`curriculo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idPessoa` INT NOT NULL,
  `idIdioma` INT NOT NULL DEFAULT '8',
  `idHabilidade` INT NOT NULL DEFAULT '0',
  `descricao` VARCHAR(240) NOT NULL,
  `facebook` VARCHAR(45) NULL DEFAULT NULL,
  `twitter` VARCHAR(45) NULL DEFAULT NULL,
  `instagram` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_HABILIDADE_idx` (`idHabilidade` ASC),
  INDEX `fk_idioma_pessoa_idx` (`idPessoa` ASC, `idIdioma` ASC),
  CONSTRAINT `fk_habilidade_id`
    FOREIGN KEY (`idHabilidade`)
    REFERENCES `bagginsdb`.`habilidade_pessoa` (`id`),
  CONSTRAINT `fk_idioma_pessoa`
    FOREIGN KEY (`idPessoa` , `idIdioma`)
    REFERENCES `bagginsdb`.`pessoa_idioma` (`idPessoa` , `id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`endereco_anfitriao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`endereco_anfitriao` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`endereco_anfitriao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idAnfitriao` INT NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_endereco_oportunidade_idx` (`idAnfitriao` ASC),
  CONSTRAINT `fk_endereco_oportunidade`
    FOREIGN KEY (`idAnfitriao`)
    REFERENCES `bagginsdb`.`anfitriao` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`endereco_pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`endereco_pessoa` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`endereco_pessoa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idPessoa` INT NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  `cep` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_endereco_pessoa_idx` (`idPessoa` ASC),
  CONSTRAINT `fk_endereco_pessoa`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `bagginsdb`.`pessoa` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`oferta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`oferta` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`oferta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `oferta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`oportunidade_avaliacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`oportunidade_avaliacao` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`oportunidade_avaliacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comentario` VARCHAR(1000) NULL DEFAULT NULL,
  `nota` FLOAT NOT NULL,
  `idOportunidade` INT NOT NULL,
  `idPessoa` INT NOT NULL,
  `created_at` VARCHAR(45) NULL DEFAULT NULL,
  `updated_at` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `avaliacao_oportunidade_fk_idx` (`idOportunidade` ASC),
  INDEX `avaliacao_pessoa_fk_idx` (`idPessoa` ASC),
  CONSTRAINT `avaliacao_oportunidade_fk`
    FOREIGN KEY (`idOportunidade`)
    REFERENCES `bagginsdb`.`oportunidade` (`id`),
  CONSTRAINT `avaliacao_pessoa_fk`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `bagginsdb`.`pessoa` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`oportunidade_oferta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`oportunidade_oferta` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`oportunidade_oferta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idOportunidade` INT NOT NULL,
  `idOferta` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_oportunidade_idx` (`idOportunidade` ASC),
  INDEX `fk_oferta_idx` (`idOferta` ASC),
  CONSTRAINT `fk_oferta`
    FOREIGN KEY (`idOferta`)
    REFERENCES `bagginsdb`.`oferta` (`id`),
  CONSTRAINT `fk_oportunidade`
    FOREIGN KEY (`idOportunidade`)
    REFERENCES `bagginsdb`.`oportunidade` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`requisito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`requisito` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`requisito` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idHabilidade` INT NOT NULL,
  `idOportunidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_requisito_habilidade_idx` (`idHabilidade` ASC),
  INDEX `fk_requisito_oportunidade_idx` (`idOportunidade` ASC),
  CONSTRAINT `fk_requisito_habilidade`
    FOREIGN KEY (`idHabilidade`)
    REFERENCES `bagginsdb`.`habilidade` (`id`),
  CONSTRAINT `fk_requisito_oportunidade`
    FOREIGN KEY (`idOportunidade`)
    REFERENCES `bagginsdb`.`oportunidade` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bagginsdb`.`tokens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`tokens` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`tokens` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idPessoa` INT NULL DEFAULT NULL,
  `token` VARCHAR(255) NOT NULL,
  `type` VARCHAR(80) NOT NULL,
  `is_revoked` TINYINT(1) NULL DEFAULT '0',
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `tokens_token_unique` (`token` ASC),
  INDEX `tokens_idpessoa_foreign` (`idPessoa` ASC),
  INDEX `tokens_token_index` (`token` ASC),
  CONSTRAINT `tokens_idpessoa_foreign`
    FOREIGN KEY (`idPessoa`)
    REFERENCES `bagginsdb`.`pessoa` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
