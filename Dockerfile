# Use a imagem base do Python 3.10 slim
FROM python:3.10-slim

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo de requisitos para o diretório de trabalho
COPY crudPython-main/requirements.txt requirements.txt

# Instale as dependências especificadas no requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copie todos os arquivos do diretório crudPython-main para o diretório de trabalho no contêiner
COPY crudPython-main/ .

# Exponha a porta 5000 para fora do contêiner (se necessário)
EXPOSE 5000

# Defina a variável de ambiente FLASK_APP para app.py
ENV FLASK_APP=app.py

# Comando para executar o aplicativo Flask quando o contêiner for iniciado
CMD ["flask", "run", "--host=0.0.0.0"]
