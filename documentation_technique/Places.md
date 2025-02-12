# Places
tag : #documentation_technique 
Les lieux.
## Objectifs
Ajouter des lieux physiques au organisation et aux événements.

## [[Brainstorm]] pour Places
On veut pas nécessaire avoir un contribute.

## Version 1.1 de place brainstorm 2024-05-24

Région Administrative
-> Filtre les lieux administrative avec le sélect actuel.
-> s'il existe pas, on affiche le create comme c'est là.

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

### Structure de geonames
https://wiki.openstreetmap.org/wiki/GeoNames géonames ne serais pas compatible avec la licence d'open street maps.
Sources des données de Geonames : http://www.geonames.org/data-sources.html
The main 'geoname' table has the following fields :
---------------------------------------------------
**geonameid**         : integer id of record in geonames database
**name**              : name of geographical point (utf8) varchar(200)
**asciiname**         : name of geographical point in plain ascii characters, varchar(200)
**alternatenames**    : alternatenames, comma separated, ascii names automatically transliterated, convenience attribute from alternatename table, varchar(10000)
**latitude**          : latitude in decimal degrees (wgs84)
**longitude**         : longitude in decimal degrees (wgs84)
**feature class**     : see http://www.geonames.org/export/codes.html, char(1)
**feature code**      : see http://www.geonames.org/export/codes.html, varchar(10)
**country code**      : ISO-3166 2-letter country code, 2 characters
cc2               : alternate country codes, comma separated, ISO-3166 2-letter country code, 200 characters
**admin1 code**       : fipscode (subject to change to iso code), see exceptions below, see file admin1Codes.txt for display names of this code; varchar(20)
**admin2 code**       : code for the second administrative division, a county in the US, see file admin2Codes.txt; varchar(80) 
**admin3 code**       : code for third level administrative division, varchar(20)
**admin4 code**       : code for fourth level administrative division, varchar(20)
**population**        : bigint (8 byte int) 
**elevation**         : in meters, integer
**dem**               : digital elevation model, srtm3 or gtopo30, average elevation of 3''x3'' (ca 90mx90m) or 30''x30'' (ca 900mx900m) area in meters, integer. srtm processed by cgiar/ciat.
**timezone**          : the iana timezone id (see file timeZone.txt) varchar(40)
**modification date** : date of last modification in yyyy-MM-dd format

### Structure de Wikidata location
https://www.wikidata.org/wiki/Property:P276
Wikidata utilise beaucoup d'info de OSM (open street map)

### Open street map
https://github.com/iandees/mongosm  (très vieux comme repo)
mongo osm c'est un layer python qui permet de prendre des données d'OSM et de les transféré en collection/documents mongo.

http://sammerry.github.io/node-mongosm/ use mongoose aussi :o 
Node-mongosm will convert .osm files from Open Street Map and save / upsert new entries to your local or external mongodb instance.

### Requêtes géospatiale nécessaire ?
https://www.mongodb.com/docs/manual/geospatial-queries/

### Structure ?
J'ai l'impression que ça prend une db pour les géos.
Avec la structure :

Initial import de données du niveau qu'on a besoin : Pays > Province/Terr. > Région > Ville

## Idée
Micro command python Geodesk qui export les données d'OSM qu'on veut et les importe et les importe dans la structure de l'API.

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
Pour une ontologie de lieu :
https://www.geonames.org/ (user manuel ? https://www.geonames.org/manual.html)

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

À explorer : https://github.com/Amraneze/osm-autocomplete

Exporter des données :
https://docs.geodesk.com/python/examples/counties
