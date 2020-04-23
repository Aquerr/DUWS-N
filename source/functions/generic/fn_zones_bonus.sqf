waitUntil {zoneundercontrolblu >= 1};
sleep 20;

// Give FOB support option for all game masters.
{
    private _editorName = _x;
    {
        private _temp_player = _x;
        private _vehicleVarName = vehicleVarName _temp_player;

        if (_editorName == _vehicleVarName) then {
            [_temp_player, "fob_support"] remoteExecCall ["BIS_fnc_addCommMenuItem", 0, true];
        }
    } forEach AllPlayers;

} forEach game_master;

//_sitrep = [player,"fob_support"] call BIS_fnc_addCommMenuItem;
["info",["Establishing a FOB","Check the briefing for more info (RTI Manual)"]] remoteExecCall ["bis_fnc_showNotification", 0, true];
//["info",["Establishing a FOB","Check the briefing for more info (RTI Manual)"]] call bis_fnc_showNotification;
sleep 2;
