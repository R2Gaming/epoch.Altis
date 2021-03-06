// Credits for original script: Bohemia Interactive http://bistudio.com
 
// ========== SCRIPT CONFIG ============
_Delay = 5; // //Wait in seconds before the credits start after player IS ingame
_onScreenTime = 6; //how long one role should stay on screen. Use value from 0 to 10 where 0 is almost instant transition to next role
//NOTE: Above value is not in seconds. It is percentage. Default: 6
_IntroMusic = false; // Intro Music With the credits. Defualt = False. (true or false)
_size1 = 0.60; // Size for The Heading in each credit role
_color1 = "#EFF700"; // #f2cb0b is HTML Code. change it to whatever you want. make sure its a valid HTML code with # infront
_size2 = 0.50; // size for each sub Credit
_color2 = "#FFFFFF"; // #FFFFFF is HTML Code. change it to whatever you want. make sure its a valid HTML code with # infront
// Find the color code you want here: http://html-color-codes.info

// ==== CUSTOMIZING THE CREDITS ===
// If you want more or less credits on the screen, you have to add/remove roles.
// Watch out though, you need to make sure BOTH role lists match eachother in terms of amount.
// Just take a good look at the _role1 and the rest and you will see what I mean.
 
// ==== SCRIPT START ====
waitUntil {!isNuLL(uiNameSpace getVariable ["EPOCH_loadingScreen",displayNull])};
waitUntil {isNuLL(uiNameSpace getVariable ["EPOCH_loadingScreen",displayNull])};
sleep _Delay;

if (_IntroMusic) then {
    playSound "intro"; // This calls the code inside of description.ext //
};
 
_role1 = "Welcome to<br />R2 Gaming Epoch ";
_role1names = ["Please visit the site for rewards."];
_role2 = "Admins:";
_role2names = ["Untugs, Riddlez, Jesstickles,<br />LoneKirov, Education, Zorzor<br />DGuy, Jaggid."];
_role3 = "Server mods:";
_role3names = ["EpochMod, Altis, wMessage"];
_role4 = "Server anti-hack";
_role4names = ["by infiSTAR.de"];
_role5 = "Server Specs:";
_role5names = ["3.4ghz INTEL XEON 100mb Line"];
_role6 = "Website:";
_role6names = ["www.r2clan.net"];
_role7 = "Teamspeak";
_role7names = ["ts3.r2clan.net"];
_role8 = "Sign up and join us in teamspeak.";
_role8names = ["It's always a good time."];
_role9 = "Keep an eye out for events and for r2 credit rewards.";
_role9names = ["See you in the Barrens of Epoch."];

{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='%2' color='%3' align='right'>%1<br /></t>", _memberFunction,_size1,_color1];
_finalText = _finalText + format["<t size='%1' color='%2' align='right'>",_size2,_color2];
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names],
[_role8, _role8names],
[_role9, _role9names]
];