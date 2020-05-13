/*
	author: nerdi
	description: Gets new (not occupied) task name for the given base name.

	param _taskName = base name of the task;

	returns: new task name
*/

params ["_taskName"];

_notFound = true;
_taskNumber = 1;

_result = "";

while {_notFound} do {
    _preferredName = _taskName + str(_taskNumber);
    if(!(_preferredName in MISSIONS_TASK_NAMES)) then {
        _notFound = false;
        _result = _preferredName;
    };
    _taskNumber = _taskNumber + 1;
};

MISSIONS_TASK_NAMES pushBack _result;

//Return result
_result
