#include <macro.h>
/*
	File: fn_houseMenu.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Shows house ownership menu
*/
private["_house","_owners","_locked","_owner","_price"];
if(dialog) exitWith {};
_house = cursorTarget;
if(isNull _house || !(_house isKindOf "House")) exitWith {systemChat "Bad House";};

if(!createDialog "HouseMenu") exitWith {"Echec de création de la fenêtre de dialogue";}; //Couldn't create the menu?
disableSerialization;
ctrlSetText[12501,format["Maison - %1",getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName")]];

_owners = _house getVariable["life_homeOwners", []];
_owner = (getPlayerUID player) in _owners;
_price = [typeOf _house] call life_fnc_housePrice;

if(__GETC__(life_donator) >= __GETC__(HOUSING_DONATOR_LEVEL)) then {
	if (_owner) then
	{
		_price = _price * 0.75;	// Sell price is 3/4 full cost
		ctrlSetText[12504,format["Tu es le propriétaire de ce bâtiment."]];
		ctrlSetText[12508,format["Prix de vente : %1€",[_price] call life_fnc_numberText]];
		ctrlShow[12512,false];
	}
	else
	{
		ctrlShow[12516,false];
		ctrlSetText[12508,format["Valeur immobilière : %1€",[_price] call life_fnc_numberText]];
		if ((count _owners) > 0) then
		{
			ctrlSetText[12504,format["Cette propriété est déjà occupée."]];
			ctrlShow[12512,false];
		}
		else
		{
			ctrlSetText[12504,format["Cette propriété est sur le marché !"]];
		};
	};
} else {
	ctrlSetText[12504,format["Tu dois être donateur rang %1 pour acheter une maison.", __GETC__(HOUSING_DONATOR_LEVEL)]];
	ctrlShow[12512,false];
	ctrlShow[12516,false];
	ctrlShow[12508,false];
};