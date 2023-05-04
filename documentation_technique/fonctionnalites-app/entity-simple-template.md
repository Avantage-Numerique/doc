tag : #documentation_technique 

## Objectifs
Rendre l'utilisation des entité et de leur template plus direct et avec moins de répétition.

## [[Brainstorm]] de entity-template
- Les layouts simple aura sa version `abstraite`, avec des propriétés pour changer l'apparence.
- Chaque élément d'apparence aura une version par défaut (header).

## Structure
Tout les simples et les composants d'un simple (header, content, footer), doivent accepter un model comme props.

### Version de base
La version de base utilisera un visuel par défault qui sera utilisé
```jsx
<EntitySimple model={currentModel} />
```

### Exemples
1. Les paramètres ne sont pas défini encore
```jsx
<EntitySimple 
	model={model}
	className={"context-class"} 
	params={{orientation: "vertical"}}
	header={changeComponentForHeader}
	>
```

2. Exemple pour OrganisationSimple
Ici on a du props drilling par contre avec le model qui est passé d'un component supra vers le component abstrait `EntitySimple`.
```jsx
import React from "react"  
  
import styles from './OrganisationSimple.module.scss'  
import EntitySimple from "@/DataTypes/common/layouts/EntitySimple/EntitySimple";  
  
const OrganisationSimple = ({ model }) => {  
  
    return (  
        <EntitySimple model={model} className={`${styles["org-simple"]}`} />  
    )  
}  
  
export default OrganisationSimple
```