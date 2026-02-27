# Usamos tu imagen de Docker Hub que ya tiene todo lo difícil instalado
FROM vivianherreraaduviri/forense:latest

# Instalamos lo necesario para que sea un servidor de internet
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Copiamos tu código de API al contenedor
COPY app.py /app/app.py

# Exponemos el puerto donde escuchará el servidor
EXPOSE 8000

# Comando para arrancar el servidor permanentemente
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
