params ["_hqblu"];

blu_hq_created = true;
PosOfBLUHQ = _hqblu;
publicVariable "PosOfBLUHQ";

// create the building
_hq = "Land_Cargo_HQ_V1_F" createVehicle _hqblu;

// create marker on HQ
_markername = format["%1%2",round (_hqblu select 0),round (_hqblu select 1)]; // Define marker name
blu_hq_markername = _markername;

//hint _markername;
_markerstr = createMarker [str(_markername), _hqblu];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "mil_flag";
str(_markername) setMarkerColor "ColorBlue";
str(_markername) setMarkerText "Main base";

// make HQ zone notification trigger
_trg5=createTrigger["EmptyDetector",_hqblu];
{
    _trg5 triggerAttachVehicle [_x];
} forEach allPlayers;
//_trg5 triggerAttachVehicle [player];
_trg5 setTriggerArea[100,100,0,false];
_trg5 setTriggerActivation["VEHICLE","PRESENT",true];
_trg5 setTriggerStatements["this", format["[""%1"",thislist] spawn duws_fnc_enterlocation",'Main Base'], ""];

// warning trigger when an enemy approaches the camp
_trgWarning=createTrigger["EmptyDetector",_hqblu];
_trgWarning setTriggerArea[300,300,0,false];
_trgWarning setTriggerActivation["EAST","PRESENT",true];
_trgWarning setTriggerStatements["this","[west, ""PAPA_BEAR""] sidechat 'This is HQ, there are enemies near our main base!'", ""];

// CREATE THE OFFICER
_group = createGroup west;
_hq = _group createUnit [Blufor_Officer,(getmarkerpos str(blu_hq_markername)), [], 0, "FORM"];
hq_blu1 = _hq;
publicVariable "hq_blu1";
_hq setpos [_hqblu select 0, _hqblu select 1, 0.59];
_hq disableAI "AUTOTARGET";
_hq disableAI "MOVE";
removeallweapons _hq;
[_hq] spawn duws_fnc_commanderAnim;
_hq setdir 270;
_handle = [_hq] spawn duws_fnc_radiochatter;
//_drawicon = [] execVM "inithq\drawIcon.sqf"; // create the icon

//GUARDS
_handle = [(getpos hq_blu1), _hq] call duws_fnc_guards;

//STATIC DEFENSES
_handle = [(getpos hq_blu1), _hq] spawn duws_fnc_fortify;

//CREATE PATROL
[getpos hq_blu1, 40] call duws_fnc_guardsHQ;
[getpos hq_blu1, 60] call duws_fnc_guardsHQ;

// IF THE OFFICER IS DEAD -- End OF "SPAWN"

// TELEPORT PLAYER
player setpos _hqblu;

//////// HQ GENERATED /////
"respawn_west" setMarkerPos _hqblu;
sleep 0.1;

// BROADCAST, TELL THE HQ POS IS FOUND
HQ_IS_GENERATED = true;
publicVariable "HQ_IS_GENERATED";

if (!zones_manually_placed) then {

    // SHOW THE STARTUP MENU
    if (!zones_created) then {
        sleep 0.1;
        [] spawn duws_fnc_showStartupDialog;
        waitUntil {CHOSEN_SETTINGS};  // WAIT UNTIL THE PLAYER HAS CHOSEN THE SETTINGS
    };

    // WEATHER INIT
    if (dynamic_weather_enable) then {
        _weather_script = [] spawn duws_fnc_weather;
    };

    // CALL ZONES GENERATION
    waitUntil {!isNil {getsize_script}};  // WAIT UNTIL THE MAPSIZE SCRIPT IS DONE
    createzone_server = true;
    publicVariable "createzone_server";

    // CHECK IF ZONES ARE PLACED...
    // If not execute locatorZonesV1.sqf if the user wants them randomly placed. V2 if the user wants to place zones.
    // if (!zones_created && !manually_chosen) then {
    //     _zones_create = [50, 0.2] execVM "initZones\locatorZonesV1.sqf";
    // } else {
    //     _zones_create = [50, 0.2] execVM "initZones\locatorZonesV2.sqf";
    // };
};

player allowDamage true;
if (debugmode) exitWith {};

//Give leader players sitrep command
if (isServer) then {
    {
         if ((leader group _entity == leader _entity)) then {
            _slot_name = vehicleVarName _entity;
            if (_slot_name in game_master) then {
                _sitrep = [_x, "sitrep"] call BIS_fnc_addCommMenuItem;
            };
        };
    } forEach allPlayers;
};
