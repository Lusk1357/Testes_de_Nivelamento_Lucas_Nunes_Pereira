# PROJETO DE CONSULTA E EXTRAÇÃO DE DADOS DA ANS

===================================
1. CONSULTA DE OPERADORAS ATIVAS (Frontend + Backend)
===================================

Frontend construído com Vue 3 (utilizando Vite) e um backend em Python com FastAPI.
O objetivo é permitir buscas por operadoras ativas cadastradas na ANS.

---

- Node.js (versão 16 ou superior)
- Python 3.9+
- pip (gerenciador de pacotes Python)

---

INSTALAÇÃO E EXECUÇÃO DO FRONTEND (Vue + Vite):

1. Acesse a pasta do frontend:

   cd vue_operadoras_ativas

2. Instale as dependências:

   npm install

3. Execute o servidor de desenvolvimento:

   npm run dev

4. Acesse no navegador:

   http://localhost:5173

---

INSTALAÇÃO E EXECUÇÃO DO BACKEND (FastAPI):

1. Acesse a pasta `API`:

   cd API

2. Instale as dependências:

   pip install -r requirements.txt

3. Execute o servidor FastAPI:

   uvicorn servidor:app --host 0.0.0.0 --port 8000

   A API estará disponível em:
   http://localhost:8000

---
Conexão do Frontend com Backend

No arquivo vite.config.js:

server: {
  proxy: {
    '/api': {
      target: 'http://localhost:8000',
      changeOrigin: true,
      rewrite: (path) => path.replace(/^\/api/, '')
    }
  }
}

Exemplo de chamada para o backend via fetch ou axios:

GET /api/operadoras?cnpj=12345678

---

Estrutura de Arquivos (Frontend)

src/
├── components/
│   ├── filtroOperadoras.vue
│   ├── tabelaOperadoras.vue
│   └── mainOperadoras.vue
├── router/
│   └── index.js
├── App.vue
├── main.js
├── assets/
│   └── styles.css

---

Observações

- O Bootstrap já está instalado via npm e importado em main.js
- O Vue Router está configurado e deve funcionar corretamente ao navegar entre rotas
- Certifique-se de que App.vue contenha <router-view /> para exibir as rotas
