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

Désigner pour recevoir les paramètres de la requêtes en format json. L'api gère les requêtes complètes en POST seulement présentement.

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
Reçois les paramètres de la requêtes en format json. L'api gère les requêtes complètes en POST seulement présentement.

Exemple
`query` est égale à votre requête.
```javascript
submitRequest(  
    `/taxonomies/${submitUri}`,  
    'POST',  
    {
	    category:"domains",  //category == "domaine"
	    name:"", //any/all
	    or: "gte:1000",//this is a property or
	    or: [//or is considered a where OR only if an array
		    {createdAt: `gte:${date}`}, // where createdAt date >= date
		    {upddateAt: `lte:${date}`}
	    ]
	}
);
```

#### Implémentation dans le query builder
1. l'Api Reçoit le query via une requête post `/search`
2. Le controler reçoit le query venant de la route et transmet le query au Query builder
3. Le `querybuilder` analyse le query avec une boucle.
	1. Si l'élément a une entré avec une clé reconnu <u>et</u> `Array` comme valeur. 
		1. Il considère cet élément comme une section logique.
		2. Chaque section reconnu est analysé comme celle au premier niveau.
		3. Chaque section sauvegardé est supprimer du `query` original afin de permettre à la suite des paramètres d'êtres analysé.
		4. Les sections sont ajoutés à l'instance `ApiQuery.sections` et sera renvoyé au `controler` ensuite.
	2. Le `querybuilder` prend ensuite chacune des propriétés restantes et ajuster les propriété et ajustement selon les mots clés inclus.
	3. Le `querybuilder` renvoie ensuite le query (`ApiQuery.transmuted`) au `controler` pour être recherché


### Clés de sections

#### `or`
Permet de faire une requête OR sur les valeurs inclus dans le array de la valeur.

Exemple de requête
```javascript
let query = {
    name: "", //any/all
    or: [
	    {category: `skills`},
	    {category: `domains`}
    ]
};  
```

#### `and`
Permet de faire une requête OR sur les valeurs inclus dans le array de la valeur.

Exemple de requête
```javascript
let query = {
    name: "", //any/all
    and: [
	    {category: `skills`},
	    {category: `domains`}
    ]
};  
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
#### `in`
Implémenté.
Présentement, on ne supporte pas un in, avec des objectid.
`champ: 'in:liste,avec,des,virgules'`

```javascript
let query = {  
    category:"domains",//category == "domaine"
    name:"",//any/all
    cateogry: `in:domains,technologies`
}; 
```

## Todo
### Caching des queries
On pourrait utiliser un index cached (avec des noms) pour cached les queries.

#### Brainstorm.
Avec des UUID ? qu'on retourne en réponses 


## Planifié


## Liens
- [Documentation Mongoose des Queries](https://mongoosejs.com/docs/queries.html)
- [Documentation des Query dans MongoDB](https://www.mongodb.com/docs/manual/reference/operator/query/)