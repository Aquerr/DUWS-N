[] call duws_fnc_startup_common;

manually_chosen = false;
publicVariable "manually_chosen";

CHOSEN_SETTINGS = true; // Give the go ! BluHQinit.sqf can continue execution
publicVariable "CHOSEN_SETTINGS";

diag_log format["----- DUWS-N CHOSEN SETTINGS --------- Max radius: %1-------Min radius: %2-------Zones number: %3-------Command points: %4-------BLU AP: %5-------OPF AP: %6-------Weather type: %7-------BLU AI skill: %8-------OPF AI skill: %9",zones_max_radius,zones_min_radius,zones_number,commandpointsblu1,opfor_ap,blufor_ap,weather_type,blufor_ai_skill,opfor_ai_skill];
closeDialog 0;
