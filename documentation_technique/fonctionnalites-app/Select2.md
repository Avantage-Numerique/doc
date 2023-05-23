Le Select2Tag n'était pas assez versatile, pouvait être difficile à utilisé dans différent contexte, et nécessitait de comprendre sa structure.
En vue d'avoir un Select2 qui fonctionne dans plusieurs contexte (considérant que Select2 est notre façon principale de lié des entité et de les rechercher, plutôt _core business_ ),
il était important de commencer à permettre d'utiliser de façon plus efficace et simple le Select2.

Le principe de base est donc de faire quelques component de base de select qui sont très simpliste, et utiliser ces selects simple via un Select parent.
On aurait donc différent composant simple de select2 comportant différente fonctionnalité (creatable?, isMulti? ...) et qui serait appellé par un composant "parent".
Le Select2 parent accède au contenu et peut manipuler tout le contenu de la base, alors que le Select2 base permet de modifier ces valeurs et d'en choisir. 

## Point principal
Le Select2 parent permet de manipuler les données et le contenu du select2 alors que la base sert d'interface à la sélection de donnée et de recherche.

## Division du Select2
Select2Base est divisé en deux component (Select2BaseSingle, Select2BaseMulti) qui comprenne les même fonctionnalité, excepté qu'un est single (et renvois un objet) et un multi (et renvois un array).
Aussi la base permet de gérer la propriété creatable permettant d'ajouter une option lors de l'utilisation.
Ils gères leur propriété `inputValue` et `value` via un State et un setter passé par le parent. Le parent a donc contrôle du contenu du input text, options et des valeurs alors que le component base permet de le modifier.

On peut appeler le component parent, spécifier la liste d'option ou requête pour avoir les options, gérer la propriété multi, géré la propriété creatable, sans dérangé le component de base.
Le component Select2 parent, retourne le Select de base correspondant au propriété passée, les options, les valeurs de préremplissage etc. Il s'occupe de la gestion des données, le formatage des données vers des options, les couleurs et autres.
