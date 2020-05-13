/*
	author: nerdi
	description: Generates minefield mission where player needs to defuse mines to acquire points.
	returns: nothing
*/

params ["_missionPos"];

systemChat "Generating minefield...";
systemChat format ["MissionPos: %1", _missionPos];

_radius = 100;
_randompos = [(_missionPos select 0)+(random _radius)-(random _radius), (_missionPos select 1)+(random _radius)-(random _radius)];

// CREATE NAME
_mission_name = MissionNameCase6;

// CREATE MARKER (ICON)
_markername = format["resc%1%2",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr = createMarker [str(_markername), _randompos];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "Minefield";
str(_markername) setMarkerColor "ColorOPFOR";
str(_markername) setMarkerText "Disarm";

// CREATE MARKER (ELLIPSE ZONE)
_markername2 = format["%1%2ellipseresc",round(_randompos select 0),round(_randompos select 1)]; // Define marker name
_markerstr2 = createMarker [str(_markername2), _randompos];
_markerstr2 setMarkerShape "ELLIPSE";
str(_markername2) setMarkerBrush "SolidBorder";
str(_markername2) setMarkerColor "ColorOPFOR";
str(_markername2) setMarkerSize [_radius, _radius];
str(_markername2) setMarkerAlpha 0.3;

systemChat "Created Markers...";

// Spawn mines
_mines = [];
_minesToDisarmCount = 5;
for "_i" from 0 to _minesToDisarmCount do
{
    _mine = createMine ["APERSMine", _randompos, [], 75];
    _mines pushBack _mine;
};

systemChat "Spawned mines";

// Create task and notify game.
//_VARtaskgeneratedName = format["tsksabot%1%2",round(_missionPos select 0),round(_missionPos select 1)]; // generate variable name for task
[west, "_taskhandle", ["We detected enmy minefield! You need to defuse these mines so that our army has can move there safely.", "Enemy mines!"], objNull, true] call BIS_fnc_taskCreate;

["TaskAssigned",["",_mission_name]] call bis_fnc_showNotification;

// Create OP FOR Patrol
sleep 1;
[_randompos, _radius] call duws_fnc_createopteam;

if (!isMultiplayer) then {
    [] spawn duws_fnc_autoSave;
};

// Check if mines are defused
_disarmedMinesCount = 0;

waitUntil
{
    sleep 5;
    {
        _index = 0;
        if(!(mineActive _x)) then {
            systemChat format ["Not active mine: %1", _x];
            systemChat format ["Mine index: %1", _index];
            _disarmedMinesCount = _disarmedMinesCount + 1;
            _mines deleteAt _index;
            _index = _index - 1;
            systemchat format ["Mines: %1", _mines];
        };
        _index = _index + 1;
    } forEach _mines;

    systemChat format["Disarmed mines: %1", _disarmedMinesCount];
    _minesToDisarmCount == _disarmedMinesCount;
};

systemChat "Mission Completed!";

if (!isMultiplayer) then {
    [] spawn duws_fnc_autoSave;
};

// remove markers
deleteMarker str(_markername2);
deleteMarker str(_markername);

["_taskhandle", "west"] remoteExecCall ["BIS_fnc_deleteTask", 0, true];

// Award player
reward = (15 * cp_reward_multiplier);

["TaskSucceeded", ["",_mission_name]] call bis_fnc_showNotification;
["cpaddedmission", [reward]] call bis_fnc_showNotification;

commandpointsblu1 = commandpointsblu1 + reward;
missions_success = missions_success + 1;
WARCOM_blufor_ap = WARCOM_blufor_ap + 15;
opfor_ap = opfor_ap - 15;
finishedMissionsNumber = finishedMissionsNumber + 1;
publicVariable "finishedMissionsNumber";
publicVariable "commandpointsblu1";
publicVariable "WARCOM_blufor_ap";

[] call operative_mission_complete;

// ADD PERSISTENT STAT
_addmission = [] call duws_fnc_persistent_stats_missions_total;


