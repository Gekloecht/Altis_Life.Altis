/*
	File: fn_onTake.sqf
	Author: Mario2002
	
	Description:
	gets called when a player is taking something out of container
*/
private["_item", "_container", "_unit", "_house", "_owner", "_isLocked"];

_unit = [_this,0] call BIS_fnc_param;
_container = [_this,1] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;
_house = nearestObject [position player, "House_F"];
_owner = _container getVariable ["owner", ""];
_isLocked = _house getVariable["storage_locked", 0];

	if(typeOf _container == "B_supplyCrate_F") then {
		
		//modified 05/10/2014
		if(_owner == "") exitWith {
		(FindDisplay 602) closeDisplay 1;
		_handle = [] spawn life_fnc_sessionUpdate;
		};
		//----------------------
		
		_wc = getWeaponCargo _container;
		_mc = getMagazineCargo _container;
		_ic = getItemCargo _container;
		_bc = getBackpackCargo _container;

		//hint format ["take %1 %2 %3 %4 %5 %6 %7", _unit, _wc, _mc, _ic, _bc, _item, _owner];
		//hint format ["%1", typeOf _item];
		///[false,_item,1] call life_fnc_handleInv;
		_handle = [] spawn life_fnc_sessionUpdate;
		sleep 0.5;

		[[_house, [_wc, _mc, _ic, _bc]],"BRUUUDIS_fnc_updateHouseWeaponStorage",false,false] spawn BIS_fnc_MP;
	};

//_handle = [] spawn life_fnc_sessionUpdate;