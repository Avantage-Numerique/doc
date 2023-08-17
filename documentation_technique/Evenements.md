# Événements
tag : #documentation_technique #events

## Objectifs
Permet d'ajouter une entité événements dans la structures et de présenter dans le temps une activités relié à un projet ou une organisation.

### Peut s'ajouté à 
- Organisation
- Projet
- Personne ?

## [[Brainstorm]] pour Evenements
On était pas certain de la structutre.
Finalement on y va que tout les événements ont la même structure. Et certain peuvent avoir des sous-événements.

## [[Conception]] pour Evenements
Les événements vont avoir une entité propre (pas une extension de projet par exemple).
Les événements seront hiearchique, avec des sous-événements.


## Structure

```javascript
schema: Schema =  
new Schema<EventSchema>(
{  
	name: {  
		type: String,  
		minLength: 2,  
		required: true  
	},  
	slug: {  
		type: String,  
		slug: "name",  
		slugPaddingSize: 3,  
		index: true,  
		unique: true  
	},  
	alternateName: {  
		type: String  
	},  
	description: {  
		type: String,  
	},  
	entityInCharge: {  
		type: mongoose.Types.ObjectId,  
		//required: true,  
		ref: "Organisation"  
	},  
	organizer: {  
		type: mongoose.Types.ObjectId,  
		ref: "Organisation"  
	},  
	eventType: {  
		type : String,  
		enum: EventTypeEnum  
	},  
	team: TeamField,  
	//duration  
	//location  
	startDate: {  
		type: Date  
	},  
	endDate: {  
		type: Date  
	},  
	contactPoint: {  
		type: String  
	},  
	mainImage: {  
		type: mongoose.Types.ObjectId,  
		ref: "Media"  
	},  
	attendees : {  
		type: [mongoose.Types.ObjectId],  
		ref: "Person"  
	},  
	domains: {  
		type: [{  
			domain: {  
			type: mongoose.Types.ObjectId,  
			ref: "Taxonomy"  
		},  
			status: Status.schema  
		}]  
	},  
	skills: {  
		type: [mongoose.Types.ObjectId],  
		ref: "Taxonomy"  
	},  
		//experience  
	subEvents: {  
		type: [mongoose.Types.ObjectId],  
		ref: "Event"  
	},  
	status: {  
		type: Status.schema  
	}  
},  
{  
	toJSON: {virtuals: true},  
	timestamps: true,  
}
);
```

## Types d'événements

Pour le nom, on enlève le suffix Event, mais voici les classes présentes dans Schema.org.

1. [BusinessEvent](https://schema.org/BusinessEvent)
2. [ChildrensEvent](https://schema.org/ChildrensEvent)
3. [ComedyEvent](https://schema.org/ComedyEvent)
4. [CourseInstance](https://schema.org/CourseInstance)
5. [DanceEvent](https://schema.org/DanceEvent)
6. [DeliveryEvent](https://schema.org/DeliveryEvent)
7. [EducationEvent](https://schema.org/EducationEvent)
8. [EventSeries](https://schema.org/EventSeries)
9. [ExhibitionEvent](https://schema.org/ExhibitionEvent)
10. [Festival](https://schema.org/Festival)
11. [FoodEvent](https://schema.org/FoodEvent)
12. [Hackathon](https://schema.org/Hackathon)
13. [LiteraryEvent](https://schema.org/LiteraryEvent)
14. [MusicEvent](https://schema.org/MusicEvent)
15. [PublicationEvent](https://schema.org/PublicationEvent)
16. [SaleEvent](https://schema.org/SaleEvent)
17. [ScreeningEvent](https://schema.org/ScreeningEvent)
18. [SocialEvent](https://schema.org/SocialEvent)
19. [SportsEvent](https://schema.org/SportsEvent)
20. [TheaterEvent](https://schema.org/TheaterEvent)
21. [VisualArtsEvent](https://schema.org/VisualArtsEvent)

### Exemple

```javascript

```


## Todo

## Planifié
### Version 1.0.0 : Events 
- Basic name/description wysiwyg (+ tout le reste)
- Date range Date + temps start
- Date range Date + temps end
- UX pour faire le daterange 1 une interaction
### Version 1.1.0 : Sub Events
- Ajout de la prop. Sub events dans un événement.
	- Cette événement a ces sous-événements 
### Version 1.1.1 : Schedule
- On ajout au Wysiwyg un repeater pour ajouter les étapes avec :
	- Jour (range relié aux dateStart / dateEnd de l'événement parent)
	- Temps start
	- Temp end
	- Description (text || wysiwyg)
### Version 1.1.2 : UX
- Où on ajoute les subevents
	- Dans Schedule (au travers)
	- Dans un repeater à part ?
		- Ça va demander un parser.
### Version 1.2.0 Parser
- Par date/temps de sous-événements
- Par date/temps de schedule