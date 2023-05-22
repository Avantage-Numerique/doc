tag : #documentation_technique 

## Objectifs
1. Permettre au développeur d'effectuer des requêtes avec les outils attendus dans une requête. 
2. Ajouter une couche de simplification et de transition vers la requête direct vers la BD.

## [[Brainstorm]] pour Queries
On a besoin de pouvoir interagir avec l'API de façon dirigé, mais aussi avec plusieurs options pour permettre des implémentations complexe.
On a besoin d'avoir plusieurs type de comparateur (ne, gte, etc.) 
On a aussi besoin de faire des requêtes avec une game de OR et AND.


## [[Conception]] pour les Queries

### Structure d'une requête

Désigner pour recevoir les paramètres de la requêtes en format json. L'api gère les requêtes complètes en POST seuelement présentement.

Exemple
`query` est égale à votre requête.
```javascript
submitRequest(  
    `/taxonomies/${submitUri}`,  
    'POST',  
    query  
);
```


### Structure d'une requête complexe
Désigner pour recevoir les paramètres de la requêtes en format json. L'api gère les requêtes complètes en POST seuelement présentement.

Exemple
`query` est égale à votre requête.
```javascript
submitRequest(  
    `/taxonomies/${submitUri}`,  
    'POST',  
    {
	    category:"domains",  //category == "domaine"
	    name:"", //any/all
	    or: "gte:1000",
	    or: [
		    {createdAt: `gte:${date}`}, // where createdAt date >= date
		    {upddateAt: `lte:${date}`}
	    ]
	}
);
```


### Mots clés implémentés

#### `gte`
Permet de faire une requête sur un chiffre ou une date qui est plus grande ou egal à la valeur demandé.

Exemple de requête
```javascript
let query = {  
    category:"domains",  //category == "domaine"
    name:"", //any/all
    createdAt: `gte:${date}` // where createdAt date >= date
};  
```

#### `lte`
Permet de faire une requête sur un chiffre ou une date qui est plus petit ou egal à la valeur demandé.

Exemple de requête
```javascript
let query = {  
    category:"domains",  //category == "domaine"
    name:"", //any/all
    createdAt: `lte:${date}` // where createdAt date <= date
};  
```

#### `ne`
Permet de faire une requête où la valeur n'est pas égale à la valeur comparé.

Exemple de requête
```javascript
let query = {  
    category:"domains",  //category == "domaine"
    name:"", //any/all
    _id: `ne:${entity._id}` // where _id != entity._id
};  
```

## Todo
### caching des queries
On pourrait utiliser un index cached (avec des noms) pour cached les queries.

### Brainstorm.
Avec des UUID ? qu'on retourne en réponses 


## Planifié


## Liens
- [Documentation Mongoose des Queries](https://mongoosejs.com/docs/queries.html)
- [Documentation des Query dans MongoDB](https://www.mongodb.com/docs/manual/reference/operator/query/)