tag : #documentation_technique 

## Objectifs
Valider les données qui sont reçues à l'API, pour assurer que les identifiants sont correctes, représentent de réelles entités, et que la liaison est faisable.
Par exemple, vérifier que les identifiants de taxonomie envoyés sont des taxonomies existantes qui peuvent se lier.
- ObjectId valide
- Taxonomie existante avec cet identifiant
- De la bonne catégorie pour le champs (catégorie domaine sur le champ domaine de l'entité)

Ou bien toute autre vérification pour éviter la forge. Présentement, l'API n'effectue pas beaucoup de validation sur les données, puisque notre APP s'occupe quand même bien de limiter la saisie de donnée aux données valides. Cela n'empêcherais toute fois pas quelqu'un de reprendre le format d'envoi et de modifier les données. Par exemple, dans certains cas, la modification d'un ObjectId, qui a le même nombre de caractère sera accepté, et donc, pourrait mettre à mal l'APP puisqu'il serait impossible de fetch l'entité correspondant au ObjectId fautif.

Valider les données qui ne sont pas liées, comme le nombre de caractère d'un champ, ou autre vérification (voir le brainstorm pour les données).
## [[Brainstorm]] pour Validation
### Brainstorm validation des données liées
Tout d'abord, l'API faisait une vérification sur les taxonomies, pour voir si elles existaient et n'avait pas de doublons. Cela est devenu problématique lorsqu'on a changer pour des groupes de taxonomies dans person et organisation puisqu'une personne pourrait vouloir mentionner une même taxonomie dans plusieurs groupes, et il y avait eu aussi un nouveau bug apparu en lien avec le array de taxonomies devenu array de array.
Nous avons discuté et décidé qu'on retirait la vérification, puisque l'APP gère déjà bien ces données et leurs restrictions, mais aussi parce qu'il n'y a presque pas ou pas d'autres vérifications faites, et donc, inutile (soit tout est valider, soit rien, pourquoi ne valider que les taxonomies?).

Nous pensons qu'un design abstrait serait approprié pour ce genre de validation.
Une classe abstraite de validation capable d'effectuer :
- Des requêtes sur des collections de façon dynamique
- Des requêtes adaptée à ce que l'on souhaite chercher en lien avec les données
- Des méthodes de validation sur les entités recueillies
	- ObjectId est valide
	- ObjectId existe (représente une entité existante)
	- L'entité représenté peut être lié (bon type d'entité, bonne catégorie de taxonomie pour le champ)
	- ...
- Capable de renvoyé une raison tangible, si la validation échoue, de pourquoi ce n'est pas valide

### Brainstorm validation des données
D'autre part, une validation pourrait être faite, mieux que celle de mongoose dans l'API.
La validation mongoose sur les champs (required, unique ...) peut être utilisé, et l'est dans certains cas, mais peux être problématique dans d'autres.
Par exemple, on aimerait, dans un champs d'enum, pouvoir choisir une valeur vide. Lorsque le champ possède la vérification mongoose "enum", il est impossible pour l'APP de remettre la valeur à vide. Lorsqu'on tente de déselectionner l'APP tente de retourner quelque chose qui représente "rien", sauf que comme "rien" n'est pas dans l'enum, on ne peut pas remettre le champs à vide et on doit faire des manipulations d'ajouter un champs qui représente vide dans l'enum. On voudrait pouvoir limiter ce champs à une "enum" mais permettre la réinitialisation du champs à vide. Ou bien on voudrait aussi limiter un champs à un certains nombres de caractères, que ce soit béton, et qu'on retourne un message d'erreur tangible correspondant.
On aimerait par exemple :
- Pouvoir valider qu'un choix select est dans l'enum mais permet d'être vide
- Limiter le nombre de caractère (min et max) d'un champs
- Valider que certains champs envoyé ne sont pas vide (un groupe de taxonomie ayant un titre ou des compétences non-vide)
- ...

## [[Conception]] pour Validation


## Structure

```javascript

```

### Exemple

```javascript

```


## Todo
Effectuer la réflexion sur la structure et la conception de la validation des données liées et non liées.

## Planifié
