// Enables cvo custom Arsenal, based on Role, defined by setVariable / getVariable.

// Adding a custom sub item category
//// Adding a Medical Tab
private _medicalTab = [
	"ACE_quikclot", "ACE_packingBandage","ACE_elasticBandage", "ACE_fieldDressing",
	"ACE_tourniquet", "ACE_splint",
    "ACE_morphine","ACE_epinephrine", "ACE_adenosine", 
	"ACE_salineIV", "ACE_salineIV_500","ACE_salineIV_250",
	"ACE_plasmaIV","ACE_plasmaIV_500","ACE_plasmaIV_250",
    "ACE_bloodIV","ACE_bloodIV_500","ACE_bloodIV_250",
    "ACE_surgicalKit","ACE_personalAidKit","ACE_bodyBag"
];
[_medicalTab, "Medical", getMissionPath "\cvo\img\redCrystal.paa"] call ace_arsenal_fnc_addRightPanelButton;


if (!cvo_p_custom_ace_arsenal) exitWith {};

// Defining Custom Arsenal Pools
//// Basic Kit, for everyone

CVO_A_Basic = [] + _CVO_A_Basic_Medical + _CVO_A_Basic_Radio + _CVO_A_Basic_Uniform + _CVO_A_Basic_Vests + _CVO_A_Basic_Backpacks; 
CVO_A_Basic = CVO_A_Basic + _CVO_A_Basic_Helmets + _CVO_A_Basic_Face + _CVO_A_Basic_NVG + _CVO_A_Basic_Bino + _CVO_A_Basic_Tools;
CVO_A_Basic = CVP_A_Basic + _CVO_A_Throwable + _CVO_A_EXO + _CVO_A_Basic_Rifles + _CVO_A_Basic_Pistols + _CVO_A_Basic_attachments;

_CVO_A_Basic_Medical = [
	"ACE_packingBandage",
	"ACE_fieldDressing",
	"ACE_tourniquet", 
	"ACE_splint",
    "ACE_morphine",
	"ACE_epinephrine", 
	"ACE_salineIV", 
	"ACE_salineIV_500",
	"ACE_salineIV_250",
	"ACE_personalAidKit",
	"ACE_bodyBag"
];

_CVO_A_Basic_Radios = ["ACRE_BF888S"];

_CVO_A_Basic_Uniforms = [
    "UK3CB_TKP_B_U_CIB_CombatUniform_BLK",
    "UK3CB_TKP_B_U_CIB_CombatUniform_Shortsleeve_BLK",
    "UK3CB_TKP_I_U_CIB_CombatUniform_DBLU",
    "UK3CB_TKP_O_U_CIB_CombatUniform_Ten_1",
    "UK3CB_TKP_I_U_CombatUniform_BLK",
    "UK3CB_TKP_I_U_QRF_CombatUniform_BLK",
    "UK3CB_TKP_I_U_Officer_BLK",
    "UK3CB_TKP_O_U_Officer_Blk",
    "UK3CB_TKP_O_U_QRF_CombatUniform_Blk",
    "UK3CB_TKP_O_U_CombatUniform_Blk"
];

_CVO_A_Basic_Vests = [
	"rhs_belt_AK4_back",
    "UK3CB_TKP_B_V_TacVest_Tan",
    "UK3CB_TKP_B_V_TacVest_Blk",
    "UK3CB_TKP_B_V_GA_HEAVY_BLK",
    "UK3CB_TKP_B_V_GA_LITE_BLK",
    "UK3CB_TKP_I_V_6Sh92_Radio_Tan",
    "UK3CB_TKP_I_V_6Sh92_Tan",
    "UK3CB_TKP_I_V_6Sh92_Radio_Des",
    "UK3CB_TKP_I_V_6Sh92_Des",
    "UK3CB_TKP_I_V_6Sh92_Radio_Khk",
    "UK3CB_TKP_I_V_6Sh92_Khk",
    "UK3CB_TKP_I_V_6Sh92_Radio_Blk",
    "UK3CB_TKP_I_V_6Sh92_Blk",
    "UK3CB_TKP_O_V_6b23_medic_BLK",
    "UK3CB_TKP_O_V_6b23_ML_6sh92_radio_BLK",
    "UK3CB_TKP_O_V_6b23_ml_BLK"
];

_CVO_A_Basic_Backpacks = [
    "UK3CB_TKA_O_B_ENG_Khk",
    "UK3CB_TKA_O_B_RIF_Khk",
    "UK3CB_TKP_I_B_ASS_MED_TAN",
    "UK3CB_TKP_O_B_ASS_MED_BLK",
    "UK3CB_TKP_O_B_ASS_BLK",
    "B_LegStrapBag_black_F",
    "B_Messenger_Black_F",
    "B_Messenger_Coyote_F",
    "B_Messenger_Gray_F",
    "rhs_rpg_empty",
    "rhs_rpg_2",
    "rhs_rpg_6b2",
    "rhs_rpg_6b3"
];

_CVO_A_Basic_Helmets = [
    "UK3CB_TKP_I_H_Beret",
	"UK3CB_TKP_O_H_Beret",
    "UK3CB_TKP_O_H_Patrolcap_Blk",
    "UK3CB_TKP_B_H_Patrolcap_TAN",
    "UK3CB_TKA_O_H_6b7_1m_bala1_TAN",
    "UK3CB_TKA_O_H_6b7_1m_ess_bala1_TAN",
    "UK3CB_TKA_O_H_6b7_1m_bala2_DES",
	"UK3CB_ARD_B_H_Crew_Cap_Ess",
	"UK3CB_H_Crew_Cap_Ess",
	"UK3CB_H_Crew_Cap",
	"UK3CB_ARD_B_H_Crew_Cap",
	"UK3CB_ARD_B_H_Crew_Cap",
	"H_Cap_tan",
	"H_Cap_blk",
	"rhs_gssh18"
	
];

_CVO_A_Basic_Face = [
	"G_Respirator_white_F",
    "rhsusf_shemagh_od",
    "rhsusf_shemagh2_od",
    "rhsusf_shemagh_tan",
    "rhsusf_shemagh2_tan",
    "rhs_scarf",
    "G_Bandanna_blk",
    "G_Bandanna_khk",
    "UK3CB_G_Balaclava2_BLK",
    "UK3CB_G_Balaclava2_DES",
    "G_Balaclava_blk",
	"G_Balaclava_TI_blk_F",
    "G_Aviator",
	"rhs_googles_yellow",
	"rhs_googles_orange",
	"rhs_googles_clear",
	"rhs_googles_black",
	"G_Bandanna_beast",
	"G_Bandanna_tan",
	"G_Combat",
	"G_Lowprofile",
	"rhs_ess_black",
	"UK3CB_G_KLR_TAN",
	"UK3CB_G_KL_BLK",
	"UK3CB_G_KL_TAN",
	"UK3CB_G_Neck_Shemag",
	"UK3CB_G_Neck_Shemag_Tan",
	"UK3CB_G_Neck_Shemag_KLR_blk",
	"UK3CB_G_Neck_Shemag_KLR_tan",
	"UK3CB_G_Neck_Shemag_KL_blk"];

_CVO_A_Basic_NVG = [
	//"rhs_1PN138"
];

_CVO_A_Basic_Bino = [
	//"Hate_Smartphone_HUD",
	//"Hate_Smartphone",
	//"Nikon_DSLR_HUD",
	//"Nikon_DSLR",
	"Old_Camera_HUD",
	"Old_Camera",
	"rhs_tr8_periscope_pip",
	"rhs_tr8_periscope",
	"Binocular"
];
_CVO_A_Basic_Tools = [
	"ChemicalDetector_01_watch_F",

	"ItemWatch",
	"ItemCompass",

	"murshun_cigs_cigpack",
	"murshun_cigs_lighter",
	"immersion_pops_poppack",
	"murshun_cigs_matches",

	"ACE_Humanitarian_Ration",
	"ACE_MapTools",
	"ace_marker_flags_yellow",
	"ace_marker_flags_red",
	"ace_marker_flags_green",
	"ace_marker_flags_blue",

	"ACE_EntrenchingTool",
	"ACE_EarPlugs",

	"ACE_DAGR",
	"ACE_CableTie",
	"acex_intelitems_notepad"
];

_CVO_A_Throwable =  [
	"rhs_mag_rdg2_white",
	"rhs_mag_rdg2_black",
	"rhs_mag_rgd5",
	"ACE_HandFlare_Red",
	"Chemlight_yellow",
	"ACE_Chemlight_White",
	"Chemlight_red",
	"ACE_Chemlight_Orange",
	"Chemlight_blue",
	"Chemlight_green",
	"ACE_M84"
];

_CVO_A_EXO = [
	"tsp_popperCharge_auto_mag",
	"tsp_popperCharge_mag"
	];

_CVO_A_Basic_Rifles = [
    "rhs_weap_ak74m_fullplum",
    "rhs_weap_ak74m_desert",
    "rhs_weap_ak74m_camo",
    "rhs_weap_ak74m",
	"rhs_weap_ak105",
	"rhs_weap_aks74u",
	"rhs_weap_aks74n",

	"rhs_30Rnd_545x39_7N10_AK",
	"rhs_30Rnd_545x39_7N10_plum_AK",
	"rhs_30Rnd_545x39_7N10_desert_AK",
	"rhs_30Rnd_545x39_7N10_camo_AK",
	"rhs_30Rnd_545x39_AK_plum_green",
	"rhs_30Rnd_545x39_7N6M_plum_AK",
	"rhs_30Rnd_545x39_7N10_2mag_plum_AK",
	"rhs_30Rnd_545x39_7N10_2mag_desert_AK",
	"rhs_30Rnd_545x39_7N10_2mag_camo_AK",
	"rhs_30Rnd_545x39_7N10_2mag_AK",


    "rhs_weap_ak104",
    "rhs_weap_ak103",
	"rhs_weap_akms",
	"rhs_30Rnd_762x39mm_89",
	"rhs_30Rnd_762x39mm_tracer",
	"rhs_30Rnd_762x39mm_polymer_89",
	"rhs_30Rnd_762x39mm_polymer_tracer",
	"rhs_30Rnd_762x39mm_bakelite_89",
	"rhs_30Rnd_762x39mm_bakelite_tracer",


	"uk3cb_sks_01_sling",
	"uk3cb_sks_01",
	"uk3cb_10rnd_magazine_sks",
	"uk3cb_muzzle_sks_bayonet"
];

_CVO_A_Basic_Pistols = [
	"rhs_weap_pya",
	"rhs_mag_9x19_17",
	
	"rhs_weap_rsp30_red",
	"rhs_weap_rsp30_green",
	"rhs_weap_rsp30_white",
	
	"tsp_meleeWeapon_mpl50_black",
	"tsp_meleeWeapon_ak"
];

_CVO_A_Basic_attachments = [
	"rhs_acc_2dpZenit",
	"rhs_acc_2dpZenit_ris",
	"rhs_acc_dtkakm",
	"rhs_acc_dtk",
	"rhs_acc_dtk1983",
	"rhs_acc_dtk1",
	"rhs_acc_dtk3",
	"rhs_acc_dtk2",
	"rhs_acc_dtk1p",
	"rhs_acc_pgs64_74un",
	"rhs_acc_pgs64_74u",
	"rhs_acc_pgs64",
	"rhs_acc_dtk1l"
];


//// Specific Kit, for certain "Roles" only

_CVO_A_Officer = [
	"G_Spectacles_Tinted",
	"UK3CB_TKP_B_H_Beret",
    "UK3CB_TKP_O_H_Patrolcap_Off_Blk",
    "UK3CB_TKP_B_H_Patrolcap_Off_TAN",
    "rhs_cossack_visor_cap",
	"H_Beret_blk",
	"rhs_cossack_visor_cap_tan"

	];

_CVO_A_Interpreter = [];

_CVO_A_TeamLeader = [
	"rhs_weap_ak74m_fullplum_gp25",
    "rhs_weap_ak74m_gp25",
	"rhs_VOG25",
	"rhs_VOG25P",
	"rhs_VG40SZ",
	"rhs_GRD40_White",
	"rhs_GRD40_Green",
	"rhs_GRD40_Red",
	"rhs_GDM40",
	"rhs_VG40OP_white",
	"rhs_VG40OP_red",
	"rhs_VG40OP_green",
	"rhs_VG40MD"
];

_CVO_A_RTO = ["ACRE_PRC77",
	"ACRE_VHF30108SPIKE",
	"ACRE_VHF30108",
	"ACRE_VHF30108MAST"];

_CVO_A_Medic = [
	"ACE_quikclot", 
	"ACE_elasticBandage", 
	"ACE_adenosine", 
	"ACE_plasmaIV",
	"ACE_plasmaIV_500",
	"ACE_plasmaIV_250",
    "ACE_bloodIV",
	"ACE_bloodIV_500",
	"ACE_bloodIV_250",
    "ACE_surgicalKit"
];

_CVO_A_MG = [
	"ACE_SpareBarrel_Item",
	"UK3CB_RPK_74",
	"UK3CB_RPK_74_BLK",
	"UK3CB_RPK_74_PLUM",
	"rhs_45Rnd_545X39_7N10_AK",
	"rhs_45Rnd_545X39_AK_Green",
	"rhs_60Rnd_545X39_AK_Green",
	"rhs_weap_pkm",
	"rhs_100Rnd_762x54mmR",
	"rhs_100Rnd_762x54mmR_green"
	];

_CVO_A_Marksman = ["UK3CB_SVD_OLD","rhs_10Rnd_762x54mmR_7N1"];

_CVO_A_AT = ["rhs_weap_rpg7", 
	"rhs_acc_pgo7v",
	"rhs_rpg7_PG7V_mag",
	"rhs_rpg7_OG7V_mag"];

_CVO_A_AA = ["rhs_weap_igla", "rhs_mag_9k38_rocket"];

_CVO_A_Engineer = [
	"ACE_VMM3","ACE_VMH3", 
	"ACE_wirecutter", "ToolKit", 
	"ACE_Fortify", "ACE_DefusalKit",
	"rhs_ec75_sand_mag",
	"rhs_ec400_sand_mag",
	"rhs_ec200_sand_mag",
	"tsp_frameCharge_mag",
	"tsp_stickCharge_mag",
	"tsp_stickCharge_auto_mag"
];


_CVO_A_CBRN = ["U_C_CBRN_Suit_01_Blue_F", 
"U_B_CBRN_Suit_01_White_F",
"G_AirPurifyingRespirator_01_F",
"G_RegulatorMask_F", 
"B_SCBA_01_F"];

_CVO_A_EW = [
	"hgun_esd_01_F",
	"muzzle_antenna_01_f",
	"muzzle_antenna_02_f",
	"muzzle_antenna_03_f",

	"ACE_UAVBattery",
	"B_UavTerminal",
	//"B_UAV_01_backpack_F",
	"B_UAV_06_backpack_F",
	"B_UGV_02_Demining_backpack_F",
	"B_UGV_02_Science_backpack_F"]; 

_CVO_A_Rifleman = [
	"rhs_acc_1p78",
	"tsp_paperclip"
];

CVO_A_Basic = [];
_individualKit = [];
systemChat str count CVO_A_Basic;
CVO_A_Basic = CVO_A_Basic + _CVO_A_Basic_Medical + _CVO_A_Basic_Radio + _CVO_A_Basic_Uniform + _CVO_A_Basic_Vests + _CVO_A_Basic_Backpacks;
systemChat str count CVO_A_Basic;
CVO_A_Basic = CVO_A_Basic + _CVO_A_Basic_Helmets + _CVO_A_Basic_Face + _CVO_A_Basic_NVG + _CVO_A_Basic_Bino + _CVO_A_Basic_Tools;
systemChat str count CVO_A_Basic;
CVO_A_Basic = CVP_A_Basic + _CVO_A_Throwable + _CVO_A_EXO + _CVO_A_Basic_Rifles + _CVO_A_Basic_Pistols + _CVO_A_Basic_attachments;
systemChat str count CVO_A_Basic;


if (player getVariable ["Officer",false]) then {
	systemChat "Officer detected";
	_individualKit append _CVO_A_Officer;
	_individualKit append _CVO_A_TeamLeader;
	_individualKit append _CVO_A_RTO;
};
if (player getVariable ["Interpreter",false]) then {
	systemChat "Interpreter detected";
	_individualKit append _CVO_A_Officer;
};
if (player getVariable ["TeamLeader",false]) then {
	systemChat "TeamLeader detected";
	_individualKit append _CVO_A_TeamLeader;
};
if (player getVariable ["Medic",false]) then {
	systemChat "Medic detected";
	_individualKit append _CVO_A_Medic;
};
if (player getVariable ["MG",false]) then {
	systemChat "MG detected";
	_individualKit append _CVO_A_MG;
};
if (player getVariable ["AT",false]) then {
	systemChat "AT detected";
	_individualKit append _CVO_A_AT;
};
if (player getVariable ["AA",false]) then {
	systemChat "AA detected";
	_individualKit append _CVO_A_AA;

};
if (player getVariable ["EW",false]) then {
	systemChat "EW detected";
	_individualKit append _CVO_A_EW;
	_individualKit append _CVO_A_RTO;
};
if (player getVariable ["CBRN",false]) then {
	systemChat "CBRN detected";
	_individualKit append _CVO_A_CBRN;
};
if (player getVariable ["Marksman",false]) then {
	systemChat "Marksman detected";
	_individualKit append _CVO_A_Marksman;
};
if (player getVariable ["Rifleman",false]) then {
	systemChat "Rifleman detected";
	_individualKit append _CVO_A_Rifleman;
};




/*
 * Author: Alganthe, Dedmen
 * Add virtual items to the provided target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Items <ARRAY of strings> <BOOL>
 * 2: Add globally <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_addVirtualItems
 * [_box, true, false] call ace_arsenal_fnc_addVirtualItems
 *
 * Public: Yes
*/

systemChat "Basic Kit, count: " + str count CVO_A_Basic;
systemChat "_individualKit, count: " + str count _individualKit;

private _addItems = CVO_A_Basic + _individualKit;

[cvo_test_crate, false, false] call ace_arsenal_fnc_initBox;
[cvo_test_crate, _addItems, false] call ace_arsenal_fnc_addVirtualItems;



// if (cvo_p_custom_ace_arsenal) then {};