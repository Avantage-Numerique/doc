# Badges, BadgesTypes et Middleware

Les badges ont été pensé et codé avec l'idée que l'on ajouterait d'autres badges à la base de données. C'est donc implémenté pour permettre l'ajout d'autre badges sans trop de besoin d'adaptation du code.

## BadgeTypes.ts
Ce fichier sert à stocker de façon statique les badges et toutes leurs informations dans un objet appellé "badges".

Un badge comprend une structure modulable, et capable d'adaptation pour permettre d'ajouter des attributs et rendre facile la modification de ceux-ci.

### Structure d'un badge
```typescript
badgeName :
        {
            name: "",
            fullName: "",
            label: "",
            iconPath: "",
            iconAlt: "",
            iconDescription: "",
            condition(document:any){}
            type:"Badge"

        }
```

Il est donc facile d'accédé aux informations d'un badge via l'instruction dynamique `BadgeTypes.badges[badgeName]`. 

### Attribut fonction `condition` d'un badge
L'attribut "condition" est une fonction prennant pour le moment "document" comme paramètre.
Elle sert à vérifié, avec le document, si un badge doit être affecté au document. Des fonctions du middleware (voir MiddlewareInsertBadge) aide à la manipulation des données, à l'insertion et au retrait de badges.
À noté que, présentement, chaque badge est vérifié dynamiquement avec le même appel de fonction sur condition. Si l'on veux plusieur paramètre pour la fonction, on devra modifier le middleware. 

### Méthodes
Il serait possible d'avoir plusieurs méthode comme des getters, count et autres, et pourront être implémentée au besoin.

#### Méthode allBadgeTypes
Retourne toutes les clefs de l'objet "badges" et donc les noms de badge.
```typescript
static allBadgeTypes(){
        return Object.keys(this.badges)
    }
```


## MiddlewareInsertBadges.ts
Le middleware est appellé, présentement, dans le pre-save et le pre-findOneAndUpdate de person et organisation.

D'abord, il vérifie si le document possède l'attribut "badges" sinon, il l'ajoute avec comme valeur "array vide".

Ensuite, le middleware effectue, pour chaque badge existant dans la base de donnée, l'appel à la fonction `condition` avec comme paramètre "document".
```typescript
BadgeTypes.allBadgeTypes().forEach(elem => {
        BadgeTypes.badges[elem].condition(document);
})
```

 *Note : Si l'on ajoute un badge qui nécessite autre chose que le document pour la vérification, on devra modifier ce code pour permettre à l'appel de vérification de passer un ou plusieurs paramètre dépendamment de la situation.* 
 
 L'attribut condition des badges effectue la vérification et est en charge d'ajouter ou retirer le badge du `document.badges` à l'aide des méthodes du middleware suivantes :
 - insertBadgeInArray : Si le badge n'est pas dans l'array, l'ajoute.
 - removeBadgeFromArray : Si le badge est dans l'array, le retire.

Exemple pour le badge Croissant boréal :
```typescript
condition(document:any){
	if(document?.region !== undefined){
	  if(BadgeTypes.badges.CB.acceptedRegion.includes(document.region))
		  insertBadgeInArray(document.badges, "CB");
	  else
		  removeBadgeFromArray(document.badges, "CB");
	}
},
acceptedRegion:["abitibi-temiscamingue", "north Ontario", "baies-james"],
```
La condition prend le document et vérifie si la région est une valeur faisant partie des régions acceptées, si oui, insert le badge, sinon le retire.
