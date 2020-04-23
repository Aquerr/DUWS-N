/*
	author: nerdi
	description: Super simple script that removes the dead crop after specified time.
	returns: nothing
*/

{
    [("Removing: " + (str _x)), "systemChat", true, true] call BIS_fnc_MP;
    deleteVehicle _x;
} forEach allDead;
