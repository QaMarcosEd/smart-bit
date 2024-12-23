import asyncpg

async def delete_account_by_email(email):
    query = "DELETE FROM accounts WHERE email = $1;"  # Usando placeholder $1
    
    # Conectando ao banco de dados
    conn = await asyncpg.connect(
        host='ep-morning-shadow-a5tn3b9j.us-east-2.aws.neon.tech',  # Host do banco de dados
        database='smartbitdb',  # Nome do banco de dados
        user='smartbitdb_owner',  # Usuário do banco de dados
        password='OL8DmKce7YyW',  # Senha do banco de dados
        ssl='require'  # Conexão segura com SSL
    )
    
    # Executando a query, passando o e-mail como parâmetro
    await conn.execute(query, email)
    
    # Fechando a conexão
    await conn.close()
