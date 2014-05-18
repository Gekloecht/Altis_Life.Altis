/*
	Mario2002
*/
private["_house","_upp","_ui","_progress","_pgText","_cP","_displayName","_search"];
_house = cursorTarget;
_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
if(isNull _house) exitwith {};
_search= {_x != player && side _x == west && alive _x && player distance _x < 100} count playableUnits > 1;
if(!(_search)) exitWith {hint "Il n'y a pas assez de flic à proximité !"};
sleep 3;

if(_house isKindOf "House_F") then
{
	_owner = _house getVariable["life_homeOwnerName", []];
	[[0,format["%1, votre maison est en train de subir un raid par les gendarmes!", (_owner select 0)]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_upp = format["Déverrouillage %1",_displayName];
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	
	while{true} do
	{
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
			[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};
		sleep 0.27;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
	};
	
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	_house setVariable ["life_locked", 0];
	for "_i" from 1 to _numDoors do
	{
		_house setVariable[format["bis_disabled_Door_%1", _i], 0, true];
	};
	titleText["Vous avez ouvert cette maison.","PLAIN"];
};