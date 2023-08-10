#taxonomie 

## [[Brainstorm]] et [[Conception]]

On inclus dans la taxonomies de types de taxonomies
- Logiciels
- Languages de programmation
- Technologie 

## Structure de la [[taxonomie]]
(idem au autres [[taxonomies]])
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

### À l'intérieur d'une autre entité

```typescript
technologies: {
    type: [{
        technology: {
            type: mongoose.Types.ObjectId,
            ref: "Taxonomy"
        },
        status: Status.schema
    }]
}
```

---
→ [Retour à la table des matières de la documentation technique](/documentation_technique/index.md)