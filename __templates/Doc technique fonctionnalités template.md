#portfolio 


## [[Conception]] et [[brainstorm]]  de {{title}}


## Structure de la [[taxonomie]]

```typescript
{  
    {{property}}: {  
        type: {{type}},  
        required: [true, ''],
        //ref: "Taxonomy"
        //enum: TaxonomiesCategoriesEnum,  
        //lowercase: true,
        //trim: true
    },
    status: Status.schema
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