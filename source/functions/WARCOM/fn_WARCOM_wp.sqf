params ["_group"];

_group setCombatMode "RED";

private _nearestEnemyZones = [WARCOM_zones_controled_by_OPFOR, [_group], {_input0 distance _x}, "ASCEND"] call BIS_fnc_sortBy;

{
    _wp = _group addWaypoint [_x, 20];
    _wp setWaypointType "SAD";
    _wp setWaypointCompletionRadius 80;
    _wp setWaypointTimeout [150, 150, 150];
} forEach _nearestEnemyZones;
