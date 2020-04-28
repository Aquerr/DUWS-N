HQ_PLACEMENT_CHOOSEN = true;
player globalChat "lance recherche position...";
hq_create = [20, 0.015] spawn duws_fnc_locatorhq;
waitUntil {scriptDone hq_create};
