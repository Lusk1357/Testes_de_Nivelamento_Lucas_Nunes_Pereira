CREATE DATABASE IF NOT EXISTS Relatorios 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE Relatorios;


CREATE TABLE IF NOT EXISTS `Relatorios`.`Relatorio_cadop` (
  `Registro_ANS` VARCHAR(6) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' NOT NULL,
  `CNPJ` CHAR(18) NOT NULL,
  `Razao_Social` VARCHAR(255) NOT NULL,
  `Nome_Fantasia` VARCHAR(255) NULL,
  `Modalidade` VARCHAR(50) NOT NULL,
  `Logradouro` VARCHAR(255) NOT NULL,
  `Numero` VARCHAR(20) NOT NULL,
  `Complemento` VARCHAR(150) NULL,
  `Bairro` VARCHAR(50) NOT NULL,
  `Cidade` VARCHAR(50) NOT NULL,
  `UF` CHAR(2) NOT NULL,
  `CEP` VARCHAR(9) NOT NULL,
  `DDD` CHAR(2) NULL,
  `Telefone` VARCHAR(150) NULL,
  `Fax` VARCHAR(11) NULL,
  `Endereco_eletronico` VARCHAR(100) NULL,
  `Representante` VARCHAR(255) NOT NULL,
  `Cargo_Representante` VARCHAR(100) NOT NULL,
  `Regiao_de_Comercializacao` CHAR(1) NULL,
  `Data_Registro_ANS` DATE NOT NULL,
  PRIMARY KEY (`Registro_ANS`),
  UNIQUE INDEX `Registro_ANS_UNIQUE` (`Registro_ANS` ASC) VISIBLE,
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE
)ENGINE = InnoDB;

-- Adição dos campos ANO e Trimestre para uma melhor organização do banco e consultas precisas.
CREATE TABLE IF NOT EXISTS `Relatorios`.`demonstracoes_contabeis` (
  `ANO` INT NOT NULL,  
  `TRIMESTRE` INT NOT NULL,  
  `DATA` DATE NOT NULL,
  `REG_ANS` BIGINT NOT NULL,
  `CD_CONTA_CONTABIL` BIGINT NOT NULL,
  `DESCRICAO` VARCHAR(255) NOT NULL,
  `VL_SALDO_INICIAL` DECIMAL(15,2) NOT NULL,
  `VL_SALDO_FINAL` DECIMAL(15,2) NOT NULL
) ENGINE = InnoDB;