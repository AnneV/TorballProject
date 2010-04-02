
Démarche à effectuer pour mettre à jour le dépôt
================================================================================

Mettre à jour le depôt git:
``git pull origin master``

Mettre à jour la base de données


``cd torball``

``rake db:migrate``

Lancer le serveur

``script/server``

Et dans firefox, aller à l'adresse suivante : 
``http://localhost:3000``

Installations nécessaires
================================================================================

*db_populate* : sudo gem install db_populate
