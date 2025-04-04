PROJETO ANS - CONFIGURAÇÃO COMPLETA MYSQL 8.0
=============================================


1. CONFIGURAÇÃO DO MYSQL
------------------------
1.1 SUBSTITUIR ARQUIVO MY.INI:
   - Copie o arquivo "my.ini" fornecido
   - Navegue até: C:\ProgramData\MySQL\MySQL Server 8.0\
   - Cole e substitua o arquivo existente

1.2 SE A SUBSTITUIÇÃO FOR BLOQUEADA:
   - Abra o Gerenciador de Tarefas (Ctrl+Alt+Del)
   - Acesse a aba "Serviços"
   - Localize "MySQL80"
   - Botão direito → "Parar"
   - Agora substitua o arquivo my.ini
   - Reinicie o serviço "MySQL80"


2. PREPARAÇÃO DOS DADOS:
----------------------
2.1. ESTRUTURA DE PASTAS:
   - Crie manualmente se não existir:
     C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\

2.2 ARQUIVOS NECESSÁRIOS:
   - Descompacte "Dados.zip" diretamente em:
     C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\
   - Resultado final deve conter:
     Uploads/
     ├── Relatorio_cadop.csv
     ├── 2023/
     │   ├── 1T2023.csv
     │   ├── 2t2023.csv
     │   ├── 3T2023.csv
     │   └── 4T2023.csv
     └── 2024/
         ├── 1T2024.csv
         ├── 2T2024.csv
         ├── 3T2024.csv
         └── 4T2024.csv


3. EXECUÇÃO DAS QUERIES
-----------------------
ORDEM OBRIGATÓRIA:

1. Execute primeiro:
   3.3_criacao_banco_tabelas.sql

2. Em seguida:
   3.4_importacao_dados.sql
   

3. Por último:
   3.5_consultas_analiticas.sql.sql
