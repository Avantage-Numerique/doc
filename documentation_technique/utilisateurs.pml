@startuml "Permissions utilisateurs"  

entity "Entité" as e {
	Type : String
	---
	Propriétés reliées à la modération
	*Détenteur
	*historique
	---
	Permissions nécessaires
	*Créer
	*Modifier
	*Transférer la détention   
}
entity  "Utilisateur" as user {
	*Profil
	Permissions détenues
	*Détenter
	*Créer
	*Modifier
	*Transférer
}
user::Détenter o-r- e::Détenteur

@enduml