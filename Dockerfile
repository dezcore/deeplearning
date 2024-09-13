FROM python:3-slim

WORKDIR /app

# Installer les dépendances nécessaires pour compiler des paquets Python
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    pkg-config \
    libhdf5-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copier les fichiers de dépendances
COPY requirements.txt .
# Installer les dépendances
#RUN python -m pip install -r requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

#Copier le code de l'application
COPY . .

# Exposer les ports 8080 pour Flask et 8888 pour Jupyter
EXPOSE 8080
EXPOSE 8888

# Définir la commande par défaut
#CMD ["python", "app.py"]
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

