tag : #documentation_technique 

# Modération

## Objectifs
Permettre le contrôle des entités par des utilisateurs responsables et engagés tout en favorisant l'ajout de données avec le moins de limitations possibles.

## Brainstorm pour modération
Voir [le document de résumé de la rencontre stratégique ](https://docs.google.com/document/d/1h7X1RDSLDFznKng82zCB0y5zhOoJHq-L0ugmJkLKSJw/edit)
Voir [la version 1 de la modération](/documentation_technique/moderationv1.md)
Voir [le document de présentation pour la version 1 de la modération](https://docs.google.com/document/d/1-siHaZvm7BFsZQbZmsE-7j8olRUvDJ3qZKpn9359E9M/edit?usp=sharing)

## Conception pour modération

Une section de vocabulaire est présente à la fin de la page.

## Algorithme de modération

- Un utilisateur peut ajouter des entités (voir définition entités)
- Un utilisateur doit être connecté dans l'application pour ajouter, modifier ou enlever du contenu.
	- Le pseudonyme de l'utilisateur à l'origine de l'ajout ou de la modification du contenu est inscrit dans l'historique de la fiche de l'entité.
	- L'utilisateur doit confirmer la politique de gestion des données comme quoi il possède les droits ou l'autorisation de partager les données.
- Un utilisateur peut utiliser la fonctionnalité *Signalement* pour indiquer à l'équipe de modération un contenu ne convenant pas aux politiques d'utilisations.

## Les entités rapides

Les entités rapides sont créés via les champs d'une autre entité. Elles ne contiennent que les champs principaux obligatoires.

Champs obligatoires: 
	- nom

## Utilisateurs

- Donnée partagée publiquement :
	- Le nom d'utilisateur public associé à la modification d'une entité.
	- Les modifications aux entités
	- La date et l'heure de modification
    
- Donnée conservées sur la base de donnée :
	- Nom d'un utilisateur
	- Courriel d'un utilisateur
	- Nom d’utilisateur public
	- Toutes modifications faites à une entité par un utilisateur

## Endossement des données d'une entité

La qualité des données d'une entité est déterminée par une jauge de qualité sur la fiche basée sur une échelle.

**TO BE DEFINED**

## Terme d'utilisation

- Valider que l'utilisateur possède les droits ou les autorisations nécessaires pour partager la donnée.
- 
## Vocabulaire
- **Endossement** : une personne peut endosser une donnée d'une fiche pour renforcir la valeur de la donnée.
- **Entité** : dans la structure des données, elles se traduisent par : personne, organisation, projet, événement, lieux et équipement.
	- Une entité est consultée grâce à une fiche visible de plusieurs méthodes :
		- Méthode simple : avec informations réduites;
		- Méthode complète : avec toutes les données associées à l'entité;
		- Méthode donnée : les données brutes de l'entité comprenant les métadonnées.
- **Environnement Avantage numérique** : comprends l'API et l'Application.
- **Taxonomies** : un élément qui classe une entité, qui la caractérise afin de construire une structure intelligible des données.
- **Signalement** : cette fonctionnalité consiste en l'envoie d'un billet de support à l'équipe de modération


### Permissions d'un utilisateur
```javascript

```

## À faire

- Guide de bonne rédaction (charte de rédaction)
- Terme d'utilisation (Term of use)
---
→ [Retour à la table des matières de la documentation technique](/documentation_technique/index.md)