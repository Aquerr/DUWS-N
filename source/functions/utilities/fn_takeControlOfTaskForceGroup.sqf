/*
	author: Karol
	description: SOMETHING NICE ! <3 Take control of Task Force
*/

params ["_player"];
{
    _player hcSetGroup [_x];
}forEach TASK_FORCE_LIST;

