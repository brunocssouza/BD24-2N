# BD-Corra

# Descrição
Esse é um banco de dados com o objetivo de armazenar dados sobre o filme Corra (2017).

# Estrutura do Banco de Dados
Esse banco de dados possui 5 relações. 

**Tabela:** contexto_sociocultural

**Descrição:** Armazena a descrição do contexto cultural em que cada família está inserida.

**Colunas:**
- **origem**: Determina as condições do local de origem do personagem.
- **classe_social**: A condição econômica do personagem/família na sociedade. 
- **crenca**: Religião seguida pelo personagem. 
- **fk_familia_familia_id**: Chave estrangeira com o objetivo de apontar à que femilia o personagem pertence. 
- **fk_personagem_personagem_id**: Chave estrangeira com o objetivo de apontar à que personagem está se referindo.

___
**Tabela:** tratamento 

**Descrição:** Fases do tratamento aplicado pela família á um personagem. 

**Colunas:** 
- **tratamento_id**: Identificador único das fases do tratamento. 
- **tratamento_nome**: Nome da fase do tratamento.
- **descricao**: Descrição da fase do tratamento.

___
**Tabela:** familia

**Descrição:** Armazena as famílias do filme.

**Colunas:**
- **familia_id**: Identificador único da família. 
- **familia_nome**: Sobrenome da família.

___
**Tabela:** personagem

**Descrição:** Armazena os dados de personagens atuantes.
 
**Colunas:** 
- **personagem_id**: Identificador único do personagem.
- **personagem_nome**: Primeiro nome do personagem. 
- **etnia**: Etnía do personagem.
- **genero**: Gênero do personagem.
- **fk_tratamento_tratamento_id**: Chave estrangeira da fase do tratamento aplicado no personagem (considere nulo caso o sujeito não esteja sob o tratamento).

___
**Tabela:** membrofamilia 

**Descrição:** Relaciona personagens com suas respectivas famílias e estados mentais. 

**Colunas:** 
- **estado_psicologico**: Identifica o estado mental do personagem (Controlador, Espectador ou Normal).
- **fk_personagem_personagem_id**: Chave estrangeira usada para identificar o personagem. 
- **fk_familia_familia_id**: Chave estrangeira para identificar a família à qual o personagem faz parte.

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
