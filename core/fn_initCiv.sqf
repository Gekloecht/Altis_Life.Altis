/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
[] call life_fnc_initHouses;
private["_spawnPos"];

civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_u_House_Big_01_V1_F","Land_u_Shop_01_V1_F","Land_u_House_Big_02_V1_F","Land_u_Shop_02_V1_F","Land_u_House_Small_01_V1_F","Land_u_House_Small_02_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_u_House_Big_01_V1_F","Land_u_Shop_01_V1_F","Land_u_House_Big_02_V1_F","Land_u_Shop_02_V1_F","Land_u_House_Small_01_V1_F","Land_u_House_Small_02_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_u_House_Big_01_V1_F","Land_u_Shop_01_V1_F","Land_u_House_Big_02_V1_F","Land_u_Shop_02_V1_F","Land_u_House_Small_01_V1_F","Land_u_House_Small_02_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_u_House_Big_01_V1_F","Land_u_Shop_01_V1_F","Land_u_House_Big_02_V1_F","Land_u_Shop_02_V1_F","Land_u_House_Small_01_V1_F","Land_u_House_Small_02_V1_F"],250];

waitUntil {!(isNull (findDisplay 46))};

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
	else
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};

[] execVM "msgbienvenueCiv.sqf";
player addRating 9999999;

[] call life_fnc_zoneCreator;
[] call life_fnc_copUniform; // Line added for Cop Uniforms