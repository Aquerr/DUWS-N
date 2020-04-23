_selected_index = lbCurSel 1500;
_selected_soldier = duws_operator_list select _selected_index; // get the selected soldier from the array of soldier using the selected index

_selected_soldier_reflexes = _selected_soldier select 1;
_selected_soldier_points = _selected_soldier select 13;
if (_selected_soldier_points <= 0) exitWith {hint "You have no points available"};
if (_selected_soldier_reflexes >= 1) exitWith {hint "This stat is already at the maximum"};

_selected_soldier_reflexes_new = _selected_soldier_reflexes + 0.01; // update the variable
_selected_soldier set [1,_selected_soldier_reflexes_new];

_selected_soldier_pts_new = _selected_soldier_points - 1;
_selected_soldier set [13,_selected_soldier_pts_new];
[] call duws_fnc_lbselected;
hint "New stats will be applied at the next deployment of this operative";