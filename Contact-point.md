tag : #documentation_technique 

## Objectifs
Ajouter plus d'outil pour personne et autres fiches.

## [[Brainstorm]] pour Contact-point
Okay, J'ai parler avec Jeanne parce que j'étais un peu perdu sur le UI et la façon d'implémenter les contactPoint.  
Résultat : Les "Liens externes" sont déjà utilisé pour faire référence au divers réseau sociaux ou site web de l'entité. On a donc pas besoin d'essayer de refaire la fonctionnalité une deuxième fois.Proposition : On modifie "contactPoint" pour un objet `contactPoint: { tel : "", mail : "", fax : "" }` , la migration parse  

if(current.contactPoint contains "@")
    new.contactPoint.mail = current.contactPoint
else
    new.contactPoint.tel = current.contactPoint

Pis on aurait un section "Informations de contact" avec 3 titre, Numéro de téléphone, Courriel, Fax, qui s'affiche si remplis.La migration remplace tout les schémas présentement, l'escouade repasse derrière pour faire sûr que tout est correct avec la migration.Et j'ajouterais dans l'entité person le même contactPoint et aussi j'ajouterais la section liens externes de plus dans person  
[@Marc-André Martin](https://avantagenumerique.slack.com/team/U0117J58GHE)  
On en dit quoi? ![:visage_légèrement_souriant:](https://a.slack-edge.com/production-standard-emoji-assets/14.0/google-medium/1f642.png) (modifié)
![[contact-point-brainstorm-img.png]]

Marc-André
Mmm on ne met pas le fax par défault ![:sueur_et_sourire:](https://a.slack-edge.com/production-standard-emoji-assets/14.0/google-medium/1f605.png)

Marc-André Martin
Je creuse plus loin pour avoir une opinion éclairé today

Marc-André Martin
On peut se sync en ligne pour brainstormer ?

Frédéric 
Ouais, on peut, soit dans 20min, soit après-midi?

Marc-André 
J'ai l'impression qu'il faudrait que ce soit plus versatile :  
genre :  

```
contactPoint: {
    {
        type: "email",
        label: "",//si default on met notre label hardcodé selon le type.
        value: "marcandre@awesome.com"
    },
    ...
}
```

Frédéric 
Pourquoi un label?

et pour la migration on fait de quoi comme tu as mis si dans la valeur actuel il y a un @ on met le type à email sinon on le met à un type du genre cta ? pas nécessairement un tel ?

Marc-André Martin

Si le user veut changer : du genre  
email : ffdf@travail  
label : travailemail: asdasd@org  
label: pour mon band awesome

Marc-André Martin
c'est peut-être de l'over engenering.

Frédéric 
Je pensais au label et au type mais, jpense qu'on permet pas autre chose que tel, email, "fax?", donc si c'est juste ça on a pas besoin de type, ni de label. Et si les gens veulent mettre d'autre numéro, ils peuvent dans a-propos ou qqch, mais pas là. Jeanne soulevait qu'on veut 1: pas qu'ils mettent trop d'information de contact pcq ça devient mélângeant de comment les contacter, 2: si y'a moins d'info de contact, c'est plus clair et moins de chance qu'ils mettent des informations sensible. (Genre qqn met son courriel pro, privé, son tel de bureau, et son tel perso)

Marc-André 
Plus ce pm stp. Tu as un cours auj ?

Frédéric Rivard
Ouais, ce midi, je reviens vers 13h, jvais probablement manger un peu, 13h30 mettons?

Marc-André Martin
excellent ![:visage_légèrement_souriant:](https://a.slack-edge.com/production-standard-emoji-assets/14.0/google-medium/1f642.png)

tel, email, url 3 choix

On ajouter le besoin de l'extension.
## [[Conception]] pour Contact-point

Le call to action - moyen de contact principale.
- Tel, email, url 3 choix, (toujours les 3 affichés dans le formulaires)
- Pas obligé à remplir
Au front end
On met le cta en avant plan dans la colonne de droite en haut d'emplacement par exemple.
Et on affiche un label CTA par exemple : Contacter l'`entity.name`.
avec en dessous un bouton par cta remplis.

Titre : Contact
avec un icone par item rempli : 
icone tel, icone email, icone link (soir la chaine ou le external)

## Structure

Schema version 1
```javascript
contactPoint: { 
	email: {
		address:"", 
		//label:"", 
		//subject:"",
		//body:""
	},
	website: {
		url: ""
	},
	tel: {
		num:""
		ext:""
		//inter:""
		...
	}
}
```

### Au front end :
On ajoute le subject + le body dans le lien mailto :
le titre de la section sera fixe dans le frontend aussi.

```javascript

```
### Exemple

```javascript

```


## Todo


## Planifié
