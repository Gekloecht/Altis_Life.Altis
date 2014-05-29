enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

// enable logistics
_logistic = execVM "=BTC=_Logistic\=BTC=_Logistic_Init.sqf";

if(!isDedicated) then { X_Client = true;};
/*
if(isNull player) then 
{
	if(!X_JIP && !isServer) then
	{
		[] spawn (compile PreprocessFileLineNumbers "core\jip.sqf");
	};
	X_JIP = true;
};
*/
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.2";
/*
if(X_Client) then
{
	[] execVM "core\init.sqf";
};
*/
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "admin\fn_loop.sqf";
if(!StartProgress) then
{
	[8,true,true,12] execFSM "core\fsm\timeModule.fsm";
	//[8,true,false] execFSM "core\fsm\core_time.fsm";
};
StartProgress = true;
publicVariable "life_revivecash";
