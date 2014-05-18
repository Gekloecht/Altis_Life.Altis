/*
	File: fn_gatherApples.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gathers apples?
*/
private["_sum"];
_sum = ["apple",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_in_use = true;
	titleText["Collecte de Pommes...","PLAIN"];
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 2;
	if(([true,"apple",_sum] call life_fnc_handleInv)) then
	{
		titleText[format["Vous ramassez %1 Pomme",_sum],"PLAIN"];
		playSound "bag";
	};
}
	else
{
	hint "Votre Inventaire est plein.";
};

life_action_in_use = false;
