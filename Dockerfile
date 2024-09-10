FROM python:3-slim

WORKDIR /app

# Copier les fichiers de dépendances
COPY requirements.txt .
# Installer les dépendances
RUN python -m pip install -r requirements.txt

#Copier le code de l'application
COPY . .

# Exposer le port si nécessaire (optionnel)
EXPOSE 8080

# Définir la commande par défaut
CMD ["python", "app.py"]

