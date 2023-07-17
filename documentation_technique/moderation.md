tag : #documentation_technique 

## Objectifs
Permet un contrôle des entités par des utilisateurs responsables et engagé tout en favorisant l'ajout de données.

## [[Brainstorm]] pour modération
Voir [le document de résumé de la rencontre stratégique ](https://docs.google.com/document/d/1h7X1RDSLDFznKng82zCB0y5zhOoJHq-L0ugmJkLKSJw/edit)


## [[Conception]] pour modération

### La modération vision algorithmique
1. Un utilisateur peut ajouter des entités
2. Un utilisateur doit être connecté à l'environnement Avantage numérique pour ajouter ou modifier du contenu.
3. Lors de l'ajout d'une entité, l'utilisateur à l'origine de la création devient le détenteur de l'entité.
4. La détention d'une entité permet de
	1. Modifier le contenu
	2. Ajouter du contenu
	3. Enlever du contenu
	4. Ajouter d'autres détenteur du contenu *
	5. Transféré la détention de l'entité à un autre utilisateur.
5. Seulement un détenteur d'une entité peut modifier ses données.
6. Seulement un détenteur d'une entité peut lui assigner d'autres entités. 
7. Si un détenteur peut assigner une nouvelle entité (qui n'existait pas encore dans le système) à la sienne. 
6. Lors de la création d'une nouvelle entités, un utilisateur peut :
	1. Garder la détention de la nouvelle entité.
	2. Marqué l'entité comme orpheline, appelé entité zombie par l'équipe.
	4. N'importe qui peut demander la propriété de la fiche.
![[./images/bdsol-moderation-1 - Lorsqu’un utilisateur ajoute ou modifit une entité@2x.png]]

### La modération d'entité Personne
Les fiches personnes seront traité différemment.
1. Les entités personnes sont associées à un utilisateur. À la manière d'un profile publique.
2. Seulement l'utilisateur associé à la personne peut modifier son entité personne.
3. Un utilisateur ne peut pas être détenteur de plus d'une fiche personnes.
4. La création d'une deuxième entité personne par un utilisateur devient automatiquement orpheline.
6. Une personne peut être assignée à une autre entités (équipe, etc.) même si aucun utilisateur n'est associé.
	1. Dans ce cas, l'entité personne créée et assignée au travers d'une autre entité devient orpheline (sans détenteur).
### Les entités orphelines
1. Les entités orphelines peuvent être ajouter avec le contenu obligatoire seulement.
	1. Le contenu obligatoire varie selon le type d'entité.
2. Les entités orphelines ne peuvent pas être modifiées
3. Les entités orphelines peuvent être réquisitionnée par un utilisateur.
4. Les entités personnes orphelines peuvent être réquisitionnée par un nouvelle utilisateur lors de la création de son entités personnes assignées.

![[./images/bdsol-moderation-1 - Lorsqu’un utilisateur assigne une entité dans une autre entité@2x.png]]

## Vocabulaire
- **Propriété** : Le terme est utiliser comme traduction à ownership et non pour référer à une propriété intellectuel, dans la sens légale de propriété.
- **Détenteur** : l'utilisateur à l'origine de l'ajout d'une entité
- **Entité** : Un élément principale dans la structure des données. Se traduit par : personne, organisation, projet, événement, lieux, équipement, etc. 
	- Une entité est consulter grâve à une fiche visible de plusieurs méthode. 
		- Méthode simple (information réduite) et 
		- Méthode complète, avec toutes les données associé à l'entité. 
		- Méthode données : les données brutes de l'entité souvent appelé comprenant les métadonnées.
- **Entité orpheline** : Une entité qui n'a pas de détenteur.
- **Taxonomies** : un élément qui classe une entité, qui la caractérise afin de cronstruire une structure intelligible des données.
- **Environnement Avantage numérique** : comprend l'API et l'Application.
- **Permission de modification** : comprend un accès d'édition (ou dit contribution dans l'application) pour ajouter, changer ou modifier du contenu et média).

## Structure

[Arborescence](https://whimsical.com/embed/BzHtzL47N2qzbB6YRf686o)
<iframe style="border:none" width="800" height="450" src="https://whimsical.com/embed/BzHtzL47N2qzbB6YRf686o"></iframe>

### Permissions d'un utilisateur
```javascript

```

### Permissions d'un utilisateur détenteur d'une entité
```javascript

```

### Permissions nécessaire pour créer une entité
```javascript

```

### Permissions nécessaires pour modifier une entité
```javascript

```

### Permissions nécessaires pour modifier une entité personne
```javascript

```


## Todo


## Planifié
