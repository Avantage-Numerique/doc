# Planification de tâche (scheduling)
tag : #documentation_technique 

## Objectifs
Permettre d'exécuter du code sur des périodes et à non à la demande d'un utilisateur.

## [[Brainstorm]] pour Planification de taches
On doit être en mesure d'ajouter des tâches et les synchroniser avec un facteur de temps comme des cronjobs

### recherche de packages
- node-schedule (basic runtine scheduling) choisi pour la verison 1
- Agenda (relié à mongo, concurence, + complet)

## [[Conception]] pour Planification de taches

- Trouver un package qui fait parfaitement 
	- Ou implémenter la fonctionnalité.
- On a choisi `node-schedule`
- On a implémenter un jobscheduler qui gère une couche par dessus node-schedule avec des feuilles de travail. Pour fait une couche abstraite pour la gestion réelle dans le runtine de l'API.

## Structure

```javascript

```

### Exemple

```javascript

```


## Todo


## Planifié
