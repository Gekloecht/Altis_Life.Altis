/*
	File: fn_gatherCocaine.sqf
	
	Description:
	Gathers cocaine?
*/
private["_sum"];
_sum = ["cocaine",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_inUse = true;
	titleText["Collecte Cocaine...","PLAIN"];
	titleFadeOut 5;
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 5;
	if(([true,"cocaine",1] call life_fnc_handleInv)) then
	{
		titleText["Vous ramassez de la Cocaine.","PLAIN"];
		playSound "bag";
	};
};

life_action_inUse = false;