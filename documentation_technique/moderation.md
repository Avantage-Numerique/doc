tag : #documentation_technique 

# Modération

## Objectifs
Permets un contrôle des entités par des utilisateurs responsables et engagés tout en favorisant l'ajout de données avec le moins d'embûches possible.

## [[Brainstorm]] pour modération
Voir [le document de résumé de la rencontre stratégique ](https://docs.google.com/document/d/1h7X1RDSLDFznKng82zCB0y5zhOoJHq-L0ugmJkLKSJw/edit)

## [[Conception]] pour modération

Une section de vocabulaire est présente à la fin de la page.

![Modération](/documentation_technique/images/moderation-globale.png)

## La modération décrite de façon algorithmique
1. Un utilisateur peut ajouter des entités (voir définition entités)
2. Un utilisateur doit être connecté dans l'application pour ajouter ou modifier du contenu.
3. Lors de l'ajout d'une entité, l'utilisateur à l'origine de la création devient le détenteur de l'entité.
4. La détention d'une entité permet de
	1. modifier le contenu
	2. Ajouter du contenu
	3. Enlever du contenu
	4. Ajouter d'autres détenteurs du contenu *
	5. Transférer la détention de l'entité à un autre utilisateur ou codétenteur.
	6. Ajouter d'autres utilisateurs codétenteurs pour partager l'accès aux modifications d'une entité.
		2. Les utilisateurs partagent les accès d'une détention de l'entité
		3. Les règles granulaires de détentions sont seulement attribuables par le détenteur principal de l'entité.
5. Seulement un détenteur d'une entité peut modifier ses données.
6. Seulement un détenteur d'une entité peut lier son entité à d'autres entités. Via les champs respectifs (selon les données de l'entité). 
	1. Qui n'existait pas encore dans le système (voir les entités orphelines).
	2. Ou qui existe déjà dans le système.
7. Lors de la création d'une nouvelle entité, un utilisateur peut :
	1. Garder la détention de la nouvelle entité.
	2. Marqué l'entité comme orpheline, appelée entité zombie par l'équipe.
	3. N'importe qui peut demander la propriété d'une fiche.

## Les entités orphelines
1. Les entités orphelines peuvent être ajoutées avec le contenu obligatoire seulement.
	1. Le contenu obligatoire varie selon le type d'entité.
2. Les entités orphelines peuvent être modifiées pour tous les utilisateurs
3. L'utilisateur qui a créé l'entité orpheline en l'assignant dans une autre entité est cité dans la création de la fiche.
4. Les entités orphelines peuvent être réquisitionnées par un utilisateur.

## Utilisateurs
1. Donnée partagée publiquement
	1. Nom d'utilisateur public associé aux modifications d'une entité.

## Endossement des données d'une entité
Afin de déterminer la qualité des données d'une entité.

## Proposition de modifications d'une entité
1. N'importe quel utilisateur peut proposer des modifications de données
2. Seulement le détenteur peut accepter ou non la modification.
3. Les modifications suggérées sont visibles seulement par le détenteur.
4. Quel procédé on choisit pour qu'un utilisateur puisse prendre la détention d'une entité.

## Proposition d'assignation
Un utilisateur détenant une entité peut accepter ou non une assignation

## Idées
\+ Ajouter des modes de détentions granulaires pour des entités : 
	- full open 
	- Partiels (certains champs)
	- Plein contrôle (version 1)
\+Les utilisateurs peuvent suggérer des modifications.
	- Un utilisateur choisit comment les propositions de modifications sont appliquées.
		- Tout de suite
		- Avec approbation
		- Jamais
		- Ajouter un mode temps de la suggestion, après un certain temps la suggestion peut être endossée ?

## Questions
1. Est-ce qu'une taxonomie peut être ajoutée par un utilisateur, mais ne pas être détenue ?
2. Est-ce qu'on crée un profil utilisateur qui montre publiquement toutes les entités détenues par un utilisateur ? Historique ? Autres ?
3. Qui détermine qu'un détenteur est légitime ?

## Vocabulaire
- **Propriété** : Le terme est utilisé comme traduction à ownership et non pour référer à une propriété intellectuelle, dans le sens légal de propriété.
- **Détenteur** : l'utilisateur à l'origine de l'ajout d'une entité
- **Détentions granulaires** : mode de détention segmenté en plusieurs parcelles avec chacune ses règles d'accès.
- **Codétenteurs** : Les utilisateurs détenant une détention granulée de l'entité
- **Entité** : Un élément principal dans la structure des données qui se traduisent par : personne, organisation, projet, événement, lieux, équipement, etc. 
	- Une entité est consultée grâce à une fiche visible de plusieurs méthodes. 
		- Méthode simple (information réduite) et 
		- Méthode complète, avec toutes les données associées à l'entité. 
		- Méthode donnée : les données brutes de l'entité souvent appelée comprenant les métadonnées.
- **Entité orpheline** : Une entité qui n'a pas de détenteur.
- **Taxonomies** : un élément qui classe une entité, qui la caractérise afin de construire une structure intelligible des données.
- **Environnement Avantage numérique** : comprends l'API et l'Application.
- **Permission de modification** : comprends un accès d'édition (ou dite contribution dans l'application) pour ajouter et modifier du contenu et média).
- **Endossement** : une personne peut endosser une donnée d'une fiche pour renforcir la valeur de la donnée.

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
