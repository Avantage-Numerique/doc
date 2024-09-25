tag : #documentation_technique 

## Objectifs
Diminuer la charge des requêtes sur l'API. 
Avoir une expérience rapide avec beaucoup de données.


## [[Brainstorm]] pour Pagination

Un défi est à garder en tête en lisant le brainstorm : Il nous faut une solution pour paginer chaque collection individuellement, mais aussi pour paginer une requête qui contiendrait plusieurs types d'entités.

Dans ce dernier cas de figure, il nécessite beaucoup de logique et de puissance de calcul pour chercher dans les 5-6 collections (voir plus) et de faire le tri dans toutes ces données pour retourner des résultats ordonnés et paginés.

Plusieurs piste de solution s'offrent à nous, en voici quelques unes.
- [Aggregation Pipeline Optimization](https://www.mongodb.com/docs/manual/core/aggregation-pipeline-optimization/#pipeline-coalescence-optimization). Créer une forme de requête personnalisable qui utilise les optimisations du pipeline d'aggrégation, profitant de l'optimisation intégré dans MongoDB. Me fait penser au QueryBuilder, qui a demandé beaucoup de maintenance. Semble résoudre le problème de devoir paginer selon plusieurs collections.
	- Pros :
		- Semble plus efficace en terme de puissance de calcul puisqu'on peut enchaîner dans le pipeline d'aggrégation les requêtes et mongo optimisera du mieux qu'il peut les requêtes.
		- On a accès à toutes les fonctionnalité de mongo puisqu'il s'agit de notre code et on le modifie comme on le souhaite. On peut donc modifier "facilement" si quelque chose cloche.
		- Personnalisable
	- Cons :
		- Comme il faut coder la fonctionnalité en entier, ça risque de prendre beaucoup de temps
		- Bien que la fonctionnalité de "pagination" en temps que telle sera incluse dans ces requêtes d'aggrégation, il faudra tout de même coder la pagination en entier (la gestion de limit, skip, sort et ça, au travers du aggregate de différente collections potentiellement  ...)
- [Package de pagination mongoose](https://www.npmjs.com/package/mongoose-paginate-v2). Ajouter le package et adapter notre code, dans les requêtes et les schémas pour l'intégrer. Ce package possède les fonctionnalité de paginations et beaucoup d'option intégré dans les requêtes.
	- Pros :
		- Semble rapide d'intégration (plug and play?)
		- Possède de la documentation sur les options, et les valeurs de retour, des exemples, et des options de préférencesé
	- Cons :
		- Semble moins efficace en terme de puissance de calcul (J'ai brièvement regarder le code, je ne vois pas d'aggrégation)
		- Ne semble pas s'attaquer au cas où l'on souhaite paginer plusieurs collections, il faudrait, semble-t-il, tout de même faire une méthode personnalisé de fetch de données sur plusieurs collections et une pagination à la suite.
- [Package de pagination mongoose avec aggrégation](https://www.npmjs.com/package/mongoose-aggregate-paginate-v2). Après avoir chercher sur internet, je suis tomber sur ce package qui mentionne le package de pagination mongoose du point précédent.
	- Pros :
		- Documentation similaire mais moindres que le package pagination mongoose précédent
		- Pré-pagination (pas clair, mais pourrait permettre d'optimiser certaines requêtes en décidant du moment où l'on fait une action couteuse en puissance de calcul)
		- Semble combiner la pagination et l'aggrégation, donc nous sauve du temps
	- Cons :
		- Pas d'exmple d'aggrégation sur plusieurs collections, même si sa semble faisable
		- A l'air plus complexe d'utilisation (semble moins plug and play)


Notes sur la paginations de plusieurs collections :
Il serait possible de faire une requêtes sur plusieurs collections, mais comment les organiser ensuite? Dans les exemples de piste de réflexion, on utilisera une page de 50 entités sur 5 collections.
- Chaque collection individuellement, sorted by updatedAt. Il faut ensuite définir l'algorithme qui convient le mieux pour nous.
	- Dans le cas où l'on limite aux 10 premiers résultats de chaques collections, on affiche une distribution égale de chaque entité pour la recherche (10 entités de chaque collections par recherche). Cependant, si l'on se retrouve dans le cas de figure où le "skip" est plus grand que le nombre de document d'une collection, alors on se retrouve avec moins d'entité d'un type. Par exemple, une collection ne retourne plus de résultat ou retourne les 10 derniers résultats puisque le skip excède la quantité de document, alors la recherche retourne soit 40 entités (10 par collection excepté celle qui a épuiser toutes ses entités) ou bien 50 entités, mais 10 entités en doublons, puisque la collection aurait retourné les 10 derniers.
	- Dans le cas où l'on demande 50 entités de chaque collections **séparément**, on augmente considérablement la quantité de données utilisée, ce qui allonge le calcul, puisqu'on doit faire le traitement parmis 250 entité au lieux de 50. Si ensuite on décide de trier pour n'afficher que les plus récent, on se retrouve avec une difficulté à calculé quels entité on met à la page 2. Cette solution semble fautive puisque dans un cas extrême, si 50 entités sont tiré de la premiere collection et sont toutes les données à retourner de la recherche, il faut, pour la page 2, déterminer un skip différent pour chaque entité. Donc la premiere collection se prendrais un skip de 50, mais les autres non. Le nombre de skip par collection serait le nombre d'entité de ce type retourner par la premiere page. Cependant, lorsqu'on arrive à la page 3, il faudrait savoir combien de skip de chaque entité on a fait à la première page par entité, et ensuite additionner à combien de skip on a fait à la page 2 par entité, ce qui ne semble vraiment pas viable.
	- Dans le cas où on fait l'aggrégation de toute les collections et le sort, skip et limit de ce résultat, c'est une importante quantité de calcul, mais ça semble résoudre le problème. Le défaut que j'y trouve, serait en fonction de si c'est rapide ou non.
	- S'il est possible pré calculer la pagination d'entité et d'afficher les entités pré-sélectionné, on pourrait faire rouler un script de pré pagination statique qui ferait les gros calculs d'aggrégation à chaque jours pendant la nuit (lorsqu'il n'y a pas beaucoup de traffic), qui retournerais des résultats pré-défini par page. Un genre d'indexation d'entité inter-collection (genre  : pour la page 1 de "tous les types d'entité", retourner les ids suivant à travers toutes les collections \[Id1, id2, id3 ... id50\], pour la page 2 retourner la liste de id suivante, pour la page 3 ......). Le seul problème serait d'intégrer à cette pagination "statique" les entités créer au fur et à mesure de la journée, mais sinon, cette façon de faire semble optimale, puisque sans nécessairement réduire la puissance de calcul nécessaire, on la déplace à un moment où le site n'est pas utilisé.

Conclusion, le dernier point de la liste (les pages statique pré-calculées) semble être le plus optimal, mais je n'ai rien trouvé là dessus sur internet.
## [[Conception]] pour Pagination


## Structure

```javascript

```

### Exemple

```javascript

```


## Todo


## Planifié


