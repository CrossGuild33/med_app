
# 🏥 MedApp

Aplicação para cadastro de profissionais da saúde e gerenciamento de atendimentos, com proposta de integração de split de pagamento usando a API da Asaas.

---

## 🚀 Setup do Ambiente

### 🔧 Local (sem Docker)

1. **Clone o repositório:**

```bash
git clone https://github.com/seu-usuario/med_app.git
cd med_app
```

2. **Crie o ambiente virtual:**

```bash
python -m venv venv
source venv/bin/activate   # Linux/Mac
venv\Scripts\activate      # Windows
```

3. **Instale as dependências:**

```bash
pip install -r requirements.txt
```

4. **Configure o arquivo `.env`:**

```env
SECRET_KEY=seu_secret_key
DEBUG=True
DB_NAME=medapp_db
DB_USER=meduser
DB_PASSWORD=senha
DB_HOST=localhost
DB_PORT=5432
```

5. **Execute as migrações:**

```bash
python manage.py migrate
```

6. **Rode o servidor:**

```bash
python manage.py runserver
```

---

### 🐳 Usando Docker

1. **Build e start:**

```bash
docker-compose up --build
```

2. **Acesse:**

- API: [http://localhost:8000](http://localhost:8000)
- Admin: [http://localhost:8000/admin](http://localhost:8000/admin)

---

## 🧪 Rodando os Testes

O projeto utiliza `APITestCase` do Django Rest Framework.

Execute os testes localmente:

```bash
python manage.py test
```

Ou via Docker:

```bash
docker-compose exec web python manage.py test
```

---

## 🏗️ Decisões Técnicas

- **Framework:** Django + Django Rest Framework  
- **Banco de Dados:** PostgreSQL (local e RDS AWS no deploy)  
- **Containerização:** Docker e Docker Compose  
- **CI/CD:** GitHub Actions (build, testes e deploy automatizado)  
- **Deploy:** AWS (EC2 e RDS)  
- **Pagamentos:** Proposta de integração com API da Asaas (split de pagamento)  

---

## 🔗 API Endpoints

| Verbo | Endpoint                     | Descrição               |
|-------|-------------------------------|-------------------------|
| GET   | `/profissionais/`             | Lista profissionais     |
| POST  | `/profissionais/`             | Cria profissional       |
| GET   | `/profissionais/{id}/`        | Detalhes de profissional|
| PUT   | `/profissionais/{id}/`        | Atualiza profissional   |
| DELETE| `/profissionais/{id}/`        | Remove profissional     |

✔️ **Todos os retornos estão em JSON.**

---

## ☁️ Deploy na AWS

- 🔹 **Ambiente de Staging:** Instância EC2 (Ubuntu) + Docker + PostgreSQL RDS  
- 🔹 **Ambiente de Produção:** EC2 + RDS + CloudWatch (logs)  

### 🔧 Ferramentas Utilizadas:

- EC2 (máquina virtual)  
- RDS (banco de dados gerenciado)  
- GitHub Actions (pipeline CI/CD)  

### 🔄 Fluxo de Deploy (CI/CD):

1. Push no branch `main` dispara pipeline.  
2. Pipeline executa:
   - Build da aplicação
   - Testes automatizados
   - Deploy na EC2 via SSH + Docker Compose
3. Logs monitorados via AWS CloudWatch.
