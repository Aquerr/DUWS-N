params ["_group"];

_group setCombatMode "RED";


// check if at least 1 zone is under BLU control, if not, attack HQ.
if (count WARCOM_zones_controled_by_BLUFOR == 0) exitWith {
    _wp = _group addWaypoint [WARCOM_blu_hq_pos, 0];
    _wp setWaypointType "SAD";
};



{
    _wp = _group addWaypoint [_x, 0];
    _wp setWaypointType "SAD";
    _wp setWaypointCompletionRadius 40;
    _wp setWaypointTimeout [150, 450, 450];
}
forEach WARCOM_zones_controled_by_BLUFOR;


