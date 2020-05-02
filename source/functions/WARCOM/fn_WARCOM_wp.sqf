params ["_group"];

_group setCombatMode "RED";

{
    _wp = _group addWaypoint [_x, 10];
    _wp setWaypointType "SAD";
    _wp setWaypointCompletionRadius 80;
    _wp setWaypointTimeout [450, 450, 450];
}
forEach WARCOM_zones_controled_by_OPFOR;

