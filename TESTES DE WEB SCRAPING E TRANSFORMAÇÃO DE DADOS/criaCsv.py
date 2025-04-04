from pdfplumber import open
import pandas as pd
from zipfile import ZipFile
import utilitarios as ut
import compactaAnexo as ca


def criaCsv(caminho, caminhoSaida):
    if not ut.verificaArquivo(caminho):

        if ut.verificaArquivo("Anexos.zip"):
            ut.descompactaAnexo()
        else:
            ca.compactaAnexo()
            ut.descompactaAnexo()

        dadosEx = []
        with open(caminho) as pdf:
            for pagina in pdf.pages:
                tabelas = pagina.extract_tables()
                for tabela in tabelas:
                    dadosEx += tabela[1:]  # ignora o cabeçalho de cada tabela
        
        df = pd.DataFrame(dadosEx, columns=[
            "PROCEDIMENTO", "RN (alteração)", "VIGÊNCIA", "Seg. Odontológica", 
            "Seg. Ambulatorial", "HCO", "HSO", "REF", "PAC", "DUT", 
            "SUBGRUPO", "GRUPO", "CAPÍTULO"
        ])
        
        
        df.to_csv(caminhoSaida, index=False, encoding='utf-8-sig')
        
        
        with ZipFile("Teste_Lucas_Nunes_Pereira.zip", "w") as zip:
            zip.write(caminhoSaida)
            
        ut.removeArquivo(caminho)
        ut.removeArquivo(caminhoSaida)


criaCsv("Anexo_I.pdf", "Anexo_I.csv")