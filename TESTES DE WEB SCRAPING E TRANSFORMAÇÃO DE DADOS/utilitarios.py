import os
from zipfile import ZipFile

def descompactaAnexo(nomePasta="Anexos.zip", nomeArquivo="Anexo_I.pdf"):
    with ZipFile(nomePasta, "r") as zip:
        zip.extract(nomeArquivo)

def verificaArquivo(nomeArquivo):
    return os.path.exists(nomeArquivo)

def removeArquivo(nomeArquivo):
    return os.remove(nomeArquivo)