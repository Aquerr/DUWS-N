/*
	author: nerdi
	description: Function that initializes and setups server variables.
	returns: nothing
*/

// nber of missions succes(!!dont touch!!)
missions_success = 0;
publicVariable "missions_success";

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

player_is_choosing_hqpos = false;
publicVariable "player_is_choosing_hqpos";

amount_zones_created = 0;
publicVariable "amount_zones_created";

HQ_pos_found_generated = false;
publicVariable "HQ_pos_found_generated";

chosen_settings = false;
publicVariable "chosen_settings";

chosen_hq_placement = false;
publicVariable "chosen_hq_placement";

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
