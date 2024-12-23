## Passo a Passo para Configuração do Projeto

### 1. Instalação do Projeto

#### **Aplicação Web**  
1. Navegue até o diretório: `QAx/apps/smartbit/web`.  
2. Instale as dependências executando:  
   ```bash
   npm install
   ```

#### **API**  
1. Navegue até o diretório: `QAx/apps/smartbit/api`.  
2. Instale as dependências executando:  
   ```bash
   npm install
   ```

---

### 2. Configuração do Banco de Dados  
Antes de iniciar as aplicações, configure o arquivo `.env` da API:  

1. Localize o arquivo `.env` no diretório `api`.  
2. Preencha as informações relacionadas ao banco de dados:  
   ```dotenv
   # Configurações básicas
   APP_URL=http://localhost
   PORT=3333
   FRONT_URL=http://localhost:3000
   NODE_ENV=development
   APP_NAME=smartbit-api

   # Configurações do Banco de Dados
   DB_DIALECT=postgres
   DB_HOST=<seu-host-do-banco>
   DB_NAME=<nome-do-banco>
   DB_USER=<usuario-do-banco>
   DB_PASS=<senha-do-banco>
   DB_PORT=5432

   # Não mexer aqui
   SENTRY_DSN=https://082d3f7d464a40ac8a9d0b1be0bbb54a@o4505329693753344.ingest.sentry.io/4505329695391744
   ```
   > **Nota**: Substitua `<seu-host-do-banco>`, `<nome-do-banco>`, `<usuario-do-banco>`, `<senha-do-banco>` pelas informações do seu banco de dados.  

3. Certifique-se de que o banco de dados está configurado e acessível.

---

### 3. Executando a Aplicação

#### **Para rodar a aplicação Web:**  
1. Navegue até o diretório: `QAx/apps/smartbit/web`.  
2. Execute o comando:  
   ```bash
   npm run dev
   ```

#### **Para rodar a API:**  
1. Navegue até o diretório: `QAx/apps/smartbit/api`.  
2. Execute o comando:  
   ```bash
   npm run dev
   ```

---

### Rotas da Aplicação
- **Web**: Interface visual para interação com a aplicação.  
- **API**: Backend responsável pelo processamento de dados e comunicação com o banco de dados.  

---
