/* place me at bottom of your init.sqf */

if (!isDedicated) then {
	_nil = [] execVM "addons\CLAY_CarRadio\initCarRadio.sqf";
};