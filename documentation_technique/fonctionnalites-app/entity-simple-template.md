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
<SimpleLayout model={currentModel} />
```

### Exemple

```jsx
<SimpleLayout 
	model={currentModel} 
	params={{orientation: "vertical"}}
	header={changeComponentForHeader}
	>
```