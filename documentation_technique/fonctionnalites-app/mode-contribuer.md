tag : #documentation_technique 

## Objectifs
Permettre de contribuer à la BDSOL avec un flow plus direct entre les données requises et les données additionnels non mandatoires.

## [[Conception]] et [[brainstorm]] de mode-contribuer

### Flow de l'utilisateur pour contribuer
1. Arriver sur l'accueil du site
2. Accède à une page d'une entité (organisation par exemple)
3. Si l'utilisateur n'est pas connecté
	1. L'utilisateur voit la page de l'entité tel quel, sans bouton contribuer.
	2. L'utilisateur voit la page avec un CTA : `pour contribuer il faut se connecter.`
	3. S'il se connecte, il revient à la même page
4. Si l'utilisateur est connecté
	1. L'utilisateur voit un bouton pour contribuer.
5. Lorsque l'utilisateur clique sur le bouton contribuer.
	1. Il est redirigé sur /contribuer/` [type de l'entité] `/ `[slug de l'entité]`

### Flow de l'utilisateur en mode `Update`
1. À partir de la vue `entitySingleContribute` l'utilisateur voit l'entité comme en mode `singlePublic`.
2. Chaque élément éditable est affiché avec un champ éditable selon sont type.
	1. Champs de type textarea (WYSIWYG)
	2. Champs de texte esimple (Input)
	3. Champs de type checkbox
	4. Champs personnalité à notre application :
		1. Repeater
		2. Select2
		3. SelectTag
		4. etc.
3. Les éléments qui nécessistent un contexte avec le modal sont déclenché par un bouton
	1. Pour uploader l'image principale / modifier
	2. Pour uploader la galerie médias
4. Le `entitySingleContribute` contient plusieurs form indépendant.

### Flow de l'utilisateur en mode `Create`
1. L'utilisateur clique sur le bouton `ajouter une entité` directe ou clique sur le bouton contribuer.
2. L'utilisateur est redirigé vers la même `entitySingleContribute` en mode `create`.
	1. Lors de l'arrivé sur la page `entitySingleContribute` un modal apparaît avec :
		1. Tout les champs requis pour créer la fiche de base
		2. Lors du save du modal s'enlève et fait place à la `entitySingleContribute` se popule avec les données de l'entité créer, en mode `update`.
		3. Et on va dans le mode : [[#Flow de l'utilisateur en mode `Update`]]

## Structure

```javascript

```

### Exemples

```javascript

```