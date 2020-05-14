/*
	author: nerdi
	description: none
	returns: nothing
*/

//Construct Support Menu root
ADMIN_MENU =
[
    ["Admin Menu",false],
    ["Delete Dead Units", [2], "", -5, [["expression", "[] spawn duws_fnc_removeDeadEntities"]], "1", "1"],
    ["Take Control of Task Force", [3], "", -5, [["expression", "[player] spawn duws_fnc_takeControlOfTaskForceGroup"]], "1", "1"]
];
