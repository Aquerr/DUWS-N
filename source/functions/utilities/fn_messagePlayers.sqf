/*
	author: nerdi
	description: Prints a message for all server players in system chat.
	returns: nothing
*/

private ["_message"];

[_message, "systemChat", true, true] call BIS_fnc_MP;
