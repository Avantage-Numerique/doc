tag : #documentation_fonctionnelle 

## Objectifs


## [[Brainstorm]] pour Tag Croissant boréal
### 2024-05-07
Présentes : Rosalie, Jeane, Fred et M-A

Habite le croissante
Fan du 
Provient

Les critères : Je viens, j'habite ou je donne des services.
Géolocalisation

Établi sur le CB
Collabore avec le CB

Je collabore

Si met juste un critère.

- Adresse d'affaire dans le croissant boréale. **important**
- 

À l'international ? On dit oui ?

Il faut que l'algorithme soit relié.

N'importe qui peut consulter les données. Mettons qu'on auth, les gens de Mtl.

On ajouter la taxonomie : le savoir - affaires - cultures

On veut préciser nos intentions d'appartenance au territoire.

On parle d'Aliment Québec.

Badge 

**Conclusion** : 
- Région administrative (+ ville ?)
- Je suis dans le cb selon x région inclus.

#### Visuel du tag

On voit un croissant. 
On peut ajouter un endroit avec plusieurs tag.


## 2024-05-21
Un seul badge 
Si je viens d'une des MRC / région administrative.

Label : J'habite dans le CB ?

Emplacement : Prefilled par les régions administrative.

On ajoute un select d'emplacement avec un white list des emplacements possible sans la création par entité.

\+ un radio button qui dit je viens du cb ?

### UX 
**Modification** : En dessous de contact point
modal qui dit tout les détails du pourquoi le CB. 
**Single** : dans le header sur l'image ou dans le titre. Inspiré des crochets bleu ?
Sélect dans la colonne de droite au dessus de contact point

Multi sélect ?
## [[Conception]] pour Tag Croissant boréal

On garde notre champ place.
On popule la BD avec des place fixe pour les région administrative? (pour le tag du Croissant Boréal). 
On créer une liste d'emplacement qui active l'affichage du tag CB.

### Pour la version initiale
Dans la fiche personne, on ajoute le champs de choix de régions supporter par le badge du CB. Et un choix Autres.

- Votre région d'activité * à changer *
- Région A
- Région B
- Région C
- En dehors

#### Pour le schema de Personne : 
On ajoute le champ `region`. (pour le schema)
On ajoute le champ `badges` de type Array []
avec x badge dedans.
Il faut ajouter un schema badges avec : au min ces valeurs :
- Icone
- Label
- Description ?
- + le nom du schema comme valeur constante.

## Structure

```javascript
// Liste des région supporté par le CB
// Enum / liste dans un champs précis pour le CB
// Ajout dans le schema pour le CB.
```

### Exemple

```javascript

```


## Todo


## Planifié
