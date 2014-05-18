/*
	File: fn_vehicleGarage.sqf
	Author: Skalicon
	
	Description:
	Handles everything that happens when you open the vehicle garage.
*/

private ["_marker"];

if ((player distance cursorTarget) > 5) exitWith {hint "Tu es trop loin pour pouvoir utiliser ce PNJ."};
if (vehicle player != player) exitWith {hint "Tu ne peux pas utiliser le PNJ tant que tu es dans un véhicule."};
if (cursorTarget isKindOf "House") then
{
	_marker = format["%1", [cursorTarget] call life_fnc_getBuildID];
	if ((getMarkerPos _marker) select 0 == 0) then
	{
		_position = [10, position cursorTarget, direction cursorTarget, 270] call life_fnc_calcGarageSpawn;
		_marker = createMarker [_marker, _position];
		_markerstr setMarkerShape "ICON";
		_marker setMarkerType "hd_arrow";
		_marker setMarkerDir (direction cursorTarget);
		_marker setMarkerAlpha 0;
	};
	//life_veh_sp = _marker;
	life_garage_sp = _marker;
}
else
{
	[_this select 0] call life_fnc_getSpawnMarker;
};
life_garage_type = "Car";
[[getPlayerUID player,playerSide,life_garage_type,player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;
createDialog "Life_impound_menu";
disableSerialization;
ctrlSetText[2802,"Recherche des véhicules...."];

