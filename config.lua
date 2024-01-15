--|--------------------------------------------------------------------------------|--
--|--------------------------------  C O N F I G  ---------------------------------|--
--|--------------------------------------------------------------------------------|--
--To find your desired key visit http://docs.fivem.net/game-references/controls/ for a list of all compatible keys.

--K E Y B I N D I N G S--

modifier = 210 --Default 'Left Control'
kbpomnu = 21 --Default 'Shift' [Pullover keybinding keyboard]
ctrpomnu = 22 --Default 'Shift' [Pullover keybinding controller]
trfmnu = 51 --Default 'E' [Traffic Stop Interaction Menu]
trfcveh = 246 --Default 'Y' [Mimic/Follow Menu]
mainmnu = 303 --Default 'U' [Interaction Menu]

--O T H E R--
reverseWithPlayer = true  --While using mimic, the stopped vehicle will reverse with you, if set to 'false' the stopped vehicle will accelerate when you reverse.
towfadetime = 6





Config = {}
Config.NpcDespawnTime = 30 --Time in seconds before the NPC despawns after the callout is completed
Config.CalloutLocations = {
    -- vector4(149.36, -1039.7, 29.37, 152.92),
    vector4(1175.74, 2706.01, 38.09, 157.33),
    -- vector4(1166.27, 2707.77, 38.16, 2.78),
    -- vector4(314.46, -278.15, 54.17, 144.6)
}

Config.CalloutDefinitions = {
    {
        calloutType = 'shotsfired',
        dispatchmessage = 'Report of shots fired has been received, please respond to the location. Suspect is armed and dangerous',
        calloutPay = 200,
    }
}
Config.GunTypes = {
    'WEAPON_PISTOL',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    'WEAPON_REVOLVER',
    'WEAPON_DOUBLEACTION',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_SAWNOFFSHOTGUN',
    'WEAPON_CARBINERIFLE'
}
Config.CalloutNpcs = {
    {
        'a_m_m_mexlabor_01',
        'a_m_m_hillbilly_02',
        'a_m_m_hillbilly_01',
        'a_m_m_eastsa_02',
        'a_m_m_eastsa_01',
        'a_m_m_salton_03',
        'a_m_m_salton_04',
        'a_m_y_acult_01',
        'a_m_y_acult_02',
        'a_m_y_acult_03',

    }
}

