#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_houseStoreItem.sqf
	Author: Mario2002
	
	Description:
	store an item in a house
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val"];
disableSerialization;

_ctrl = ctrlSelData(8503);
_num = ctrlText 8506;
if(!([_num] call fnc_isnumber)) exitWith {hint "Format du Nombre Invalide";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Tu ne peux pas rentrer un nombre inférieur à 1 !";};

_weight = 0;
_used = (cursorTarget getVariable ["Trunk", [[],0]]) select 1;
_boxes = nearestObjects [position player, ["Land_Box_AmmoOld_F","B_supplyCrate_F"], 5];
{	
	_box_data = [_x] call life_fnc_vehicleWeight;
	_weight = _weight + (_box_data select 0);
	_used = _used + (_box_data select 1);
}forEach _boxes;

_totalWeight = [_weight, _used];
//diag_log format ["TOTAL WEIGHT : %1", _totalWeight];
//_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call fnc_index;
	if(life_cash < _num) exitWith {hint "Tu n as pas assez de monnaie sur toi pour le positionner dans cet élément !"};
	if(_index == -1) then
	{
		_inv set[count _inv,[_ctrl,_num]];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_cash = life_cash - _num;
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_houseInventory;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Cet élément est plein ou ne peut pas en contenir autant."};

	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Impossible de supprimer autant de ces objets de ton inventaire pour les insérer dans cet élément.";};
	_index = [_ctrl,_inv] call fnc_index;
	if(_index == -1) then
	{
		_inv set[count _inv,[_ctrl,_num]];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_houseInventory;
};
