# Imagem base Python
FROM python:3.12-slim

# Variáveis de ambiente para evitar mensagens de buffer e etc
ENV PYTHONUNBUFFERED=1

# Diretório do projeto dentro do container
WORKDIR /app

# Instalar dependências do sistema necessárias (se precisar)
RUN apt-get update && apt-get install -y curl build-essential

# Instalar Poetry via instalador oficial e colocar no PATH
RUN curl -sSL https://install.python-poetry.org | python3 - && \
    ln -s /root/.local/bin/poetry /usr/local/bin/poetry

# Copiar arquivos do projeto (incluindo pyproject.toml e poetry.lock)
COPY pyproject.toml poetry.lock* /app/

# Desabilitar criação de virtualenvs no Poetry dentro do container (usa ambiente do container)
RUN poetry config virtualenvs.create false

# Instalar as dependências do projeto
RUN poetry install --no-root --no-interaction --no-ansi

# Copiar o restante do código do projeto
COPY . /app/

# Comando padrão para rodar (ajuste conforme seu projeto)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
