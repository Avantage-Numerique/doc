tag : #documentation_technique 

## Objectifs
Améliorer le UX et la navigation dans le site grâce à la page consulter les données.


## [[Brainstorm]] pour Consulter
Il faut au minimum que les breadcrumbs reviennent vers là lorsqu'on est dans une fiche single d'entité.

## [[Conception]] pour Consulter

Pour ajouter les belles urls dans consulter les données, on va utiliser la fonctionnalité de catch all du router.
## Structure

### L'URL
Il faut que le fichier de consulter change en :
`[[...entity]].js` dans le dossiers consulter du page router.
C'est une dynamique routes catch all : https://nextjs.org/docs/pages/building-your-application/routing/dynamic-routes

```javascript
const router = useRouter();  
const targetEntity = router.query.entity ?? "all";  
console.log(targetEntity);
```
Ici ça retourne : `["personnes"]`, si on a a consulter avec l'url :
`/consulter/personnes`. Et ça reste de la place pour ajouter nos prochaines étapes. Soit avec plus de `/x/y`, mais aussi avec le classique `?category=z`
### Exemple

```javascript

```


## Todo


## Planifié
