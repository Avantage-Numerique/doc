#taxonomie
## Conception brainstorm
1.  On pense que ça devrait être global et plus statique.
	1. On est pas certain que l'utilisateur devrait pouvoir en ajouter facilement (pour l'instant)
2.  On pense qu'il faut faire un test sur comment les gens classerais les trucs (en lien plus avec compétences)
3. Wikidata utilise : [https://www.wikidata.org/wiki/Property:P101](https://www.wikidata.org/wiki/Property:P101) field of work.

## Forme de la [[taxonomie]]

### Ajout
```typescript
domains: {
    type: [{
        domain: {
            type: mongoose.Types.ObjectId,
            ref: "Taxonomy"
        },
        status: Status.schema
    }]
}
```

### Forme du schema de taxonomie
```typescript
{  
    category: {  
        type: String,  
        required: [true, 'Required category (occupation, domaine)'],  
        enum: TaxonomiesCategoriesEnum,  
        lowercase: true,
        trim: true
    },  
    name: {  
        type: String,  
        required: [true, 'Name required'],
        minlength:[2, 'MinLength 2'],
        //alias: 'nom',  
    },  
    slug: {  
        type: String,  
        slug: "name",  
        slugPaddingSize: 2,  
        index: true,  
        unique: true  
    }, 
    taxonomiesSibling: {  
        type: ObjectId,  
        required: false
    },  
    description: {  
        type: String,  
        //alias:'desc'  
    },  
    source: {  /**Pas implémenté encore, c'est pour le lignage*/
        type: String    //},    status: {  
        type: Source.schema,  
        required: true,  
    },
	domains: {
	    type: [{
	        domain: {
	            type: mongoose.Types.ObjectId,
	            ref: "Taxonomy"
	        },
	        status: Status.schema
	    }]
	}
}
```

## Quels entités recevront la taxonomie domaine
Dans leur schema

1.  **Les taxonomies**
	1.  Domaines (pour avoir des domaines plus précis et plus globaux dans la même taxonomies)
		1. Avec le design de 
	2.  Compétences (Skills)
	3.  Finalité
2.  **Les entités principales**
	1.  Personnes
	2.  Organisations
	3.  Projets
	4.  Équipements
	5.  Apprentissages
	6.  Lieux
	7. ~~Événement~~ 
	   je ne suis pas certain, car l'événements va faire parti d'un projets ou d'un apprentissage

## Schema dans les entités et dans taxonomies
```typescript
domains: {
    type: [{
        domain: {
            type: mongoose.Types.ObjectId,
            ref: "Taxonomy"
        },
        status: Status.schema
    }]
}
```

