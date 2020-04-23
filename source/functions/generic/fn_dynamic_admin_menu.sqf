/*
	author: nerdi
	description: none
	returns: nothing
*/

//Construct Support Menu root
ADMIN_MENU =
[
    ["Admin Menu",false],
    ["Delete Dead Units", [2], "", -5, [["expression", "[] spawn duws_fnc_removeDeadEntities"]], "1", "1"]
];
