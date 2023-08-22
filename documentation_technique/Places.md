# Places
tag : #documentation_technique 
Les lieux.
## Objectifs
Ajouter des lieux physiques au organisation et aux événements.

## [[Brainstorm]] pour Places
On veut pas nécessaire avoir un contribute.

## [[Conception]] pour Places
Première version de lieux en string simple avec les informations minimum.

Les places sont accessible via 
- Organisations.locations []
- Event.locations []

### Fonctions principales
- Les places seront seulement `creatable` dans les entités Organisation et Événement.
	- On peut ajouter un nouveau lieu dans Organisations
	- On cherche par nom et adresse
	- On affiche l'adresse dans le select
	- Dans l'entityTag on affiche le nom + adresse.
		- Adresse + gros
		- Nom en badge
- On peut modifier une place dans le mode contribuer dans sa vue single
	- Accessible via Entity -> lieux -> Single Lieux.

### Place
C'est une version simple qui comprend plus 
de https://schema.org/PostalAddress que de place.

1. `Nom` (required)
2. `Description` (string)
3. mainImage (Media)
5. `address` ( Shema.org : streetAddress )
6. `city` ( Shema.org : addressLocality )
7. `region` ( Shema.org : addressRegion )
8. `mrc` ( Shema.org : addressRegion )
9. `province` ( Shema.org : addressRegion )
10. `postalCode` ( Shema.org : idem )
11. `country` ( Shema.org : AddressCountry )
12. `latitude` ( Shema.org : idem ) 
13. `longitude` ( Shema.org : idem )

## Structure

```javascript

```

### Exemple

```javascript

```


## Todo


## Planifié
