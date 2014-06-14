/*
	File: fn_loadGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for loading cop saved gear loadout.
*/
private["_allowedItems","_loadout","_primary","_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_handle"];
_loadout = cop_gear;

_allowedItems =
[
						"arifle_sdar_F",
						"20Rnd_556x45_UW_mag",
						"hgun_P07_snds_F",
						"16Rnd_9x21_Mag",
						"hgun_ACPC2_F",
						"9Rnd_45ACP_Mag",
						"SMG_02_F",
						"30Rnd_9x21_Mag",
						"arifle_MX_Black_F",
						"arifle_MXC_Black_F",
						"arifle_MXM_Black_F",
						"30Rnd_65x39_caseless_mag",
						"srifle_EBR_F",
						"20Rnd_762x51_Mag",
						"LMG_Mk200_F",
						"200Rnd_65x39_cased_Box",
						"srifle_LRR_F",
						"7Rnd_408_Mag",
						"acc_flashlight",
						"optic_Holosight",
						"optic_ACO_grn_smg",
						"optic_Aco_smg",
						"optic_ACO_grn",
						"optic_Aco",
						"optic_MRCO",
						"optic_Hamr", 
						"optic_Arco",														
						"optic_LRPS",
						"optic_SOS",
						"optic_tws",
						"B_UavTerminal",
						"acc_pointer_IR",							
						"optic_DMS",
						"MiniGrenade",
						"SmokeShell"
];



if(isNil "_loadout") exitWith {[] call life_fnc_copDefault;}; //Slot data doesn't exist
if(count _loadout == 0) exitWith {[] call life_fnc_copDefault;}; //Slot data doesn't exist
_primary = _loadout select 0;
_launcher = "";
_handgun = _loadout select 1;
_magazines = _loadout select 2;
_uniform = _loadout select 3;
_vest = _loadout select 4;
_backpack = _loadout select 5;
_items = _loadout select 6;
_primitems = _loadout select 7;
_secitems = _loadout select 8;
_handgunitems = _loadout select 9;
_uitems = _loadout select 10;
_vitems = _loadout select 11;
_bitems = _loadout select 12;

//Strip the unit down
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);

//Add the gear
if(_uniform != "") then {_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_vest != "") then {_handle = [_vest,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_backpack != "") then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
{
	_handle = [_x,true,false,false,false] spawn life_fnc_handleItem;
	waitUntil {scriptDone _handle};
} foreach _magazines;

if(_primary != "") then {[_primary,true,false,false,false] spawn life_fnc_handleItem;};
if(_launcher != "") then {[_launcher,true,false,false,false] spawn life_fnc_handleItem;};
if(_handgun != "") then {[_handgun,true,false,false,false] spawn life_fnc_handleItem;};

{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} foreach _items;
{[_x,true,false,false,true] call life_fnc_handleItem;} foreach (_uitems);
{[_x,true,false,false,true] call life_fnc_handleItem;} foreach (_vitems);
{[_x,true,true,false,false] call life_fnc_handleItem;} foreach (_bitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_primitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_secitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_handgunitems);  

if(primaryWeapon player != "") then
{
	player selectWeapon (primaryWeapon player);
};

// Code Added for Cop Uniform script

removeUniform player;

player addUniform "U_Rangemaster";
[] call life_fnc_copUniform; // Line added for cop uniforms