-- MySQL Script generated by MySQL Workbench
-- Mon Feb  3 21:56:37 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

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
-- Table `bagginsdb`.`CONTATO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`CONTATO` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`CONTATO` (
  `IdContato` INT NOT NULL,
  `Pais` VARCHAR(3) NULL,
  `Ddd` INT NULL,
  `Numero` VARCHAR(20) NULL,
  PRIMARY KEY (`IdContato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`PESSOA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`PESSOA` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`PESSOA` (
  `IdPessoa` INT NOT NULL,
  `Nome` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `IsEmpresa` BOOLEAN NOT NULL,
  `CONTATO_IdContato` INT NOT NULL,
  PRIMARY KEY (`IdPessoa`,`CONTATO_IdContato`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_PESSOA_CONTATO1_idx` (`CONTATO_IdContato` ASC),
  CONSTRAINT `fk_PESSOA_CONTATO1`
    FOREIGN KEY (`CONTATO_IdContato`)
    REFERENCES `bagginsdb`.`CONTATO` (`IdContato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`ENDERECO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`ENDERECO` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`ENDERECO` (
  `IdEndereco` INT NOT NULL,
  `CEP` INT NOT NULL,
  `Numero` INT NULL,
  `Rua` VARCHAR(100) NOT NULL,
  `Estado` VARCHAR(50) NOT NULL,
  `Cidade` VARCHAR(100) NOT NULL,
  `Bairro` VARCHAR(100) NOT NULL,
  `PESSOA_IdPessoa` INT NOT NULL,
  PRIMARY KEY (`IdEndereco`, `PESSOA_IdPessoa`),
  INDEX `fk_ENDERECO_PESSOA1_idx` (`PESSOA_IdPessoa` ASC),
  CONSTRAINT `fk_ENDERECO_PESSOA1`
    FOREIGN KEY (`PESSOA_IdPessoa`)
    REFERENCES `bagginsdb`.`PESSOA` (`IdPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`LOGIN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`LOGIN` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`LOGIN` (
  `IdLogin` INT NOT NULL,
  `Senha` VARCHAR(20) NOT NULL,
  `PESSOA_IdPessoa` INT NOT NULL,
  PRIMARY KEY (`IdLogin`, `PESSOA_IdPessoa`),
  INDEX `fk_LOGIN_PESSOA1_idx` (`PESSOA_IdPessoa` ASC),
  CONSTRAINT `fk_LOGIN_PESSOA1`
    FOREIGN KEY (`PESSOA_IdPessoa`)
    REFERENCES `bagginsdb`.`PESSOA` (`IdPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`ENDERECO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`ENDERECO` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`ENDERECO` (
  `IdEndereco` INT NOT NULL,
  `CEP` INT NOT NULL,
  `Numero` INT NULL,
  `Rua` VARCHAR(100) NOT NULL,
  `Estado` VARCHAR(50) NOT NULL,
  `Cidade` VARCHAR(100) NOT NULL,
  `Bairro` VARCHAR(100) NOT NULL,
  `PESSOA_IdPessoa` INT NOT NULL,
  PRIMARY KEY (`IdEndereco`, `PESSOA_IdPessoa`),
  INDEX `fk_ENDERECO_PESSOA1_idx` (`PESSOA_IdPessoa` ASC),
  CONSTRAINT `fk_ENDERECO_PESSOA1`
    FOREIGN KEY (`PESSOA_IdPessoa`)
    REFERENCES `bagginsdb`.`PESSOA` (`IdPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`LOGIN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`LOGIN` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`LOGIN` (
  `IdLogin` INT NOT NULL,
  `Senha` VARCHAR(20) NOT NULL,
  `PESSOA_IdPessoa` INT NOT NULL,
  PRIMARY KEY (`IdLogin`, `PESSOA_IdPessoa`),
  INDEX `fk_LOGIN_PESSOA1_idx` (`PESSOA_IdPessoa` ASC),
  CONSTRAINT `fk_LOGIN_PESSOA1`
    FOREIGN KEY (`PESSOA_IdPessoa`)
    REFERENCES `bagginsdb`.`PESSOA` (`IdPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`BENEFICIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`BENEFICIO` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`BENEFICIO` (
  `IdBeneficio` INT NOT NULL,
  `Nome` VARCHAR(100) NOT NULL,
  `Descricao` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`IdBeneficio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`OPORTUNIDADE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`OPORTUNIDADE` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`OPORTUNIDADE` (
  `IdOportunidade` INT NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `Descricao` VARCHAR(500) NOT NULL,
  `PESSOA_IdPessoa` INT NOT NULL,
  `PESSOA_CONTATO_IdContato` INT NOT NULL,
  `BENEFICIO_IdBeneficio` INT NOT NULL,
  PRIMARY KEY (`IdOportunidade`, `PESSOA_IdPessoa`, `PESSOA_CONTATO_IdContato`, `BENEFICIO_IdBeneficio`),
  INDEX `fk_OPORTUNIDADE_PESSOA1_idx` (`PESSOA_IdPessoa` ASC, `PESSOA_CONTATO_IdContato` ASC),
  INDEX `fk_OPORTUNIDADE_BENEFICIO1_idx` (`BENEFICIO_IdBeneficio` ASC),
  CONSTRAINT `fk_OPORTUNIDADE_PESSOA1`
    FOREIGN KEY (`PESSOA_IdPessoa` , `PESSOA_CONTATO_IdContato`)
    REFERENCES `bagginsdb`.`PESSOA` (`IdPessoa` , `CONTATO_IdContato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OPORTUNIDADE_BENEFICIO1`
    FOREIGN KEY (`BENEFICIO_IdBeneficio`)
    REFERENCES `bagginsdb`.`BENEFICIO` (`IdBeneficio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`NIVEL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`NIVEL` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`NIVEL` (
  `IdNivel` INT NOT NULL,
  `Basico` INT NULL DEFAULT 1,
  `Intermediario` INT NULL DEFAULT 2,
  `Avancado` INT NULL DEFAULT 3,
  `Fluente` INT NULL DEFAULT 4,
  PRIMARY KEY (`IdNivel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`IDIOMA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`IDIOMA` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`IDIOMA` (
  `IdIdioma` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Instituicao` VARCHAR(100) NOT NULL,
  `Duracao` INT NOT NULL,
  `DtConclusao` DATETIME NOT NULL,
  `NIVEL_IdNivel` INT NOT NULL,
  `PESSOA_IdPessoa` INT NOT NULL,
  PRIMARY KEY (`IdIdioma`, `NIVEL_IdNivel`, `PESSOA_IdPessoa`),
  INDEX `fk_IDIOMA_NIVEL1_idx` (`NIVEL_IdNivel` ASC),
  INDEX `fk_IDIOMA_PESSOA1_idx` (`PESSOA_IdPessoa` ASC),
  CONSTRAINT `fk_IDIOMA_NIVEL1`
    FOREIGN KEY (`NIVEL_IdNivel`)
    REFERENCES `bagginsdb`.`NIVEL` (`IdNivel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_IDIOMA_PESSOA1`
    FOREIGN KEY (`PESSOA_IdPessoa`)
    REFERENCES `bagginsdb`.`PESSOA` (`IdPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`CURSO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`CURSO` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`CURSO` (
  `IdCurso` INT NOT NULL COMMENT '		',
  `Nome` VARCHAR(100) NOT NULL,
  `Descricao` VARCHAR(450) NOT NULL,
  `Instituicao` VARCHAR(100) NOT NULL,
  `DtConclusao` DATETIME NOT NULL,
  `PESSOA_IdPessoa` INT NOT NULL,
  PRIMARY KEY (`IdCurso`, `PESSOA_IdPessoa`),
  INDEX `fk_CURSO_PESSOA1_idx` (`PESSOA_IdPessoa` ASC),
  CONSTRAINT `fk_CURSO_PESSOA1`
    FOREIGN KEY (`PESSOA_IdPessoa`)
    REFERENCES `bagginsdb`.`PESSOA` (`IdPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`GRAU_ESCOLAR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`GRAU_ESCOLAR` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`GRAU_ESCOLAR` (
  `IdGrauEscolar` INT NOT NULL COMMENT '	',
  `Basico` INT NULL DEFAULT 1,
  `Medio` INT NULL DEFAULT 2,
  `GraduacaoIncompleto` INT NULL DEFAULT 3,
  `Graduacao` INT NULL DEFAULT 4,
  `PosGraduado` INT NULL DEFAULT 5,
  `PosGraduadoIncompleto` INT NULL DEFAULT 6,
  `Mestre` INT NULL DEFAULT 7,
  `MestreIncompleto` INT NULL DEFAULT 8,
  `Doutor` INT NULL DEFAULT 9,
  `DoutorIncompleto` INT NULL DEFAULT 10,
  `PosDoutor` INT NULL DEFAULT 11,
  `PosDoutorIncompleto` INT NULL DEFAULT 12,
  PRIMARY KEY (`IdGrauEscolar`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`FORMACAO_ESCOLAR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`FORMACAO_ESCOLAR` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`FORMACAO_ESCOLAR` (
  `IdFormacaoEscolar` INT NOT NULL,
  `Curso` VARCHAR(100) NOT NULL,
  `instituicao` VARCHAR(100) NOT NULL,
  `GRAU_ESCOLAR_IdGrauEscolar` INT NOT NULL,
  `DtConclusao` DATETIME NOT NULL,
  `PESSOA_IdPessoa` INT NOT NULL,
  PRIMARY KEY (`IdFormacaoEscolar`, `GRAU_ESCOLAR_IdGrauEscolar`, `PESSOA_IdPessoa`),
  INDEX `fk_FORMACAO_ESCOLAR_GRAU_ESCOLAR1_idx` (`GRAU_ESCOLAR_IdGrauEscolar` ASC),
  INDEX `fk_FORMACAO_ESCOLAR_PESSOA1_idx` (`PESSOA_IdPessoa` ASC),
  CONSTRAINT `fk_FORMACAO_ESCOLAR_GRAU_ESCOLAR1`
    FOREIGN KEY (`GRAU_ESCOLAR_IdGrauEscolar`)
    REFERENCES `bagginsdb`.`GRAU_ESCOLAR` (`IdGrauEscolar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FORMACAO_ESCOLAR_PESSOA1`
    FOREIGN KEY (`PESSOA_IdPessoa`)
    REFERENCES `bagginsdb`.`PESSOA` (`IdPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`EXPERIENCIA_PROFISSIONAL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`EXPERIENCIA_PROFISSIONAL` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`EXPERIENCIA_PROFISSIONAL` (
  `IdExperienciaProfissional` INT NOT NULL,
  `Empresa` VARCHAR(100) NOT NULL,
  `Cargo` VARCHAR(100) NOT NULL,
  `Descricao` VARCHAR(400) NOT NULL,
  `DtAdmissao` DATETIME NOT NULL,
  `DtDemissao` VARCHAR(45) NOT NULL,
  `PESSOA_IdPessoa` INT NOT NULL,
  PRIMARY KEY (`IdExperienciaProfissional`, `PESSOA_IdPessoa`),
  INDEX `fk_EXPERIENCIA_PROFISSIONAL_PESSOA1_idx` (`PESSOA_IdPessoa` ASC),
  CONSTRAINT `fk_EXPERIENCIA_PROFISSIONAL_PESSOA1`
    FOREIGN KEY (`PESSOA_IdPessoa`)
    REFERENCES `bagginsdb`.`PESSOA` (`IdPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`CURRICULO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`CURRICULO` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`CURRICULO` (
  `IdCurriculo` INT NOT NULL,
  `PESSOA_IdPessoa` INT NOT NULL,
  `PESSOA_CONTATO_IdContato` INT NOT NULL,
  `IDIOMA_IdIdioma` INT NOT NULL,
  `IDIOMA_NIVEL_IdNivel` INT NOT NULL,
  `CURSO_IdCurso` INT NOT NULL,
  `FORMACAO_ESCOLAR_IdFormacaoEscolar` INT NOT NULL,
  `FORMACAO_ESCOLAR_GRAU_ESCOLAR_IdGrauEscolar` INT NOT NULL,
  `EXPERIENCIA_PROFISSIONAL_IdExperienciaProfissional` INT NOT NULL,
  PRIMARY KEY (`IdCurriculo`, `PESSOA_IdPessoa`,  `PESSOA_CONTATO_IdContato`, `IDIOMA_IdIdioma`, `IDIOMA_NIVEL_IdNivel`, `CURSO_IdCurso`, `FORMACAO_ESCOLAR_IdFormacaoEscolar`, `FORMACAO_ESCOLAR_GRAU_ESCOLAR_IdGrauEscolar`, `EXPERIENCIA_PROFISSIONAL_IdExperienciaProfissional`),
  INDEX `fk_CURRICULO_PESSOA1_idx` (`PESSOA_IdPessoa` ASC, `PESSOA_CONTATO_IdContato` ASC),
  INDEX `fk_CURRICULO_IDIOMA1_idx` (`IDIOMA_IdIdioma` ASC, `IDIOMA_NIVEL_IdNivel` ASC),
  INDEX `fk_CURRICULO_CURSO1_idx` (`CURSO_IdCurso` ASC),
  INDEX `fk_CURRICULO_FORMACAO_ESCOLAR1_idx` (`FORMACAO_ESCOLAR_IdFormacaoEscolar` ASC, `FORMACAO_ESCOLAR_GRAU_ESCOLAR_IdGrauEscolar` ASC),
  INDEX `fk_CURRICULO_EXPERIENCIA_PROFISSIONAL1_idx` (`EXPERIENCIA_PROFISSIONAL_IdExperienciaProfissional` ASC),
  CONSTRAINT `fk_CURRICULO_PESSOA1`
    FOREIGN KEY (`PESSOA_IdPessoa`, `PESSOA_CONTATO_IdContato`)
    REFERENCES `bagginsdb`.`PESSOA` (`IdPessoa` , `CONTATO_IdContato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CURRICULO_IDIOMA1`
    FOREIGN KEY (`IDIOMA_IdIdioma` , `IDIOMA_NIVEL_IdNivel`)
    REFERENCES `bagginsdb`.`IDIOMA` (`IdIdioma` , `NIVEL_IdNivel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CURRICULO_CURSO1`
    FOREIGN KEY (`CURSO_IdCurso`)
    REFERENCES `bagginsdb`.`CURSO` (`IdCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CURRICULO_FORMACAO_ESCOLAR1`
    FOREIGN KEY (`FORMACAO_ESCOLAR_IdFormacaoEscolar` , `FORMACAO_ESCOLAR_GRAU_ESCOLAR_IdGrauEscolar`)
    REFERENCES `bagginsdb`.`FORMACAO_ESCOLAR` (`IdFormacaoEscolar` , `GRAU_ESCOLAR_IdGrauEscolar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CURRICULO_EXPERIENCIA_PROFISSIONAL1`
    FOREIGN KEY (`EXPERIENCIA_PROFISSIONAL_IdExperienciaProfissional`)
    REFERENCES `bagginsdb`.`EXPERIENCIA_PROFISSIONAL` (`IdExperienciaProfissional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`CANDIDATURA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`CANDIDATURA` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`CANDIDATURA` (
  `IdCandidatura` INT NOT NULL,
  `CURRICULO_IdCurriculo` INT NOT NULL,
  `CURRICULO_PESSOA_IdPessoa` INT NOT NULL,
  `CURRICULO_PESSOA_CONTATO_IdContato` INT NOT NULL,
  `CURRICULO_IDIOMA_IdIdioma` INT NOT NULL,
  `CURRICULO_IDIOMA_NIVEL_IdNivel` INT NOT NULL,
  `CURRICULO_CURSO_IdCurso` INT NOT NULL,
  `CURRICULO_FORMACAO_ESCOLAR_IdFormacaoEscolar` INT NOT NULL,
  `CURRICULO_FORMACAO_ESCOLAR_GRAU_ESCOLAR_IdGrauEscolar` INT NOT NULL,
  `CURRICULO_EXPERIENCIA_PROFISSIONAL_IdExperienciaProfissional` INT NOT NULL,
  `OPORTUNIDADE_IdOportunidade` INT NOT NULL,
  `OPORTUNIDADE_PESSOA_IdPessoa` INT NOT NULL,
  `OPORTUNIDADE_PESSOA_TIPO_PESSOA_IdTipoPessoa` INT NOT NULL,
  `OPORTUNIDADE_PESSOA_CONTATO_IdContato` INT NOT NULL,
  `OPORTUNIDADE_BENEFICIO_IdBeneficio` INT NOT NULL,
  PRIMARY KEY (`IdCandidatura`, `CURRICULO_IdCurriculo`, `CURRICULO_PESSOA_IdPessoa`, `CURRICULO_PESSOA_CONTATO_IdContato`, `CURRICULO_IDIOMA_IdIdioma`, `CURRICULO_IDIOMA_NIVEL_IdNivel`, `CURRICULO_CURSO_IdCurso`, `CURRICULO_FORMACAO_ESCOLAR_IdFormacaoEscolar`, `CURRICULO_FORMACAO_ESCOLAR_GRAU_ESCOLAR_IdGrauEscolar`, `CURRICULO_EXPERIENCIA_PROFISSIONAL_IdExperienciaProfissional`, `OPORTUNIDADE_IdOportunidade`, `OPORTUNIDADE_PESSOA_IdPessoa`, `OPORTUNIDADE_PESSOA_TIPO_PESSOA_IdTipoPessoa`, `OPORTUNIDADE_PESSOA_CONTATO_IdContato`, `OPORTUNIDADE_BENEFICIO_IdBeneficio`),
  INDEX `fk_CANDIDATURA_CURRICULO1_idx` (`CURRICULO_IdCurriculo` ASC, `CURRICULO_PESSOA_IdPessoa` ASC, `CURRICULO_PESSOA_CONTATO_IdContato` ASC, `CURRICULO_IDIOMA_IdIdioma` ASC, `CURRICULO_IDIOMA_NIVEL_IdNivel` ASC, `CURRICULO_CURSO_IdCurso` ASC, `CURRICULO_FORMACAO_ESCOLAR_IdFormacaoEscolar` ASC, `CURRICULO_FORMACAO_ESCOLAR_GRAU_ESCOLAR_IdGrauEscolar` ASC, `CURRICULO_EXPERIENCIA_PROFISSIONAL_IdExperienciaProfissional` ASC),
  INDEX `fk_CANDIDATURA_OPORTUNIDADE1_idx` (`OPORTUNIDADE_IdOportunidade` ASC, `OPORTUNIDADE_PESSOA_IdPessoa` ASC, `OPORTUNIDADE_PESSOA_CONTATO_IdContato` ASC, `OPORTUNIDADE_BENEFICIO_IdBeneficio` ASC),
  CONSTRAINT `fk_CANDIDATURA_CURRICULO1`
    FOREIGN KEY (`CURRICULO_IdCurriculo` , `CURRICULO_PESSOA_IdPessoa`, `CURRICULO_PESSOA_CONTATO_IdContato` , `CURRICULO_IDIOMA_IdIdioma` , `CURRICULO_IDIOMA_NIVEL_IdNivel` , `CURRICULO_CURSO_IdCurso` , `CURRICULO_FORMACAO_ESCOLAR_IdFormacaoEscolar` , `CURRICULO_FORMACAO_ESCOLAR_GRAU_ESCOLAR_IdGrauEscolar` , `CURRICULO_EXPERIENCIA_PROFISSIONAL_IdExperienciaProfissional`)
    REFERENCES `bagginsdb`.`CURRICULO` (`IdCurriculo` , `PESSOA_IdPessoa` , `PESSOA_CONTATO_IdContato` , `IDIOMA_IdIdioma` , `IDIOMA_NIVEL_IdNivel` , `CURSO_IdCurso` , `FORMACAO_ESCOLAR_IdFormacaoEscolar` , `FORMACAO_ESCOLAR_GRAU_ESCOLAR_IdGrauEscolar` , `EXPERIENCIA_PROFISSIONAL_IdExperienciaProfissional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CANDIDATURA_OPORTUNIDADE1`
    FOREIGN KEY (`OPORTUNIDADE_IdOportunidade` , `OPORTUNIDADE_PESSOA_IdPessoa` , `OPORTUNIDADE_PESSOA_CONTATO_IdContato` , `OPORTUNIDADE_BENEFICIO_IdBeneficio`)
    REFERENCES `bagginsdb`.`OPORTUNIDADE` (`IdOportunidade` , `PESSOA_IdPessoa` , `PESSOA_CONTATO_IdContato` , `BENEFICIO_IdBeneficio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bagginsdb`.`CHAT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bagginsdb`.`CHAT` ;

CREATE TABLE IF NOT EXISTS `bagginsdb`.`CHAT` (
  `IdChat` INT NOT NULL,
  `Mensagem` VARCHAR(500) NOT NULL,
  `PESSOA_IdPessoaEnvio` INT NOT NULL,
  `PESSOA_CONTATO_IdContatoEnvio` INT NOT NULL,
  `PESSOA_IdPessoaRecebimento` INT NOT NULL,
  `PESSOA_CONTATO_IdContatoRecebimento` INT NOT NULL,
  PRIMARY KEY (`IdChat`, `PESSOA_IdPessoaEnvio`, `PESSOA_CONTATO_IdContatoEnvio`, `PESSOA_IdPessoaRecebimento`, `PESSOA_CONTATO_IdContatoRecebimento`),
  INDEX `fk_CHAT_PESSOA1_idx` (`PESSOA_IdPessoaEnvio` ASC, `PESSOA_CONTATO_IdContatoEnvio` ASC),
  INDEX `fk_CHAT_PESSOA2_idx` (`PESSOA_IdPessoaRecebimento` ASC, `PESSOA_CONTATO_IdContatoRecebimento` ASC),
  CONSTRAINT `fk_CHAT_PESSOA1`
    FOREIGN KEY (`PESSOA_IdPessoaEnvio` , `PESSOA_CONTATO_IdContatoEnvio`)
    REFERENCES `bagginsdb`.`PESSOA` (`IdPessoa` , `TIPO_PESSOA_IdTipoPessoa` , `CONTATO_IdContato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CHAT_PESSOA2`
    FOREIGN KEY (`PESSOA_IdPessoaRecebimento` , `PESSOA_CONTATO_IdContatoRecebimento`)
    REFERENCES `bagginsdb`.`PESSOA` (`IdPessoa` , `CONTATO_IdContato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
