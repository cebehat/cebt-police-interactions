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
Config.CalloutLocations = {
    {
        coords = vector3(1172.32, 2695.93, 37.87),
        description = '',
        calloutType = 'shotsfired',
        weapon = 'WEAPON_PISTOL',
    },
}
Config.CalloutNpcs = {
    {
        'a_m_m_mexlabor_01',
        'a_m_m_hillbilly_02',
        'a_m_m_hillbilly_01'
    }
}