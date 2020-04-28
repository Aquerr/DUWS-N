/*
	author: nerdi
	description: Function that initializes and setups server variables.
	returns: nothing
*/

//________________________________________________________________________________________________________________________
//_____________________________ MISSION PARAMETERS ______________________________

_revive_activated = ["Revive", 1] call BIS_fnc_getParamValue;
_aisReviveHeal = ["ReviveHeal", false] call BIS_fnc_getParamValue;
if(_aisReviveHeal == 0) then {
    AIS_REVIVE_HEAL = false;
} else {
    AIS_REVIVE_HEAL = true;
};
DUWS_MP_CP_death_cost = ["DeathPenalty", 1] call BIS_fnc_getParamValue;
DUWS_Dead_Units_Removal_Time = ["DeadUnitsRemovalTime", 1200] call BIS_fnc_getParamValue;
DUWS_Mission_Cooldown_Time = ["MissionCooldownTime", 60] call BIS_fnc_getParamValue;

//________________________________________________________________________________________________________________________

// nber of missions succes(!!dont touch!!)
missions_success = 0;
publicVariable "missions_success";

zones_created = false;
publicVariable "zones_created";

blu_hq_created = false;
publicVariable "blu_hq_created";

can_get_mission = true;
publicVariable "can_get_mission";

failsafe_zones_not_found = false;
publicVariable "failsafe_zones_not_found";

//TODO: Why do we need to create it? Remove it and see if something breaks. If not then we are fine!
createcenter sideLogic;
LogicGroup = createGroup SideLogic;
publicVariable "LogicGroup";

locator_hq_actived = false;
publicVariable "locator_hq_actived";

op_zones_index = 0;
publicVariable "op_zones_index";

clientisSync = false;
publicVariable "clientisSync";

fobSwitch = false;
publicVariable "fobSwitch";

HQ_MANUALLY_PLACED = false;
publicVariable "HQ_MANUALLY_PLACED";

amount_zones_created = 0;
publicVariable "amount_zones_created";

HQ_IS_GENERATED = false;
publicVariable "HQ_IS_GENERATED";

CHOSEN_SETTINGS = false;
publicVariable "CHOSEN_SETTINGS";

zoneundercontrolblu = 0;
publicVariable "zoneundercontrolblu";

amount_zones_captured = 0;
publicVariable "amount_zones_captured";

savegameNumber = 0;
publicVariable "savegameNumber";

capturedZonesNumber = 0;
publicVariable "capturedZonesNumber";

finishedMissionsNumber = 0;
publicVariable "finishedMissionsNumber";

OvercastVar = 0;
publicVariable "OvercastVar";

FogVar = 0;
publicVariable "FogVar";

createzone_server = false;
publicVariable "createzone_server";

mission_number_of_zones_captured = 0;
publicVariable "mission_number_of_zones_captured";

// this is a special one (if/else)
if (isNil "Array_of_FOBS") then {
    // if the player is sp or server or no fobs have been created
    Array_of_FOBS = [];
}
else /// JIP for the client
{
    {
        [_x] call duws_fnc_FOBactions;
    } forEach Array_of_FOBS;
};

if (isNil "Array_of_FOBname") then {
    Array_of_FOBname = [];
};

publicVariable "Array_of_FOBS";
publicVariable "Array_of_FOBname";

game_master = ["player1"];
publicVariable "game_master";

// Array of arrays = mainly used as a mapping data type.
// Should take an array as input where first element is player's profile name and second is the marker name.
MAP_PLAYER_MARKERS = [[]];
