/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
format["Bonjour %1, Lis c'est important!",name player] hintC
[
	"Bienvenue sur le serveur, avec cette MaJ, beaucoup de choses ont changé.",
	"Touche a été ajoutée pour remplacer tout les coups molette de la souris, la touche [Windows gauche] par défaut, permet de faire afficher les différents menus. 
	 Bien sur on peut la changer dans ECHAP -> Configurer -> Commandes -> Commandes Personalisées et mettre le raccourci souhaité dans [Util.Action 10] ",
	"Cette touche permet de ramasser les objets et l'argent",
	"De pêcher",
	"Intéragir avec les joueurs (en temps que policier)",
	"Intéragir avec les véhicules (Reparer ect.. et afficher le menu en tant que policier",
	"Si tu as des difficultés a cibler l'objet sur lequel tu veux intéragir, utilise la touche [²]",
	"Bon jeu à tous sur le serveur AltisLifeFr.com !"
];
	