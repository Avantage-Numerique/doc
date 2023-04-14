tag : #documentation_technique 

## Objectifs
---
Machouiller les données pour être utilisé at large dans l'application.

## [[Brainstorm]] pour entity-model
---
- Création d'un modèle abstrait pour basé le data des entités
- Les modèles vont servir à gérer les données et à éclaircir le code (Dry).
- Le modèle abstrait va contenir un getter pour avoir les templates simple et single (et tag).

## [[Conception]] pour entity-model
---



## Structure
---
version 0.1
```javascript
//import the target component used for single and for 
  
class Person {  

    constructor(raw, params={}) {  
	    this.rawData = raw;
        this.title = raw.fullname ?? "";//prepare the layout to only all .title on the model instead of an if.
        this.description = raw.description ?? "";
        this.mainImage = raw.mainImage;  
        this.type = raw.type === "Person" ? "Person" : false;//Wrong data sent here.  
        //this.taxonomies = new Map();        //this.taxonomies.set("domains", raw.domains);        //this.taxonomies.set("skills", raw.skills);        this.meta = {};  
        this.status = {};
        
        params.showMeta = params.showMeta ?? true;  
        params.showStatus = params.showStatus ?? true;  
    }  
    
    getSimpleComponent() {  
        return personSimple;  
    }  
    
    getSingleComponent() {  
        return personSingle;  
    }
}  
  
export default Person;
```

### Exemple

```javascript

```