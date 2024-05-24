# Places
tag : #documentation_technique 
Les lieux.
## Objectifs
Ajouter des lieux physiques au organisation et aux événements.

## [[Brainstorm]] pour Places
On veut pas nécessaire avoir un contribute.

## Version 1.1 de place brainstorm 2024-05-24

Région Administrative
-> Filtre les lieux administrive avec le sélect actuel.
-> s'il existe pas, on affiche le créate comme c'est là.

Pour les places, on ajoute un état de public / privé.
Les places, serait embeded

personne / orgasniation ajoute leur adresse.

Si qqchose arrive, l'organisation ajouter son adresse elle pourrait la mettre public, et là on la met dans la collection.

Auquel cas on fetch les adresses de la collection.

Organisation 
- Lieux principale (adresse principale)
	- Schema embeded
- Lieux secondaire / public.

Personne
- Lieux (avec comme choix seulement une ville et/ou région administrative)

Lieux
- Public (partagé)
- Embeded ?

On embed les org / person, mais avec un autocomplete pour préfiled leur information rapidement.

1 seul lieu par org ?

Seulement un select de ville / région administrative pour personne.
avec une liste des villes / région dans le cb.

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


## Liens
Pour l'intégration d'une carte dans le futur.

[OpenStreetMap choix d'intégration](https://wiki.openstreetmap.org/wiki/FR:D%C3%A9ployer_sa_propre_Slippy_Map)
[OpenStreetMap Leaflet](https://leafletjs.com/)
Extraire des données d'open street map
https://extract.bbbike.org
https://wiki.openstreetmap.org/wiki/Downloading_data
https://wiki.openstreetmap.org/wiki/Processed_data_providers

Pour l'autocomplete d'adresse :
https://batch.openaddresses.io/r
https://github.com/openaddresses/openaddresses
https://developers.google.com/maps/documentation/address-validation/policies?hl=fr
https://www.canadapost-postescanada.ca/ac/support/api/