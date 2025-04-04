
# Consulta de Operadoras Ativas na ANS

Este projeto consiste em um frontend construído com Vue 3 (utilizando Vite) e um backend em Python com FastAPI. O objetivo é permitir buscas por operadoras ativas cadastradas na ANS.

---

## ✅ Requisitos

- Node.js (versão 16 ou superior)
- Python 3.9+
- pip (gerenciador de pacotes Python)

---

## 🔧 Instalação e Execução do Frontend (Vue + Vite)

1. Acesse a pasta do frontend:

   cd vue_operadoras_ativas

2. Instale as dependências:

   npm install

3. Execute o servidor de desenvolvimento:

   npm run dev

4. Acesse o frontend no navegador:

   http://localhost:5173

---

## 🚀 Instalação e Execução do Backend (FastAPI)

1. Crie um ambiente virtual (opcional, mas recomendado):

   python -m venv venv
   source venv/bin/activate  # Linux/macOS
   venv\Scripts\activate     # Windows

2. Instale as dependências do backend:

   pip install fastapi uvicorn pandas

3. Execute o servidor:

   uvicorn main:app --reload

   Isso irá rodar o backend na porta padrão:
   http://localhost:8000

---

## 🌐 Conexão Frontend <-> Backend

O Vite já está configurado para fazer proxy de requisições para o backend.

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

## 📁 Estrutura de Arquivos (Frontend)

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

## 📝 Observações

- O Bootstrap já está instalado via npm e importado em main.js
- O Vue Router está configurado e deve funcionar corretamente ao navegar entre rotas
- Certifique-se de que App.vue contenha <router-view /> para exibir as rotas

---

Lucas Nunes Pereira
Projeto de Nívelamento - Consulta de Operadoras ANS
