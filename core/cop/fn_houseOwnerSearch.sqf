#include <macro.h>
/*
*/
private["_house","_owner"];
_house = cursorTarget;
if(isNull _house) exitWith {hint "Il n y a pas de maison ciblée"};
if(!(_house isKindOf "House_F")) exitWith {};

_owner = _house getVariable ["life_homeOwnerName", []];

if(count _owner == 0) then {
	hint "Cette maison est inoccupée.";
} else {
	hint format ["Le propriétaire de cette magnifique habitation est %1", (_owner select 0)];
};


