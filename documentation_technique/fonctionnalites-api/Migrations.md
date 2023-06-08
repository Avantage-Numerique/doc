# Ajout de migration dans L'API
tag : #documentation_technique 

## Objectifs
Permettre d'avoir une version contrôlé de l'État de la BD.
Permettre de gérer le changement dans les schemas sans devoir tout refaire la bd.
Permettre se suivre les données persistantes dans la BD.

## [[Brainstorm]] pour Migrations
On a besoin d'un CLI pour appliquer et gérer les migration.
On commencer par recherche les packages existante afin de voir si on a un fit parfait. C'est pas une implémentation Alien, nos besoins sont partagé par d'autres.

### Recherche d'outils de migration
- [Mongodb migrate ts](https://www.npmjs.com/package/mongo-migrate-ts) il est nice, mais trop opiniatré selon moi. Je n'ai pas réussi à bypasser la connection au db pour ajouter notre driver mongoose.
- [Ts mongoose migrate](https://github.com/ilovepixelart/ts-migrate-mongoose)
  Quand même bien fait, comme j'aimerais l'implémenté, mais le package est pas super supporté.
- [Node-migrate](https://www.npmjs.com/package/migrate) : parfait, il gère la base et on peut build-up par dessus. Mais il est en js. Et tout notre codebase est en typescript. C'est possible de l'utiliser avec typescript, mais ça nécessiste des commandes trop "laite" à chaque migration, avec plein de flag à ajouter pour notre compiler typescript.

### Non implémenté : Idée Design per domain
On peut ajouter des configs selon plusieurs paths. 
On pourrait gérer les migrations par domaine dans l'API.
Par exemple, on a Les Users avec leurs migrations, on peut gérer le up et down en cherry picked tout les domaine.
Le problème c'est que ça va probablement prendre une gestions global. Pour éviter d'avoir à aller dans chacun des domaines pour faire une migration.
Avec cette exemple : 
```shell
$ migrate-mongo status -f '~/configs/albums-migrations.js'
┌─────────────────────────────────────────┬────────────┐
│ Filename                                │ Applied At │
├─────────────────────────────────────────┼────────────┤
│ 20160608155948-blacklist_the_beatles.js │ PENDING    │
```

Il faut que le cli gère par lui même selon notre env : dev/prod pour les migrations.

## Documentation 
### Tutoriels
- https://www.softwareontheroad.com/database-migration-node-mongo/

## [[Conception]] pour Migrations

1. Création du path CLI pour recevoir des fonctionnalités de gestions sur l'API avec le cli
	1. Permettre d'utiliser les providers, models, service.
	2. Choisir un package pour avoir accès à la migration en mode local au min.
2. CLI : migrate ex : `npx migrate up`
	1. Lance la mise à jour de la migration pour que toutes les migrations marqué comme `down` soit mis à `up`
3. Ajouter des migrations
	1. Ajouter une commande pour permettre de créer un fichier de migration facile à implémenter
	2. Créer un fichier de migration dans le bon path ex : `npx migrate create NomDuFichierDeLaMigration`
4. Exécuter les migrations
	1. Permettre à l'appel des migrations à la demande.
	2. Vérification des migrations au départ de l'API
	3. Vérification et appel des migrations dans le code de l'API ?


## Structure
Le projet a besoin d'un fichier `.swcrc` pour établir le même contexte que dans le projet avec les `path` tout inclus dans le `tsconfig`.

### Pour appliquer les migration manuellement
1. S'assurer que votre fichier `.env` contient les variables pour les migrations (voir le `.env_exemple`)
2. S'assurer que votre container est à jour avec les dernier dockerfile, package.json et autre fichier.

#### Pour appliquer toute les migrations mises à `down`
```shell
# dans le path de l'api sur votre PC, pas dans docker.
npx migrate up 
```

#### Pour revenir en arrière toute les migrations mises à `up`
```shell
# dans le path de l'api sur votre PC, pas dans docker.
npx migrate down 
```

#### Pour ajouter un fichier de migration
Ceci ajoutera un fichier dans votre path de l'API et sera ajouter à la prochaine fois que vous faite migrate up.
```shell
# dans le path de l'api sur votre PC, pas dans docker.
npx migrate create nom-du-fichier
```

Le Template utilisé permet d'utiliser les provider comme dans l'API.
Il est situé, dans le path de l'api,  `@database/Migrations/MigrationTemplate.ts`

## Todo
Ajouter un exemple de changement de schema dans une migration.


## Planifié
