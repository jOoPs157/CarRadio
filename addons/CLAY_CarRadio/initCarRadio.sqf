private ["_userPlaylist", "_keyPlay", "_keyNext", "_keyPre", "_keyVolUp", "_keyVolDown", "_CLAY_CarRadio_KeyPressed","_trigger1"];

sleep 0.1;

//  Format: [ [<ClassName | String>, <Title | String>, <Length (in seconds) | Number>] ] //["Ambient01_Cold_Wind","Cold Wind", 350] 
_userPlaylist = [];
_keyPlay = 197; //  Key number 'PLAY/PAUSE' - default PAUSE
_keyNext = 205; //  Key number 'NEXT TRACK' - default RIGHT ARROW
_keyPre = 203; //  Key number 'PREVIOUS TRACK' - default LEFT ARROW
_keyVolUp = 200; //  Key number 'VOLUME UP' - default UP ARROW
_keyVolDown = 208; //  Key number 'VOLUME DOWN' - default DOWN ARROW

CLAY_CarRadio_UserPlaylist = _userPlaylist;

CLAY_CarRadio_KeyPlay    = _keyPlay;
CLAY_CarRadio_KeyNext    = _keyNext;
CLAY_CarRadio_KeyPre     = _keyPre;
CLAY_CarRadio_KeyVolUp   = _keyVolUp;
CLAY_CarRadio_KeyVolDown = _keyVolDown;

CLAY_CarRadio_KeyPressedCode = compile preprocessFile "addons\CLAY_CarRadio\scripts\key.sqf";
_CLAY_CarRadio_KeyPressed = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call CLAY_CarRadio_KeyPressedCode"];

If (isNil "CLAY_CarRadio_UserPlaylist") Then { CLAY_CarRadio_UserPlaylist = [] };
If (isNil "CLAY_RadioAddMusic") Then { CLAY_RadioAddMusic = [["SkyNet", "Sky Net", 175],["Track13_Sharping_Knives", "Sharping Knives", 180]] };
If (isNil "CLAY_RadioAddVehicles") Then { CLAY_RadioAddVehicles = ["UH1H_TK_EP1","BAF_Merlin_HC3_D","BAF_Merlin_DZE"] };
If (isNil "CLAY_RadioNoVehicles") Then { CLAY_RadioNoVehicles = ["HMMWV_Armored"] };
If (isNil "CLAY_RadioShowTooltips") Then { CLAY_RadioShowTooltips = true };

_trigger1 = createTrigger ["EmptyDetector", [0,0,0]];
_trigger1 setTriggerArea [0, 0, 0, false];
_trigger1 setTriggerActivation ["NONE", "PRESENT", true];
_trigger1 setTriggerStatements ["(('Car' countType [(vehicle player)] > 0) || (typeOf (vehicle player) in CLAY_RadioAddVehicles)) && !(typeOf (vehicle player) in CLAY_RadioNoVehicles)", "CLAY_RadioVeh = vehicle player; CLAY_ID_RADIO = CLAY_RadioVeh addAction ['Car Radio','addons\CLAY_CarRadio\scripts\radio.sqf','',0,false,false,'',''];","CLAY_RadioEndTimer = true; CLAY_RadioPlaying = true; playMusic ''; CLAY_RadioVeh removeAction CLAY_ID_RADIO; CLAY_RadioVeh = nil;"];


CLAY_RadioPlaying = false;
CLAY_RadioEndTimer = true;

CLAY_RadioGameMusic = 
[
	["Ambient01_Cold_Wind", "Ambient: Cold Wind", 153], 
	["Ambient02_Vague_Shapes", "Ambient: Vauge Shapes", 219], 
	["Ambient03_Indian_Summer", "Ambient: Indian Summer", 102], 
	["Ambient04_Electronic_Warfare", "Ambient: Electronic Warfare", 76], 
	["Ambient05_Cobalt", "Ambient: Cobalt", 43], 
	["Ambient06_Khe_Sanh_Riff", "Ambient: Khe Sanh Riff", 211], 
	["Ambient07_Manhattan", "Ambient: Manhatten", 101], 
	["Ambient08_Reforger", "Ambient: Reforger", 155], 
	["Short01_Defcon_Three", "Defcon Three", 38], 
	["Track01_Dead_Forest", "Dead Forest", 64], 
	["Track02_Insertion", "Insertion", 105], 
	["Track03_First_to_Fight", "First to Fight", 119], 
	["Track04_Reinforcements", "Reinforcements", 88], 
	["Track05_Warpath", "Warpath", 143], 
	["Track06_Abandoned_Battlespace", "Abandoned Battlespace", 111], 
	["Track07_Last_Men_Standing", "Last Man Standing", 63], 
	["Track08_Harvest_Red", "Harvest Red", 78], 
	["Track09_Movement_To_Contact", "Movement to Contact", 81], 
	["Track10_Logistics", "Logistics", 148], 
	["Track11_Large_Scale_Assault", "Large Scale Assault", 42], 
	["Track12_The_Movement", "The Movement", 72], 
	["Track13_Sharping_Knives", "Sharping Knives", 180], 
	["Track14_Close_Quarter_Combat", "Close Quarter Combat", 188], 
	["Track15_Morning_Sortie", "Morning Sortie", 55], 
	["Track16_Valentine", "Valentine", 86], 
	["Track17_Marauder_Song", "Marauder Song", 68], 
	["Track18_Ghost_Waltz", "Ghost Waltz", 113], 
	["Track19_Debriefing", "Debriefing", 104], 
	["Track20_Badlands", "Badlands", 137], 
	["Track21_Rise_Of_The_Fallen", "Rise of the Fallen", 89], 
	["Track22_Chernarussian_Anthem", "Chernarussian Anthem", 129], 
	["Track26_Organ_Works", "Organ Works", 69], 
	["Track27_Killing_Machines", "Eastern Eggs - Killing Machines", 210],
	//Eagle Wing - 15.07.2010
	["ToWar", "To War", 160], 
	["AllHelllBreaksLoose", "All Hell Breaks Loose", 150], 
	["Fallout", "Fallout", 163], 
	["Defcon", "Defcon", 145], 
	["Wasteland", "Wasteland", 142], 
	["SkyNet", "Sky Net", 175], 
	["MAD", "Mutual Assured Destruction", 153]
];

CLAY_RadioGameMusicOA = 
[
	["EP1_Track01", "Arrowhead", 218],
	["EP1_Track01D", "Arrowhead Drums", 28],
	["EP1_Track02", "Good Morning T-Stan", 164],
	["EP1_Track03", "Airborne", 57],
	["EP1_Track03D", "Airborne Drums", 75],
	["EP1_Track04", "Arrival", 253],
	["EP1_Track05", "Zargabad Market", 103],
	["EP1_Track06", "Nightlife", 175],
	["EP1_Track07", "Coltan-Blues", 180],
	["EP1_Track07D", "Coltan-Drums", 75],
	["EP1_Track08", "Revolver-Jam", 136],
	["EP1_Track09", "Dancing Scimitar", 159],
	["EP1_Track10", "Death from Above", 176],
	["EP1_Track11", "Night-Visions", 124],
	["EP1_Track12", "Crude Oil", 238],
	["EP1_Track13", "Iron Mountain", 167],
	["EP1_Track13D1", "Mountain Drums 1", 73],
	["EP1_Track13D2", "Mountain Drums 2", 75],
	["EP1_Track13V", "Mountain Vocals", 40],
	["EP1_Track14", "Concrete Cell", 263],
	["EP1_Track15", "Warmongers", 140]
];

CLAY_RadioGameMusicNamalsk = 
[
	["nsmisc_namalsk_day", "NS M: Namalsk day", 302],
	["nsmisc_namalsk_night", "NS M: Namalsk night", 274],
	["nsmisc_ns_menu", "NS M: Nightstalkers menu", 194],
	["nsmisc_namalsk_menu", "NS M: Namalsk menu", 195],
	["nsmisc_namalsk_menu2", "NS M: Namalsk menu 2", 427],
	["00_NC_intro", "NC 00: Namalsk Crisis Intro", 307],
	["01_lubjansk_guards", "NC 01: Lubjanks guards", 49],
	["01_far_away", "NC 01: Far Away", 196],
	["01_lubjansk", "NC 01: Lubjansk", 386],
	["02_haunted1", "NC 02: Haunted-I", 122],
	["02_haunted2", "NC 02: Haunted-II", 115],
	["03_vorkuta_marsh", "NC 03: Vorkuta Marsh", 74],
	["03_first_shadow", "NC 03: First Shadow", 206],
	["04_Vorkuta_chase", "NC 04: Vorkuta chase", 319],
	["04_end_of_beginning", "NC 04: End of the Beginning", 101],
	["04_bad_news", "NC 04: Bad news", 120],
	["05_introducing_vorkuta", "NC 05: Vorkuta at night", 358],
	["05_dark_night", "NC 05: Dark night on Namalsk", 279],
	["06_jammed", "NC 06: Jammed!", 172],
	["06_deep_night", "NC 06: Deep night", 184],
	["06_first_person", "NC 06: First person shooter", 287],
	["07_daylight", "NC 07: Daylight", 283],
	["07_testing", "NC 07: NAC testing", 145],
	["08_nightstalkers", "NC 08: Nightstalkers", 174],
	["09_danger", "NC 09: Danger", 343],
	["09_danger_stealth", "NC 09: Danger stealth", 528],
	["09_danger_a1", "NC 09: Danger attack-I", 290],
	["09_danger_a2", "NC 09: Danger attack-II", 154],
	["11_dark_morning", "NC 11: Dark morning", 166],
	["11_cold_jump", "NC 11: Cold jump", 151],
	["11_fear", "NC 11: Fear", 230],
	["11_something_wrong", "NC 11: Something wrong is here", 651],
	["12_night_time", "NC 12 Night time", 197],
	["12_moment", "NC 12: Moment", 22],
	["12_tomountains", "NC 12: To the moutains", 23],
	["12_mutants", "NC 12: Mutants I", 380],
	["12_mutants2", "NC 12: Mutants II", 465],
	["12_satellite", "NC 12: Satellite", 110],
	["13_strike", "NC 13: Strike", 548],
	["14_nacattacking", "NC 14: NAC attacking!", 145],
	["14_airbattle", "NC 14: Air battle", 131],
	["15_tara_combat", "NC 15: Tara combat-I", 254],
	["15_tara_combat2", "NC 15: Tara combat-II", 193],
	["15_tara_tension", "NC 15: Tara tension", 273],
	["16_lubjanskstrike", "NC 16: Lubjansk strike", 212],
	["16_lubjanskb1", "NC 16: Lubjansk battle I", 624],
	["16_lubjanskb2", "NC 16: Lubjansk battle II", 254],
	["16_beheaded", "NC 16: Beheaded", 237],
	["17_inf_intro", "NC 17: Infiltration", 487],
	["17_trouble_node", "NC 17: Trouble Node", 215],
	["17_bunker", "NC 17: Bunker", 135],
	["18_quick_strike", "NC 18: Quick strike", 292],
	["18_harvesting", "NC 18: Harvesting", 234],
	["18_fear_the_future", "NC 18: Fear the Future", 172],
	["19_evilcrow", "NC 19: Evil crow", 196],
	["19_evilcrow2", "NC 19: Evil crow fade", 197],
	["19_attack", "NC 19: Attack", 295],
	["20_under_lesson", "NC 20 Underground lesson", 385],
	["21_frozen", "NC 21: Frozen Namalsk", 217],
	["21_final_tension", "NC 21: Final tension", 105],
	["22_ending1", "NC 22: Ending-I", 420],
	["22_ending2", "NC 22: Ending-II", 246],
	["22_outro", "NC 22: Outro", 206]
];

if (count CLAY_CarRadio_UserPlaylist > 0) then {
	CLAY_RadioCustomMusic = CLAY_CarRadio_UserPlaylist;
} else {
	if (toLower(worldName) == "namalsk") then {
		CLAY_RadioCustomMusic = CLAY_RadioGameMusicNamalsk;
	} else {
		CLAY_RadioCustomMusic = [["SkyNet", "Sky Net", 175]];
	};
};

CLAY_RadioPlayList = CLAY_RadioGameMusic;

CLAY_RadioTrack = 0;
CLAY_RadioVol = 0.5;
CLAY_RadioVolStep = 10;

CLAY_RadioSrc = 1;
CLAY_RadioRepeat = false;
CLAY_RadioRandom = false;
CLAY_RadioKeyColor = 1;
CLAY_RadioDisplay = 9;
CLAY_RadioColor = "Black";

/*  Keycodes are listed below

ESC = 1 
F1 = 59 
F2 = 60 
F3 = 61 
F4 = 62 
F5 = 63 
F6 = 64 
F7 = 65 
F8 = 66 
F9 = 67 
F10 = 68 
F11 = 87 
F12 = 88 
PRINT = 183 
SCROLL = 70 
PAUSE = 197 
^ = 41 
1 = 2 
2 = 3 
3 = 4 
4 = 5 
5 = 6 
6 = 7 
7 = 8 
8 = 9 
9 = 10 
0 = 11 
ß = 12 
´ = 13 
Ü = 26 
Ö = 39 
Ä = 40 
# = 43 
< = 86 
, = 51 
. = 52 
- = 53 
+ = NOT DEFINED 
POS1 = 199 
TAB = 15 
ENTER = 28 
DELETE = 211 
BACKSPACE = 14 
INSERT = 210 
END = 207 
PAGEUP = 201 
PAGEDOWN = 209 
CAPS = 58 
A = 30 
B = 48 
C = 46 
D = 32 
E = 18 
F = 33 
G = 34 
H = 35 
I = 23 
J = 36 
K = 37 
L = 38 
M = 50 
N = 49 
O = 24 
P = 25 
Q = 16 
U = 22 
R = 19 
S = 31 
T = 20 
V = 47 
W = 17 
X = 45 
Y = 44 
Z = 21 
SHIFTL = 42 
SHIFTR = 54 
UP = 200 
DOWN = 208 
LEFT = 203 
RIGHT = 205 
NUM_0 = 82 
NUM_1 = 79 
NUM_2 = 80 
NUM_3 = 81 
NUM_4 = 75 
NUM_5 = 76 
NUM_6 = 77 
NUM_7 = 71 
NUM_8 = 72 
NUM_9 = 73 
NUM_+ = 78 
NUM = 69 
NUM_/ = 181 
NUM_* = 55 
NUM_- = 74 
NUM_, = 83 
NUM_ENTER = 156 
STRGL = 29 
STRGR = 157 
WINL = 220 
WINR = 219 
ALT = 56 
SPACE = 57 
ALTGR = 184 
APP = 221
*/