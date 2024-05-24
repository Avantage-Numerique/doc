tag : #documentation_technique 

## Objectifs


## [[Brainstorm]] pour Backups-2e-source
On doit avoir des backups minimum quotidien sur X jours du data.
Et presque idem des utilisateurs.

script qui fait un mongo dump de data à une fréquence X. avec un nom de fichiers détails.

Ajouter la tache de backups avant un nouveau build (supervisord).

2 pistes pour schedule les tâches
https://stackoverflow.com/questions/27341846/using-supervisor-as-cron#27463377

via cron qui part une tâche supervisord
Ou via supervisord qui fait tout le travail de timing pour rouler sa tâche.

Plus d'information sur la version supervisord 100% : https://serverfault.com/questions/608804/how-can-i-configure-supervisord-managed-program-to-wait-x-secs-before-attemting

Write a shell pour les crons sans autre configuration : 
https://stackoverflow.com/questions/37245540/how-can-i-backup-mongodb-database-regularly-the-specific-time-of-a-day

exemple de script : https://github.com/micahwedemeyer/automongobackup/blob/master/src/automongobackup.sh

avec Node
https://dev.to/yasseryka/how-to-backup-mongodb-every-night-in-nodejs-257o

C'est pas mal comme ça en ce moment en dormance dans l'API.

https://www.mongodb.com/docs/database-tools/mongodump/mongodump-compatibility-and-installation/

## [[Conception]] pour Backups-2e-source

Test avec le setup inapp (typescript).
Fait un standalone app pour les cron jobs
call le fichier avec : 
`30 6 1 * * /usr/local/bin/node /home/steve/example/script.js`


 System needs
 - Mongotools installed
 - Env file config.

Configuration : 
- backup db credentials (from).
- Path local of backups.
- Frequency overtime paramétrable

Fréquences :
- Ajouter aux jobs pour controller la fréquences ?
- Ajouter plus dans les crons jobs du serveur ?
	- Avec supervisor ? les deux ?
- Donc il faut que ce soit supervisord / cronjobs callable.

## Structure

```javascript

```

### Exemple

```javascript

```


## Todo


## Planifié
