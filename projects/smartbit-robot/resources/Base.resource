*** Settings ***
Documentation        Arquivo principal do projeto Robot

Library        Browser
Library        libs/Account.py
Library        libs/Database.py

Resource        pages/Landing.resource
Resource        pages/Welcome.resource
Resource        pages/Login.resource
Resource        pages/Accounts.resource

Resource        pages/Components/Toast.resource 
Resource        pages/Components/BoxNotice.resource

Resource        utils/html_capture.robot

*** Keywords ***
Start session
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000


# lib pip install -U psycopg2
# consegue conectar no banco de dados

# ./setup.sh - Reconstrói a estrutura de dados da aplicação

# pip install asyncpg - Instala o pacote asyncpg para trabalhar com PostgreSQL de forma assíncrona