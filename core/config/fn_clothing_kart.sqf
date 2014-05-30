/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_C_Driver_1_black",nil,2500],
			["U_C_Driver_1_blue",nil,2500],
			["U_C_Driver_1_red",nil,2500],
			["U_C_Driver_1_orange",nil,2500],
			["U_C_Driver_1_green",nil,2500],
			["U_C_Driver_1_white",nil,2500],
			["U_C_Driver_1_yellow",nil,2500],
			["U_C_Driver_2",nil,5000],
			["U_C_Driver_1",nil,5000],
			["U_C_Driver_3",nil,5000],
			["U_C_Driver_4",nil,5000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_RacingHelmet_1_black_F",nil,2000],
 			["H_RacingHelmet_1_red_F",nil,2000],
 			["H_RacingHelmet_1_white_F",nil,2000],
 			["H_RacingHelmet_1_blue_F",nil,2000],
 			["H_RacingHelmet_1_yellow_F",nil,2000],
 			["H_RacingHelmet_1_green_F",nil,2000],
 			["H_RacingHelmet_1_F",nil,3000],
 			["H_RacingHelmet_2_F",nil,3000],
 			["H_RacingHelmet_3_F",nil,3000],
 			["H_RacingHelmet_4_F",nil,3000]
			
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,30]
		];
	};
	
	//Vest
	case 3:
	{
		[
		];
	};
	
	//Backpacks
	case 4:
	{
		[
		];
	};
};