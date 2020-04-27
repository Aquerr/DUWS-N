waitUntil {time > 1};
_handle = createDialog "startup_hq_placement_dialog";
waitUntil {dialog};
if (HQ_IS_GENERATED) exitWith {closeDialog 0};
