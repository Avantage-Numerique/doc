# Versionnage Sémantique
Nous allons continuer dans le système de version sémantique. Il est largement utiliser dans plusieuers type de logiciels et surtout dans les API.
## Il consiste à ces 3 segement :

`Majeure`. `Mineure`.`Ajustement`

- **Majeure** : Augmenté lorsque vous faites des changements incompatibles dans l'API.
- **Mineure** : Augmenté lorsque vous ajoutez des fonctionnalités de manière rétrocompatible.
- **Ajustement** : Augmenté lorsque que des corrections de bugs de manière rétrocompatible sont faite.

### Par exemple
- **1.0.0** : Première version en ligne.
- **1.1.0** : Ajout d'une nouvelle fonctionnalité.
- **1.1.1** : Correction de bugs dans la fonctionnalité ajoutée.
- **2.0.0** : Changements majeurs qui cassent la compatibilité avec la version 1.x.x.

# API 
L'api utilisera ce système de version

# APP 
L'app aussi utilisera cette version.

# Méthodologie
Pour construire les notes de version automatiquement, on va devoir utiliser les pull request.

Chaque fonctionnalité / stories devra avoir sa branche. 

Et être merger dans Github pour être en mesure de commenter, d'être révisé et d'être inclus dans les notes de versions.