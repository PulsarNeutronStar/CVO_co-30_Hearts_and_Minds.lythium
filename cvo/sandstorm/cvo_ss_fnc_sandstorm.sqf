// by Zorn - Based on ALIAS' Duststorm Script
// Gradual Dust Storm SCRIPT 

if (!isServer) exitWith {};
if (!canSuspend) exitWith {_this spawn cvo_ss_fnc_sandstorm};

if (isNil "cvo_ss_running") then 	{cvo_ss_running = false; publicVariable "cvo_ss_running";};
if (cvo_ss_running) exitWith 	{diag_log "[CVO] [Sandstorm] (Start) - Exit: Duststorm already running!";};

params [
	["_duration", 30, [0]],
	["_direction", windDir, [0]]
];


// converts _duration from minutes into secounds.

_duration = _duration * 60;

// ######### 
// Establish Killswitch
cvo_ss_running = true;
publicVariable "cvo_ss_running";
sleep 5;
diag_log ("[CVO] [SandStorm] (Storm) - Start - " + format ["Duration: %1sec - Direction: %2", _duration, _direction]);

// ######### 
// Phase Definition
cvo_ss_phasetime = (_duration / 10);
publicVariable "cvo_ss_phasetime";
cvo_ss_phase = 0;


// ######### 
// Pace Maker
[_duration] spawn {
	params ["_duration"];

		diag_log ("[CVO] [SandStorm] (PaceMaker) - Init");

	
	while { cvo_ss_running && ( cvo_ss_phase <= 10 ) } do {
		cvo_ss_phase = cvo_ss_phase + 1;
		publicVariable "cvo_ss_phase";
		sleep cvo_ss_phasetime;
		diag_log ("[CVO] [SandStorm] (Phase) - " + format ["Current Phase: %1 ", cvo_ss_phase]);
	};

	cvo_ss_running = false;
	publicVariable "cvo_ss_running";

	diag_log ("[CVO] [SandStorm] (Phase) - " + format ["Current Phase: %1 ", cvo_ss_running]);

	sleep 10;
	cvo_ss_phase = nil;
	diag_log ("[CVO] [SandStorm] (PaceMaker) - Exit");
};

// ####################################
// INIT cvo_sandstorm_Effects.sqf for local effects

[[],"cvo\sandstorm\cvo_ss_fnc_effects.sqf"] remoteExec ["execVM",0,true];


// ####################################
// Weather Control



// ######### 
// Store Pre-Storm Weather Data

ss_foglevel			= fogParams;
ss_overcast			= overcast;
ss_rainlevel		= rain;
ss_thundlevel		= lightnings;
ss_wind				= wind;
ss_windstr			= windStr;
ss_windgusts		= gusts;


// ######### 
// Simple Weather Control during the Storm


(cvo_ss_phasetime * 4) setOvercast ((5 + floor random 5)/10);
[] spawn {
	(cvo_ss_phasetime * 1) setRain 0;
	waitUntil {sleep (1 * cvo_ss_phasetime); true};
	if (!cvo_ss_running) 	exitWith {};
	(cvo_ss_phasetime * 7) setRain 0;
	waitUntil {sleep (7 * cvo_ss_phasetime); true};
	if (!cvo_ss_running) 	exitWith {};
	(cvo_ss_phasetime * 8) setRain ((5 + floor random 5)/10);
};


// #########
// FOG CONTROL

[] spawn {
	diag_log ("[CVO] [SandStorm] (FogControl) - Init");

	//  ######## Definition
	_ss_fog_stage	= [0.03, 0.005, 200];
	_ss_fog_max 	= [0.03, 0.006, 600];
	_ss_fog_post	= [0.03, 0.005, 400];
	
	//  ######## Execution
	[(2 * cvo_ss_phasetime), _ss_fog_stage, true] 	spawn cvo_env_fnc_setFogFlexible;

	waitUntil {sleep (2 * cvo_ss_phasetime); true};
	if (!cvo_ss_running) 	exitWith {};


	[(2 * cvo_ss_phasetime), _ss_fog_max,true] 		spawn cvo_env_fnc_setFogFlexible;
	waitUntil {sleep (2 * cvo_ss_phasetime);true};
	if (!cvo_ss_running) 	exitWith {};


	[(2 * cvo_ss_phasetime), _ss_fog_max,true] 		spawn cvo_env_fnc_setFogFlexible;

	waitUntil {sleep (4 * cvo_ss_phasetime);true};
	if (!cvo_ss_running) 	exitWith {};

	[(3 * cvo_ss_phasetime), _ss_fog_post,true] 	spawn cvo_env_fnc_setFogFlexible;
	diag_log ("[CVO] [SandStorm] (FogControl) - Exit");
};

// #########
//  WIND CONTROL ## This is some Blackmagic voodoo shit taken directly from Alias' Sandstorm script. Only addition is is the 1. Line to avoid Devide by Zero error.

[_direction] spawn {
	waitUntil {sleep 1; cvo_ss_phase >= 3};

	diag_log ("[CVO] [SandStorm] (WindControl) - Init"); 			
	params ["_direction"];

	//  ######## Definition
	if (_direction == 0) then {_direction = 360};
	raport = 360/_direction;
	raport = round (raport * (10 ^ 2)) / (10 ^ 2);
	if (raport >= 4) then {fctx = 1; fcty = 1;}	else {if (raport >= 2) then {fctx = 1; fcty = -1;}else { if (raport >=1.33) then {fctx = -1; fcty = -1;}else {fctx = -1; fcty = 1;};};};
	if ((raport <= 2) and (raport >= 1.33)) then {fctx = -1; fcty = -1;};
	_unx	= ((_direction - floor (_direction/90)*90))*fctx;
	vx = floor (_unx * 0.6);
	vy = (54 - vx)*fcty;
	// mareste incremental vantul  ## Incremental increase of windspeed
	inx = 0;
	iny = 0;
	incr = true;
	incrx = false;
	incry = false;
 
	//  ######## Execution
	while {incr && cvo_ss_running} do 
	{
		sleep 0.1;
		if (inx < abs vx) then {inx = inx+0.01;} else {incrx = true};
		if (iny < abs vy) then {iny = iny+0.01} else {incry = true};
		if (incrx and incry) then {incr=false};
		winx = floor (inx*fctx/2);
		winy = floor (iny*fcty/2);
		setWind [winx,winy,true];
	};

	diag_log ("[CVO] [SandStorm] (WindControl) - Exit");
};

[] spawn {	// Wind Control @ EXIT
	//  ######## Waiting
	waitUntil {sleep 1; ((cvo_ss_phase >= 7) || !cvo_ss_running ) };
	diag_log ("[CVO] [SandStorm] (WindExit) - Init");

	setWind		[0,0,false];
	//  ######## Execution
	cvo_ss_phasetime setWindStr		ss_windstr;
	cvo_ss_phasetime setGusts		ss_windgusts;
	//  ######## Cleanup
	ss_wind 		= nil;
	ss_windstr 		= nil;
	ss_windgusts	= nil;
	diag_log ("[CVO] [SandStorm] (WindExit) - End");
};

[] spawn {			// Weather Control @ EXIT
	//  ######## Waiting
	diag_log ("[CVO] [SandStorm] (WeatherExit) - Init");
	waitUntil {sleep 1; !cvo_ss_running};

	//  ######## Execution
	(2 * cvo_ss_phasetime) setOvercast 		ss_overcast;
	(2 * cvo_ss_phasetime) setFog 			ss_foglevel;
	(2 * cvo_ss_phasetime) setRain 			ss_rainlevel;
	(2 * cvo_ss_phasetime) setLightnings 	ss_thundlevel;

	//  ######## Cleanup
	ss_overcast		= nil;
	ss_foglevel 	= nil;
	ss_rainlevel 	= nil;
	ss_thundlevel 	= nil;
	diag_log ("[CVO] [SandStorm] (WeatherExit) - End");
};

// ####################################
// AI SKILL CONTROL

[] spawn {
	diag_log ("[CVO] [SandStorm] (AISkill) - Init");

	// Definition of Variables
	private _mod = [
    0.4,      	//general 
    0.15,    	// aimAccuracy
    0.5,    	// aimShake
    0.4,    	// aimSpeed
    0.8,      	// endurance
    0.10,   	// spotDistance
    0.10,   	// spotTime
    0.3,    	// courage
    0.5,    	// reloadSpeed
    0.4     	// Commanding
    ];
	private _array = [];
	private _btc_AI_skill_backup = btc_AI_skill;
	for "_i" from 0 to 9 do {
		_array pushback ((btc_AI_skill select _i) * (_mod select _i));
	};
	btc_AI_skill = _array;

	//  ######## Waiting for Start
	waitUntil {sleep 10; cvo_ss_phase >= 2};								/// EXECUTE @ Phase 2

	//  ######## Execution
	{[_x] call btc_mil_fnc_set_skill;} forEach allUnits;
	diag_log ("[CVO] [SandStorm] (AISkill) - AI Skill Debuff Applied");
	

	//  ######## Waiting for End
	waitUntil {sleep 1; (!cvo_ss_running || cvo_ss_phase >= 9)};		/// REVERT @ Phase 9 or when Killswitch

	btc_AI_skill = _btc_ai_skill_backup;
	//  ######## Execution
	{[_x] call btc_mil_fnc_set_skill;} forEach allUnits;
	diag_log ("[CVO] [SandStorm] (AISkill) - AI Skill normal");
	diag_log ("[CVO] [SandStorm] (AISkill) - Exit");
};

// ##################################
// SOUND - WIND 1 (Phase 1 to 10)

[] spawn {
	
	diag_log ("[CVO] [SandStorm] (Wind 2) - Init");
	
	while {cvo_ss_running} do {
		["strong_wind"] remoteExec ["playSound"];
		sleep 67;
	};

	diag_log ("[CVO] [SandStorm] (Wind 2) - End");
};

// #########
// SOUND - WIND 1 (Phase 3 to 8)

[] spawn {
	waitUntil {sleep 1; cvo_ss_phase >= 3};
	diag_log ("[CVO] [SandStorm] (Wind 1) - Init");

	while {cvo_ss_running && (cvo_ss_phase <= 8)} do {
		_rafale = ["windburst_1","windburst_2","windburst_3_dr","windburst_4_st"] call BIS_fnc_selectRandom;
		[_rafale] remoteExec ["playSound"];
		sleep 15+random 60;
	};
	diag_log ("[CVO] [SandStorm] (Wind 1) - End");
};

// #########
// SOUND - WIND 3 (Phase 5,6,7)

[] spawn {
	diag_log ("[CVO] [SandStorm] (Wind 3) - Init");
	waitUntil {sleep 1; (cvo_ss_phase >= 5)};

	while {cvo_ss_running && (cvo_ss_phase <= 7)} do {
		["hurricane"] remoteExec ["playSound"];
		sleep 50;
	};

	diag_log ("[CVO] [SandStorm] (Wind 3) - End");
};



// ##################################
// DEBUG Viewer

/*
[_duration] spawn {
	diag_log ("[CVO] [SandStorm] (DebugHint) - Init");
	params ["_duration"];
	private _cvo_env_ds_startTime = time;


	while {cvo_ss_running} do {
		sleep 0.5;
		private _pastTime = round (time - _cvo_env_ds_startTime);
		hintSilent (format ["Time: %4s / %5s - Phase: %6\nFogParams:\nValue: %1\nDecay: %2\nFogBase: %3", fogParams#0, fogParams#1, fogParams#2,_pastTime, _duration, cvo_ss_phase]);
		sleep 1;
	};
	diag_log ("[CVO] [SandStorm] (DebugHint) - End");
};
*/