from bs4 import BeautifulSoup
import requests
import utilitarios as ut
from zipfile import ZipFile

def compactaAnexo():
    url = 'https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos'


    pagina = requests.get(url)
    dadosPag = BeautifulSoup(pagina.text, 'html.parser')


    linkPdf = []
    for link in dadosPag.find_all('a', href=True):
        if link['href'].endswith('.pdf') and "Anexo" in link['href']:
            linkPdf.append(link['href'])

    with ZipFile("Anexos.zip", "w") as zip:
        for pdf in linkPdf:
            linkArq = pdf.split("/")[-1]
            
            nomeArq = "_".join(linkArq.split("_")[0:2])+ ".pdf" #lógica para salvar o arquivo em sua forma curta.EX: Anexo I 

            downloadPdf = requests.get(pdf)

            with open(linkArq, "wb") as temp:
                temp.write(downloadPdf.content)

            zip.write(linkArq, nomeArq)

            ut.removeArquivo(linkArq)


compactaAnexo()