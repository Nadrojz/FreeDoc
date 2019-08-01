# README


Ce programme va générer grâce à la gem 'faker' des docteurs et des patients puis leur assigner une date et une ville de rendez vous.
Pour générer des docteurs, patients et rendez vous, lancer la commande rails db:seed
Cela permettra de remplir les tables de la BDD avec les informations contenues dans le fichier db/seeds.rb
Il est conseillé d'utiliser la gem 'table_print' pour afficher les tables dans la console rails avec la commande "tp Nomdelatable.all"


La table doctors est composée des colonnes suivantes :
* ID
* first_name
* last_name
* zip_code
* specialty
et chaque objet de la table sera lié à la table cities via la foreign key city_id


La table patients est composée des colonnes suivantes :
* ID
* first_name
* last_name
et chaque objet de la table sera lié à la table cities via la foreign key city_id


La table appointments est composée des colonnes suivantes :
* ID
* Date
et chaque objet de la table sera relié, via des foreign key, aux tables doctors, patients et cities
