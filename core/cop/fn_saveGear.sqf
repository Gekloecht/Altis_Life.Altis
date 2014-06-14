/*
	File: fn_saveGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Saves the player / cops gear in a formatted array.
*/
private["_primary","_allowedItems","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_curWep"];

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


//Old format / code
_primary = primaryWeapon player;
_handgun = handGunWeapon player;
_magazines = [];
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;
_items = assignedItems player;
_primitems = primaryWeaponItems player;
_secitems = secondaryWeaponItems player;
_handgunitems = handGunItems player;
_uitems = [];
_vitems = [];
_bitems = [];

if(_uniform != "") then {{_uitems set[count _uitems,_x];} foreach (uniformItems player);};
if(_vest != "") then {{_vitems set[count _vitems,_x];} foreach (vestItems player);};
if(_backpack != "") then {{_bitems set[count _bitems,_x];} foreach (backPackItems player);};

if(goggles player != "") then { _items set[count _items, goggles player]; };
if(headgear player != "") then { _items set[count _items, headgear player]; };
if(count (primaryWeaponMagazine player) > 0) then
{
	{
		_magazines set[count _magazines,_x];
	} foreach (primaryWeaponMagazine player);
};

if(count (handgunMagazine player) > 0) then
{
	{
		_magazines set[count _magazines,_x];
	} foreach (handgunMagazine player);
};

//Hard code for Laser Desigantor batteries
_curWep = currentWeapon player;
if("Laserdesignator" in assignedItems player) then
{
	player selectWeapon "Laserdesignator";
	if(currentMagazine player != "") then {_magazines set[count _magazines,(currentMagazine player)];};
};

player selectWeapon _curWep;

cop_gear = [_primary,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems];