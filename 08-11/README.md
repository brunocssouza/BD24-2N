# BD-Corra

# Descrição
Esse é um banco de dados com o objetivo de armazenar dados sobre o filme Corra (2017).

# Estrutura do Banco de Dados
Esse banco de dados possui 5 relações. 

**Tabela:** 
contexto_sociocultural

**Descrição:** Armazena a descrição do contexto cultural em que cada família está inserida.

**Colunas:**
- **origem**: Identifica a condição econômica do personagem. 
- **classe_social**: A posição econômica do personagem/família na sociedade. 
- **crenca**: Religião seguida pelo personagem/família. 
- **fk_familia_familia_id**: Chave estrangeira da tabela família. 
- **fk_personagem_personagem_id**: Chave estrangeira da tabela personagem.

___
**Tabela:** tratamento 

**Descrição:** Tratamento aplicado pela família á um personagem. 

**Colunas:** 
- **tratamento_id**: Identificador únio do tratamento. 
- **tratamento_nome**: Nome da etapa do tratamento. 
- **descricao**: Descrição da etapa do tratamento aplicado por um membro da família a um personagem.

___
**Tabela:** familia

**Descrição:** Usada para inserir uma família do filme.

**Colunas:**
- **familia_id**: Identificador único família. 
- **familia_nome**: Sobrenome da família do personagem.

___
**Tabela:** personagem 

**Descrição:** Utilizada para inserir os dados dos personagens.
 
**Colunas:** 
- **personagem_id**: Identificador único do personagem. 
- **personagem_nome**: Primeiro nome do personagem. 
- **etnia**: Para classificar a etnia do personagem. 
- **genero**: Identificador do gênero do personagem. 
- **fk_tratamento_tratamento_id**: Chave estrangeira do tratamento aplicado no personagem, podendo ou não ser nulo.

___
**Tabela:** MembroFamilia 

**Descrição:** Identifica os membros de determinada família. 

**Colunas:** 
- **estado_psicologico**: Identifica se o personagem é controlador ou espectador. 
- **fk_personagem_personagem_id**: Chave estrangeira usada para identificar o personagem. 
- **fk_familia_familia_id**: Chave estrangeira para identificar a família a qual o personagem pertence.

# Diagrama ER
<img src=".\ER-Logico.png">

# Instruções de Configuração
## 1. Instale o SGBD:
PostgreSQL: [Download](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)
## 2. Crie o banco de dados
```SQL
CREATE DATABASE FilmeCorraExport
```

# Licença
MIT License
