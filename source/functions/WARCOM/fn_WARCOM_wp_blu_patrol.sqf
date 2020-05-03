params ["_group"];

_group setCombatMode "RED";


{
    _wp = _group addWaypoint [_x, 10];
    _wp setWaypointType "MOVE";
    _wp setWaypointBehaviour "SAFE";
    _wp setWaypointSpeed "LIMITED";
    _wp setWaypointCompletionRadius 60;
    _wp setWaypointTimeout [150, 150, 150];
}
forEach WARCOM_zones_controled_by_BLUFOR;

    _wp1 = _group addWaypoint [getpos leader _group, 0];
    _wp1 setWaypointType "CYCLE";
    _wp1 setWaypointBehaviour "SAFE";
    _wp1 setWaypointSpeed "LIMITED";
