from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
import pandas as pd
import numpy as np
from typing import Optional
import unicodedata as un
import uvicorn as uc

app = FastAPI()


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


def normalizaValor(texto):
    if not isinstance(texto, str):
        return ""
    texto = un.normalize("NFD", texto)
    texto = ''.join(c for c in texto if un.category(c) != 'Mn')
    return texto.lower().strip().replace(" ", "")


colunas = [
    'Registro_ANS', 'CNPJ', 'Razao_Social', 'Modalidade', 'Logradouro', 'Numero',
    'Bairro', 'Complemento', 'Cidade', 'UF', 'CEP', 'DDD', 'Telefone',
    'Endereco_eletronico', 'Representante'
]
df = pd.read_csv("servidor/Relatorio_cadop.csv", sep=";", usecols=colunas).replace({np.nan: None})

@app.get("/operadoras/")
def buscar_operadoras(
    registro_ans: Optional[str] = None,
    cnpj: Optional[str] = None,
    razao_social: Optional[str] = None,
    modalidade: Optional[str] = None,
    cidade: Optional[str] = None,
    uf: Optional[str] = None,
):
    try:
        resultado = df.copy()

        filtros = {
            "Registro_ANS": registro_ans,
            "CNPJ": cnpj,
            "Razao_Social": razao_social,
            "Modalidade": modalidade,
            "Cidade": cidade,
            "UF": uf,
        }

        for campo, valor in filtros.items():
            if valor:
                valor_limpo = normalizaValor(valor)
                resultado = resultado[
                    resultado[campo]
                    .fillna("")
                    .apply(lambda x: valor_limpo in normalizaValor(x))
                ]

        return {"operadoras": resultado.to_dict(orient="records")}

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    
if __name__ == "__main__":
    uc.run(app, host="0.0.0.0", port=8000)
