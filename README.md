# Quiz App - Application Multi-conteneurs

Application web de quiz conteneurisée avec Docker Compose utilisant PostgreSQL, Express.js et Nginx.

## Installation

### 1. Cloner le projet
```bash
git clone https://github.com/FabLrc/quiz-app.git
cd quiz-app
```

### 2. Configuration des variables d'environnement

Copier le contenu du fichier .env.example pour créer le fichier .env

### 3. Lancer l'application

Build et démarrage des conteneurs en mode détaché:
```bash
docker compose up --build -d
```

## Commandes utiles

### Vérifier l'état des services
```bash
docker compose ps
```

### Consulter les logs
```bash
# Tous les services
docker compose logs

# Service spécifique
docker compose logs db
docker compose logs backend
docker compose logs frontend
```

### Arrêter l'application
```bash
# Arrêter les conteneurs
docker compose down

# Arrêter et supprimer les volumes
docker compose down -v
```

### Redémarrer l'application
```bash
docker compose restart
```

## Tests

### Accéder à l'application
Ouvrir dans un navigateur: `http://localhost:8087`

### Tester le health check
```bash
curl http://localhost:8087/health
```
Réponse attendue: `{"status":"ok"}`

### Tester la page d'accueil
```bash
curl http://localhost:8087
```

### Tester la page admin
```bash
curl http://localhost:8087/gestion-quiz
```

## Persistance des données

Les données PostgreSQL sont stockées dans un volume Docker nommé `postgres_data`.

### Lister les volumes
```bash
docker volume ls
```

### Inspecter le volume PostgreSQL
```bash
docker volume inspect quiz-app_postgres_data
```

### Test de persistance
```bash
# Arrêter les conteneurs sans supprimer les volumes
docker compose down

# Redémarrer
docker compose up -d
