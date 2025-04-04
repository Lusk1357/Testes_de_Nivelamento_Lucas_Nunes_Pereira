-- leia o arquivo requirequirements.txt antes de executar
USE Relatorios;

-- importação de dados para a tabela relatorio_cadop
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Relatorio_cadop.csv'
INTO TABLE relatorio_cadop
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Registro_ANS,CNPJ,Razao_Social,Nome_Fantasia,Modalidade,Logradouro,Numero,Complemento,Bairro,Cidade,UF,
CEP,DDD,@telefone,Fax,Endereco_eletronico,Representante,Cargo_Representante,Regiao_de_Comercializacao,@Data_Registro_ANS)
SET 
	Telefone = IF(LENGTH(@telefone) > 12, NULL, @telefone);
	
-- desabilitação de algumas verifiações, bucando uma melhor performance
SET FOREIGN_KEY_CHECKS = 0;
SET UNIQUE_CHECKS = 0;
SET AUTOCOMMIT = 0;
SET sql_log_bin = 0;


-- importação de dados para a tabela demonstracoes_contabeis

--2023
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2023/1T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, 
  @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  ano = 2023,
  trimestre = 1,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2023/2t2023.csv' 
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, 
  @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  ano = 2023,
  trimestre = 2,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2023/3T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, 
  @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  ano = 2023,
  trimestre = 3,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2023/4T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(@DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, 
  @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  ano = 2023,
  trimestre = 4,
  DATA = STR_TO_DATE(@DATA, '%d/%m/%Y'), 
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
  
--2024
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2024/1T2024.csv' 
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, 
  @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  ano = 2024,
  trimestre = 1,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2024/2T2024.csv'  
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, 
  @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  ano = 2024,
  trimestre = 2,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2024/3T2024.csv' 
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, 
  @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  ano = 2024,
  trimestre = 3,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2024/4T2024.csv' 
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, 
  @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
  ano = 2024,
  trimestre = 4,
  VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
  VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
  

-- Habilitação das verficações, após execução do codigo
SET FOREIGN_KEY_CHECKS = 1;
SET UNIQUE_CHECKS = 1;
SET AUTOCOMMIT = 1;
SET sql_log_bin = 1;
