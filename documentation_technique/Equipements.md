tag : #documentation_technique 

## Objectifs
Ajouter des équipements utilisé dans des projets et dans les expertises d'une organisations.

## [[Brainstorm]] pour Equipements
Idée cannée : États on l'a tabletter, parce que c'est pas pertinent.

## [[Conception]] pour Equipements

**Structure**
- Name (virtual comme le slug avec toutes les char).
- Label (un peu comme un titre ou un surnom) (titre) (max lenght ? 75)
- Slug (marque+model+label)
- Description
- Marque
- Model
- mainImage
- Urls (sources)
	- Label
	- Url
- Taxonomies 
	- Types d'équipement (nom à trouver)
		- micro, imprimante 3D, etc.

**Organisations** (1:n)
- Équipement groupe
	- Équipements
		- On affiche le name (marque+model+name)
		- En entity tag ?
	- Quantité (inc number) +/-
	- Compétences

**Projets** (1:n)
 - Technologies utilisées (outils ou tech que tu as utilisé) 
   Repeater (semblable au étapes du budget) un des trois obligatoire
	 - Champ texte variable (description de l'utilisation ou équipement pas répertorié).
	 - Équipements
	 - Technologies

## Structure
Ajouter le schema ici.
```javascript

```

### Exemple

```javascript

```


## Todo


## Planifié
