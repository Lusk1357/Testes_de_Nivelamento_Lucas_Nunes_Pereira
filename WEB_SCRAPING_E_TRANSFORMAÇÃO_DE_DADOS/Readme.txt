PROJETO DE EXTRAÇÃO DE DADOS DA ANS
===================================

DESCRIÇÃO:
----------
Script Python que automatiza:
- Download dos Anexos em PDF do site da ANS
- Extração de tabelas dos PDFs
- Conversão para arquivos CSV

PRÉ-REQUISITOS:
---------------
- Python 3.8 ou superior
- Pip instalado e configurado

COMO USAR:
----------
1. Abra o Prompt de Comando (CMD) como administrador
2. Navegue até a pasta do projeto:
   > cd "caminho_completo\Testes_de_Nivelamento_Lucas_Nunes_Pereira\TESTES DE WEB SCRAPING E TRANSFORMAÇÃO DE DADOS"
3. Instale as dependências:
   > pip install -r requirements.txt
4. Execute o script principal:
   > python main.py

ESTRUTURA DO PROJETO:
--------------------
- main.py          (Script principal)
- utilitarios.py  (Funções auxiliares)
- compactaAnexo.py (Download dos PDFs)
- criaCsv.py      (Conversão PDF→CSV)
- requirements.txt (Dependências)

DEPENDÊNCIAS:
-------------
Todas as bibliotecas necessárias estão listadas no arquivo requirements.txt