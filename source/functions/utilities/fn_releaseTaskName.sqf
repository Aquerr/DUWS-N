/*
	author: nerdi
	description: none
	returns: nothing
*/

params ["_taskName"];

_index = 0;
{
    if(_taskName isEqualTo _x) then {
        MISSIONS_TASK_NAMES deleteAt _index;
        _index = _index - 1;
    };
    _index = _index + 1;
} forEach MISSIONS_TASK_NAMES;
