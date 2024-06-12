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
Dans la fiche personne et organisation, on ajoute le champs de choix de régions supporter par le badge du CB. Et un choix Autres.

**Votre région d'activité**
- Abitibi-Témiscamingue
- Baies-James
- Nord de l'Ontario
- Autre

#### Pour le schema de Personne : 
On ajoute le champ `region`. (pour le schema)
On ajoute le champ `badges` de type Array []
avec x badge dedans.

#### BadgeTypes
_Fichier BadgeTypes.ts_
Contient une variable objet statique "badges" qui possède comme clef le nom des différents badges. Contient aussi une fonction qui retourne toutes les clef de `badges` et donc tout les "code de badge".
On a donc `badges.CB` pour représenter le badge croissant boréal.
Dans l'objet `badges.x` on peut y retrouver les informations du badge, comme son `name:"CB"` ou identifiant, `fullName:"Croissant Boréal"`, etc.. Avec versatilité puisqu'on peut forger cet objet comme on le souhaite (exemple le badge CB possède pour le moment `badges.CB.acceptedRegion` qui permet de stocker les valeurs de vérification).

Exemple :
```typescript
    static badges:any =
    {
        CB :
        {
            name: "CB",
            fullName: "Croissant Boréal",
            label: "Croissant Boréal",
            iconPath: "",
            iconAlt: "",
            iconDescription: "",
            condition(document:any){
                if(document?.region !== undefined){
                    if(BadgeTypes.badges.CB.acceptedRegion.includes(document.region))
                        insertBadgeInArray(document.badges, "CB");
                    else
                        removeBadgeInArray(document.badges, "CB");
                }
            },
            acceptedRegion:["abitibi-temiscamingue", "north Ontario", "baies-james"],
            type:"Badge"
        }
    }
```

#### MiddlewareInsertBadges
Un middleware (`middlewareInsertBadges`) s'effectue avant le `save` et `findOneAndUpdate` de person et organisation pour vérifier si l'on ajoute chaque badge possible. Il cycle au travers les badges existant, test si l'on peut l'ajouter et l'insert ou le retire du document avant de sauvegarder l'entité.
La fonction `badge.x.condition` dans l'objet sert à effectuer cette vérification. Dans l'exemple ci-dessus, si région fait partie des régions du croissant boréal, on ajoute le badge.


## Todo


## Planifié
