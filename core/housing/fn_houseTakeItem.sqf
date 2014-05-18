#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_houseTakeItem.sqf
	Author: Mario2002
	
	Description:
	take an item from a house
*/
private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];
disableSerialization;
if(isNull life_trunk_vehicle OR !alive life_trunk_vehicle) exitWith {hint "Cet élément n existe pas ou a été détruit."};
if(!alive player) exitwith {closeDialog 0;};

if((lbCurSel 8502) == -1) exitWith {hint "Tu dois sélectionner un objet !";};
_ctrl = ctrlSelData(8502);
_num = ctrlText 8505;
if(!([_num] call fnc_isnumber)) exitWith {hint "Format du Nombre Invalide";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Tu ne peux pas rentrer un nombre inférieur à 1 !";};

_index = [_ctrl,((life_trunk_vehicle getVariable "Trunk") select 0)] call fnc_index;
_data = (life_trunk_vehicle getVariable "Trunk") select 0;
_old = life_trunk_vehicle getVariable "Trunk";
if(_index == -1) exitWith {};
_value = _data select _index select 1;
if(_num > _value) exitWith {hint "Cet élément ne contient pas autant de cet objet."};
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Ton inventaire est plein."};
_weight = ([_ctrl] call life_fnc_itemWeight) * _num;
if(_ctrl == "money") then
{
	if(_num == _value) then
	{
		_data set[_index,-1];
		_data = _data - [-1];
	}
		else
	{
		_data set[_index,[_ctrl,(_value - _num)]];
	};
	
	life_cash = life_cash + _num;
	life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
	[life_trunk_vehicle] call life_fnc_houseInventory;
}
	else
{
	if([true,_ctrl,_num] call life_fnc_handleInv) then
	{
		if(_num == _value) then
		{
			_data set[_index,-1];
			_data = _data - [-1];
		}
			else
		{
			_data set[_index,[_ctrl,(_value - _num)]];
		};
		life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
		[life_trunk_vehicle] call life_fnc_houseInventory;
	}
		else
	{
		hint "Impossible de l ajouter à ton inventiare, serais tu plein ?";
	};
};