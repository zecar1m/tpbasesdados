-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hospitais
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hospitais
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospitais` DEFAULT CHARACTER SET utf8 ;
USE `hospitais` ;

-- -----------------------------------------------------
-- Table `hospitais`.`ULS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`ULS` (
  `idULS` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NOT NULL,
  `grupo` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`idULS`),
  UNIQUE INDEX `idULS_UNIQUE` (`idULS` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`Codigo_postal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`Codigo_postal` (
  `codigo_postal` VARCHAR(8) NOT NULL,
  `Localidade` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`codigo_postal`),
  UNIQUE INDEX `codigo_postal_UNIQUE` (`codigo_postal` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`EPCS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`EPCS` (
  `nif` INT NOT NULL,
  `nregisto` INT NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `morada` VARCHAR(200) NOT NULL,
  `codigo_postal` VARCHAR(8) NOT NULL,
  `uls` INT NOT NULL,
  PRIMARY KEY (`nif`),
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC) VISIBLE,
  UNIQUE INDEX `nregisto_UNIQUE` (`nregisto` ASC) VISIBLE,
  INDEX `fk01_epcs_uls_idx` (`uls` ASC) VISIBLE,
  INDEX `fk02_epcs_localidade_idx` (`codigo_postal` ASC) VISIBLE,
  CONSTRAINT `fk01_epcs_uls`
    FOREIGN KEY (`uls`)
    REFERENCES `hospitais`.`ULS` (`idULS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk02_epcs_codigo_postal`
    FOREIGN KEY (`codigo_postal`)
    REFERENCES `hospitais`.`Codigo_postal` (`codigo_postal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`Email_EPCS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`Email_EPCS` (
  `email` VARCHAR(80) NOT NULL,
  `epcs` INT NOT NULL,
  INDEX `fk01_epcs_telefone_epcs_idx` (`epcs` ASC) VISIBLE,
  PRIMARY KEY (`email`),
  CONSTRAINT `fk01_epcs_email_epcs`
    FOREIGN KEY (`epcs`)
    REFERENCES `hospitais`.`EPCS` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`Tipo_equipamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`Tipo_equipamento` (
  `idTipo` VARCHAR(10) NOT NULL,
  `tipo` VARCHAR(80) NOT NULL,
  `intervalo_inspecao` INT NULL COMMENT 'Expresso em dias.',
  PRIMARY KEY (`idTipo`),
  UNIQUE INDEX `idTipo_UNIQUE` (`idTipo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`Tipo_viatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`Tipo_viatura` (
  `idTipo` VARCHAR(10) NOT NULL,
  `tipo` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idTipo`),
  UNIQUE INDEX `idTipo_UNIQUE` (`idTipo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`Viatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`Viatura` (
  `matricula` VARCHAR(8) NOT NULL,
  `marca` VARCHAR(20) NOT NULL,
  `tipo` VARCHAR(10) NOT NULL,
  `data_matricula` DATE NOT NULL,
  `data_inspecao_anterior` DATE NULL,
  `data_inspecao_proxima` DATE NULL,
  `em_missao` TINYINT NOT NULL,
  `epcs` INT NOT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) VISIBLE,
  INDEX `fk01_viatura_epcs_idx` (`epcs` ASC) VISIBLE,
  INDEX `fk02_viatura_tipo_viatura_idx` (`tipo` ASC) VISIBLE,
  CONSTRAINT `fk01_viatura_epcs`
    FOREIGN KEY (`epcs`)
    REFERENCES `hospitais`.`EPCS` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk02_viatura_tipo_viatura`
    FOREIGN KEY (`tipo`)
    REFERENCES `hospitais`.`Tipo_viatura` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`Equipamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`Equipamento` (
  `numero_serie` INT NOT NULL,
  `descricao` VARCHAR(80) NOT NULL,
  `quantidade` INT NOT NULL,
  `tipo` VARCHAR(10) NOT NULL,
  `data_inspecao_anterior` DATE NULL,
  `data_inspecao_proxima` DATE NULL,
  `viatura` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`numero_serie`),
  UNIQUE INDEX `idEquipamento_UNIQUE` (`numero_serie` ASC) VISIBLE,
  INDEX `fk01_equipamento_tipo_equip_idx` (`tipo` ASC) VISIBLE,
  INDEX `fk02_equipamento_viatura_idx` (`viatura` ASC) VISIBLE,
  CONSTRAINT `fk01_equipamento_tipo_equip`
    FOREIGN KEY (`tipo`)
    REFERENCES `hospitais`.`Tipo_equipamento` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk02_equipamento_viatura`
    FOREIGN KEY (`viatura`)
    REFERENCES `hospitais`.`Viatura` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`Categoria` (
  `idCategoria` VARCHAR(10) NOT NULL,
  `descricao` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE INDEX `idCategoria_UNIQUE` (`idCategoria` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`Profissionais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`Profissionais` (
  `nif` INT NOT NULL,
  `cc` INT NOT NULL,
  `cedula_profissional` INT NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `morada` VARCHAR(80) NOT NULL,
  `cod_postal` VARCHAR(8) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `categoria` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`nif`),
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC) VISIBLE,
  UNIQUE INDEX `cc_UNIQUE` (`cc` ASC) VISIBLE,
  UNIQUE INDEX `cedula_profissional_UNIQUE` (`cedula_profissional` ASC) VISIBLE,
  INDEX `fk01_profissionais_localidade_idx` (`cod_postal` ASC) VISIBLE,
  INDEX `fk02_profissionais_categoria_idx` (`categoria` ASC) VISIBLE,
  CONSTRAINT `fk01_profissionais_codigo_postal`
    FOREIGN KEY (`cod_postal`)
    REFERENCES `hospitais`.`Codigo_postal` (`codigo_postal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk02_profissionais_categoria`
    FOREIGN KEY (`categoria`)
    REFERENCES `hospitais`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`Pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`Pacientes` (
  `idpaciente` INT NOT NULL AUTO_INCREMENT,
  `cc` INT NULL,
  `nif` INT NULL,
  `nome` VARCHAR(80) NULL,
  `morada` VARCHAR(80) NULL,
  `cod_postal` VARCHAR(8) NULL,
  `data_nascimento` DATE NULL,
  PRIMARY KEY (`idpaciente`),
  UNIQUE INDEX `nif_UNIQUE` (`idpaciente` ASC) VISIBLE,
  UNIQUE INDEX `cc_UNIQUE` (`cc` ASC) VISIBLE,
  INDEX `fk01_profissionais_localidade_idx` (`cod_postal` ASC) VISIBLE,
  UNIQUE INDEX `idpaciente_UNIQUE` (`nif` ASC) VISIBLE,
  CONSTRAINT `fk01_pacientes_codigo_postal`
    FOREIGN KEY (`cod_postal`)
    REFERENCES `hospitais`.`Codigo_postal` (`codigo_postal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`Tipo_missao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`Tipo_missao` (
  `idtipo` VARCHAR(10) NOT NULL,
  `tipo` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idtipo`),
  UNIQUE INDEX `idtipo_UNIQUE` (`idtipo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`Missao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`Missao` (
  `id_missao` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(10) NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  `viatura` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id_missao`),
  UNIQUE INDEX `id_missao_UNIQUE` (`id_missao` ASC) VISIBLE,
  INDEX `fk01_missao_tipo_idx` (`tipo` ASC) VISIBLE,
  INDEX `fk02_missao_viatura_idx` (`viatura` ASC) VISIBLE,
  CONSTRAINT `fk01_missao_tipo`
    FOREIGN KEY (`tipo`)
    REFERENCES `hospitais`.`Tipo_missao` (`idtipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk02_missao_viatura`
    FOREIGN KEY (`viatura`)
    REFERENCES `hospitais`.`Viatura` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`Pertence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`Pertence` (
  `data_hora_inicio` DATETIME NOT NULL,
  `missao` INT NOT NULL,
  `profissional` INT NOT NULL,
  `data_hora_fim` DATETIME NULL,
  `ativo` TINYINT NOT NULL,
  PRIMARY KEY (`data_hora_inicio`, `missao`, `profissional`),
  INDEX `fk02_pertence_profissional_idx` (`profissional` ASC) VISIBLE,
  INDEX `fk01_pertence_missao_idx` (`missao` ASC) VISIBLE,
  CONSTRAINT `fk02_pertence_profissional`
    FOREIGN KEY (`profissional`)
    REFERENCES `hospitais`.`Profissionais` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk01_pertence_missao`
    FOREIGN KEY (`missao`)
    REFERENCES `hospitais`.`Missao` (`id_missao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`Assistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`Assistencia` (
  `data_hora_assist` DATETIME NOT NULL,
  `missao` INT NOT NULL,
  `paciente` INT NOT NULL,
  PRIMARY KEY (`data_hora_assist`, `paciente`, `missao`),
  INDEX `fk01_assistencia_missao_idx` (`missao` ASC) VISIBLE,
  INDEX `fk02_assistencia_paciente_idx` (`paciente` ASC) VISIBLE,
  CONSTRAINT `fk01_assistencia_missao`
    FOREIGN KEY (`missao`)
    REFERENCES `hospitais`.`Missao` (`id_missao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk02_assistencia_paciente`
    FOREIGN KEY (`paciente`)
    REFERENCES `hospitais`.`Pacientes` (`idpaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitais`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitais`.`Telefone` (
  `telefone` INT NOT NULL,
  `epcs` INT NULL,
  `profissional` INT NULL,
  `paciente` INT NULL,
  INDEX `fk01_epcs_telefone_epcs_idx` (`epcs` ASC) VISIBLE,
  PRIMARY KEY (`telefone`),
  INDEX `fk02_telefone_profissionais_idx` (`profissional` ASC) VISIBLE,
  INDEX `fk03_telefone_pacientes_idx` (`paciente` ASC) VISIBLE,
  CONSTRAINT `fk01_telefone_epcs`
    FOREIGN KEY (`epcs`)
    REFERENCES `hospitais`.`EPCS` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk02_telefone_profissionais`
    FOREIGN KEY (`profissional`)
    REFERENCES `hospitais`.`Profissionais` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk03_telefone_pacientes`
    FOREIGN KEY (`paciente`)
    REFERENCES `hospitais`.`Pacientes` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
