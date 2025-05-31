# Imagem base
FROM python:3.12-slim

# Diretório de trabalho
WORKDIR /code

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    libpq-dev gcc

# Instalar poetry
RUN pip install poetry

# Copiar arquivos
COPY . .

# Instalar dependências
RUN poetry config virtualenvs.create false && poetry install --no-root

# Comando para rodar o servidor
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
