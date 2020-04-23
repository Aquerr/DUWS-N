if (!Mission_timeout_request) exitWith {};
Mission_timeout_request = false;
publicVariable "Mission_timeout_request";
sleep DUWS_Mission_Cooldown_Time;
Mission_timeout_request = true;
publicVariable "Mission_timeout_request"
