if (isServer) then {
    clearweaponCargoGlobal this;
    clearmagazineCargoGlobal this;
    clearitemCargoGlobal this;
    clearBackpackCargoGlobal this;
    this addmagazineCargoGlobal ["tsp_popperCharge_auto_mag", 10];
    this addmagazineCargoGlobal ["200Rnd_65x39_cased_Box", 60];
    this addmagazineCargoGlobal ["130Rnd_338_Mag", 40];
    this addmagazineCargoGlobal ["16Rnd_9x21_Mag", 60];
    this addweaponCargoGlobal ["rhs_weap_m136_hedp", 20];
    this addweaponCargoGlobal ["rhs_weap_m72a7", 10];
    this addmagazineCargoGlobal ["MRAWS_HEAT_F", 20];
    this addmagazineCargoGlobal ["MRAWS_HE_F", 10];
    this additemCargoGlobal ["SatchelCharge_Remote_Mag", 6];
    this additemCargoGlobal ["DemoCharge_Remote_Mag", 12];
    this additemCargoGlobal ["SR_Laptop", 1];

    if (isnil "SR_Night") then {
        SR_Night = false
    };
    if (SR_Night) then {
        this additemCargoGlobal ["ACE_IR_strobe_Item", 40];
        this additemCargoGlobal ["ACE_HandFlare_Red", 40];
        this additemCargoGlobal ["ACE_HandFlare_Green", 40];
        this additemCargoGlobal ["ACE_Chemlight_HiGreen", 40];
        this additemCargoGlobal ["B_IR_Grenade", 40];
    };
};
