#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret set[count _ret,["U_Rangemaster","Cop Uniform",25]];
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret set[count _ret,["U_B_CombatUniform_mcam_tshirt",nil,350]];
			_ret set[count _ret,["U_B_survival_uniform",nil,1250]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret set[count _ret,["U_B_CombatUniform_mcam_worn",nil,550]];
		};
		[] call life_fnc_copUniform;
	};
	
	//Hats
	case 1:
	{
		_ret set[count _ret,["H_Cap_blu_POLICE",nil,35]];
		
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret set[count _ret,["H_Beret_blk_POLICE",nil,110]];
			_ret set[count _ret,["H_HelmetB_plain_mcamo",nil,75]];
			_ret set[count _ret,["H_Booniehat_mcamo",nil,120]];
		};

		if(__GETC__(life_coplevel) > 5) then
		{
			_ret set[count _ret,["H_MilCap_mcamo",nil,100]];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		_ret set[count _ret,["V_Rangemaster_belt",nil,800]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["V_TacVest_blk_POLICE",nil,1500]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret set[count _ret,["V_PlateCarrier1_blk",nil,3000]];
		};
		[] call life_fnc_copUniform;
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_AssaultPack_rgr",nil,800],
			["B_AssaultPack_blk",nil,800],
			["B_Kitbag_mcamo",nil,1000],
			["B_Bergen_blk",nil,1200],
			["B_Bergen_mcamo",nil,1200],
			["B_TacticalPack_mcamo",nil,1400],
			["B_TacticalPack_blk",nil,1400],
			["B_TacticalPack_rgr",nil,1400],
			["B_Carryall_mcamo",nil,2000],
			["B_Carryall_khk",nil,2000],
			["B_UAV_01_backpack_F",nil,4800]
		];
	};
};

_ret;