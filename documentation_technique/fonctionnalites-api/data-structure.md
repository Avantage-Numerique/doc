tag : #documentation_technique 

## Objectifs
Passer une structure plus directe à l'APP relié aux structure du schema.

## [[Brainstorm]] pour data-structure
On passe au début de l'app, pour get les structures. Surtout pour les taxonomies.

## [[Conception]] pour data-structure


## Structure

```javascript
"category": [ "occupation", "skills", "technology"]

        properties : ["name", "description", "url", "contactPoint", "fondationDate", "offers", "domains"];

        /info/taxonomy

        "category": [
            {
                "value":"occupation",
                "type": "Taxonomy.Occupation",
                "getIdField": ["occupation", "skills"]//"occupations.skills"
            }
        ]
```

### Exemple

```javascript

```