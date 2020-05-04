_loop = true;

WARCOM_blu_attack_wave_type = "";
WARCOM_blu_attack_wave_avalaible = false;

diag_log format ["WARCOM_blufor_ap_assault: %1", WARCOM_blufor_ap];
[[[west, "Base"], "This is HQ, BLUFOR troops just arrived on the island, we'll soon be able to push through the enemy lines"], "sideChat", true, true] call BIS_fnc_MP;

getRandomAttackWaveType = {
    _number = floor random 6;
    _waveType = objNull;
    switch (_number) do {
        case 0: { _waveType = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam") };
        case 1: { _waveType = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfSquad") };
        case 2: { _waveType = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfSquad_Weapons") };
        case 3: { _waveType = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Mechanized" >> "BUS_MechInfSquad") };
        case 4: { _waveType = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Mechanized" >> "BUS_MechInf_AT") };
        case 5: { _waveType = (configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Armored" >> "B_TankDestrSection_Rhino") };
    };
    _waveType;
};

// Attack waves main
[] spawn {
    waitUntil {WARCOM_blufor_ap >= 20};
    while {true} do {
        sleep 30;
        _waveType = call getRandomAttackWaveType;
        _safePosition = [WARCOM_blu_hq_pos, 20, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos;
        _group = [_safePosition, west, _waveType, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
        _TFname = [1] call duws_fnc_random_name;
        [[[west, "Base"], format["This is HQ, We are sending Task Force %1, we will try to push as far as possible in enemy territory",_TFname]], "sideChat", true, true] call BIS_fnc_MP;

        _blu_assault = [_group] call duws_fnc_WARCOM_wp;
        _blu_assault = [_group,_TFname] spawn duws_fnc_WARCOM_gps_marker;

        sleep (WARCOM_blu_attack_delay + random (1200 - WARCOM_blufor_ap));
    };
};
