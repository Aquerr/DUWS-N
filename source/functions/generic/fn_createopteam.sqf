
// radius: 50 for patrol inside and around base, 500 for medium lenght skirmish, 1300 for island

params["_position","_radius"];

// hint format["%1",_position];

_group = [_position, EAST, [Opfor_Teamleader,Opfor_Autorifleman,Opfor_Rifleman_AT,Opfor_Grenadier],[],[],opfor_ai_skill] call BIS_fnc_spawnGroup;
_patrolRadius = round(_radius/2);
[_group, _position, _patrolradius] call bis_fnc_taskPatrol;

// ADD QRF eventhandler
_EH = leader _group addEventHandler ["Fired", {[_this select 0] spawn duws_fnc_WARCOM_opf_qrf}];