params ["_group"];

_group setCombatMode "RED";

_nearestEnemyZones = [WARCOM_zones_controled_by_OPFOR, [leader _group], {_input0 distance _x}, "ASCEND"] call BIS_fnc_sortBy;
{
    _wp = _group addWaypoint [_x, 20];
    _wp setWaypointType "SAD";
    if((leader _group) weaponAccessories currentMuzzle (leader _group) param [0, ""] != "") then {
        _wp setWaypointBehaviour "STEALTH";
    };
    _wp setWaypointCompletionRadius 80;
    _wp setWaypointTimeout [150, 150, 150];
} forEach _nearestEnemyZones;
