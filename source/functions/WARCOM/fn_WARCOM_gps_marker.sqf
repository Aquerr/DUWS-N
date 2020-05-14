params ["_group","_TFname"];

_loop = true;


_leader = leader _group;
// create marker on leader
_markername = format["WARCOM%1",WARCOM_marker_num]; // Define marker name
_markerstr = createMarker [str(_markername), getpos _leader];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "loc_Tree";
str(_markername) setMarkerColor "ColorBlue";
str(_markername) setMarkerText format["TF %1",_TFname];
WARCOM_marker_num = WARCOM_marker_num + 1;

while {_loop} do {
    _units_alive = {alive _x }count units _group;
    if (_units_alive<=0) exitWith {  // IF ALL DEAD, EXIT.
        _index = 0;
        {
            if (_x isEqualTo _group) exitWith {
                TASK_FORCE_LIST deleteAt _index;
            };
            _index = _index + 1;

        }forEach TASK_FORCE_LIST;
        str(_markername) setMarkerColor "ColorRed";
        str(_markername) setMarkerType "waypoint";
        [west, "PAPA_BEAR"]  sidechat format["To all units, this is HQ, Task force %1 just got wiped out. Stay alert",_TFname];
        sleep 600;
        deleteMarker str(_markername);
    };
    _leader = leader _group;
    str(_markername) setMarkerPos getpos _leader;
    sleep 4;
};
