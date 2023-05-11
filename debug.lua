
local v = "1.4"
 utils.http_get("https://unhittable.cc/p/raw/📸/1kxygrhot9qb2ysg5", "Accept: */*", function(ver)
    utils.http_get("https://cdn.discordapp.com/attachments/1096556923979059255/1106257754835931166/Maniakc.lua", "Accept: */*", function(manigu)
    if v ~= ver then fs.write("fatality\\scripts\\lib\\Maniak.lua",manigu)
    end
end)
end)
ffi.cdef[[
    typedef struct mask {
        char m_pDriverName[512];
        unsigned int m_VendorID;
        unsigned int m_DeviceID;
        unsigned int m_SubSysID;
        unsigned int m_Revision;
        int m_nDXSupportLevel;
        int m_nMinDXSupportLevel;
        int m_nMaxDXSupportLevel;
        unsigned int m_nDriverVersionHigh;
        unsigned int m_nDriverVersionLow;
        int64_t pad_0;
        union {
            int xuid;
            struct {
                int xuidlow;
                int xuidhigh;
            };
        };
        char name[128];
        int userid;
        char guid[33];
        unsigned int friendsid;
        char friendsname[128];
        bool fakeplayer;
        bool ishltv;
        unsigned int customfiles[4];
        unsigned char filesdownloaded;
    };
    typedef int(__thiscall* get_current_adapter_fn)(void*);
    typedef void(__thiscall* get_adapters_info_fn)(void*, int adapter, struct mask& info);
    typedef bool(__thiscall* file_exists_t)(void* this, const char* pFileName, const char* pPathID);
    typedef long(__thiscall* get_file_time_t)(void* this, const char* pFileName, const char* pPathID);
]]

local material_system = utils.find_interface('materialsystem.dll', 'VMaterialSystem080')
local material_interface = ffi.cast('void***', material_system)[0]

local get_current_adapter = ffi.cast('get_current_adapter_fn', material_interface[25])
local get_adapter_info = ffi.cast('get_adapters_info_fn', material_interface[26])

local current_adapter = get_current_adapter(material_interface)

local adapter_struct = ffi.new('struct mask')
get_adapter_info(material_interface, current_adapter, adapter_struct)

local driverName = tostring(ffi.string(adapter_struct['m_pDriverName']))
local vendorId = tostring(adapter_struct['m_VendorID'])
local deviceId = tostring(adapter_struct['m_DeviceID'])
class_ptr = ffi.typeof("void***")
rawfilesystem = utils.find_interface("filesystem_stdio.dll", "VBaseFileSystem011")
filesystem = ffi.cast(class_ptr, rawfilesystem)
file_exists = ffi.cast("file_exists_t", filesystem[0][10])
get_file_time = ffi.cast("get_file_time_t", filesystem[0][13])

function bruteforce_directory()
    for i = 65, 90 do
        local directory = string.char(i) .. ":\\Windows\\Setup\\State\\State.ini"

        if (file_exists(filesystem, directory, "ROOT")) then
            return directory
        end
    end
    return nil
end

local directory = bruteforce_directory()
local install_time = get_file_time(filesystem, directory, "ROOT")
local hardwareID = install_time * 2

local hwid = ((vendorId*deviceId) * 2) + hardwareID
local hwwid = tostring(hwid)
local lhwid = {}
    utils.http_get("https://unhittable.cc/p/raw/📸/e48vr5r3amx8n98zc", "Accept: */*",function(a)string=a;for b in string:gmatch('"([^"]+)"')do table.insert(lhwid,b) end end)
   for i=1,#lhwid do
if hwwid == lhwid[i] == false then
   engine.exec("exit") 
end
end
local MenuSelection = gui.add_listbox ("Maniak.lua", "lua>tab a", 5, true, {"--> Home", "--> Ragebot", "--> Anti-Aim", "--> Visuals", "--> Misc"})
local ragemenu = gui.add_listbox("RageBot", "lua>tab a", 5, true, {"Main", "Ragebot Improvers","Exploits","Ideal Tick", "Weapon hitchance Override"})
local aaad = gui.add_listbox("Anti-Aim", "lua>tab a",6, true, { "Anti-aim Builder", "Anti-Aim Presets", "Exploits", "Manual Anti-Aim","3/5/X-Way", "Anti-Aim Improvers"})
local vis = gui.add_listbox("Visuals", "lua>tab a", 2, true, { "Visuals", "Colors"})
--main shit

local version = "Debug"



local shots = {}
local name = engine.get_player_info(engine.get_local_player()).name



--:)


local timer = utils.new_timer(20000, function()
    engine.exec("clear")
end)
timer:run_once()

--Main shit end0

--:) end


-- widgets





--home


--- @ragebot
local rage = {}
rage.rbi = gui.add_checkbox("Ragebot Improvements", "lua>tab b")
rage.rs = gui.add_checkbox("Better Scout", "lua>tab b")
rage.osf = gui.add_checkbox("OS-AA fix", "lua>tab b")
rage.os = gui.add_combo("OS-AA", "lua>tab b", {"Firerate", "Lagcomp break", "Full fakelag"})
rage.resolver = gui.add_checkbox("Roll Resolver", "lua>tab b")
gui.add_keybind("lua>tab b>Roll Resolver")
rage.dttick = gui.add_checkbox("Prediction system", "lua>tab b")
rage.pred = gui.add_combo("Prediction System Settings:", "lua>tab b", {"Normal", "Fast", "AX but on Steroids"})
rage.idealtick = gui.add_checkbox("Ideal Tick", "lua>tab b")
rage.tripletap = gui.add_checkbox("TripleTap", "lua>tab b")
rage.idp0 = gui.add_checkbox("0 Pitch on Ideal Tick", "lua>tab b")
rage.idp1 = gui.add_checkbox("Pitch Up on Ideal Tick", "lua>tab b")
rage.fs0 = gui.add_checkbox("Freestand on Ideal Tick", "lua>tab b")
rage.da0 = gui.add_checkbox("Dormant Aimbot on Ideal Tick", "lua>tab b")
rage.hs0 = gui.add_checkbox("Headshot on Ideal Tick", "lua>tab b")
rage.fss = gui.add_checkbox("Static Freestand on Ideal Tick", "lua>Tab b")
rage.legitaaitt = gui.add_checkbox("Legit AA on Ideal Tick", "lua>tab b")
rage.DormantA = gui.add_checkbox("Dormant Aimbot", "lua>tab b")
gui.add_keybind("lua>tab b>Dormant Aimbot")
rage.fastdt = gui.add_checkbox("Faster DT on Ideal Tick", "lua>tab b")
rage.dttickb = gui.add_checkbox("Doubletap Improver", "lua>tab b")
rage.dttype = gui.add_combo("DoubleTap type:", "lua>tab b", {"Aggresive", "Defensive"})
rage.dtee = gui.add_checkbox("Defensive DT Teleport", "lua>tab b")
gui.add_keybind("lua>tab b>Defensive DT Teleport")
rage.nore1 = gui.add_checkbox("No Recoil", "lua>tab b")
rage.wfdtr = gui.add_checkbox("Wait For DT to recharge", "lua>tab b")
rage.dtttp = gui.add_checkbox("Dt Spammer", "lua>tab b")
gui.add_keybind("lua>tab b>Dt Spammer")
rage.ns = gui.add_checkbox("Force Accuracy", "lua>tab b")
rage.ns1 = gui.add_checkbox("No Spread", "lua>tab b")
rage.dhodt = gui.add_checkbox("Disable OS-AA on DT", "lua>tab b")



--- @override
local override = {}
 override.over = gui.add_checkbox("Scout Hitchance Override", "lua>Tab b")
 override.over1 = gui.add_slider("Override [In Air]:", "lua>tab b", 1, 100, 1)
 override.over2 = gui.add_slider("Override [SlowWalk]:", "lua>tab b", 1, 100, 1)
 override.over3 = gui.add_slider("Override [Moving]:", "lua>tab b", 1, 100, 1)
 override.over4 = gui.add_slider("Override [Standing]:", "lua>tab b", 1, 100, 1)
 override.over0 = gui.add_slider("Override [Crouch + Air]:", "lua>tab b", 1, 100, 1)
 override.over5 = gui.add_slider("Override [Crouch]:", "lua>tab b", 1, 100, 1)
 override.over6 = gui.add_slider("Override [Auto Peek]:", "lua>tab b", 1, 100, 1)
 override.over7 = gui.add_slider("Override [Fake Duck]:", "lua>tab b", 1, 100, 1)
 override.over8 = gui.add_slider("Override [No Scope]:", "lua>tab b", 1, 100, 1)


--- @AA
local aa = {}
aa.IV = gui.add_checkbox("Invert Anti-Aim", "lua>tab b")
gui.add_keybind("lua>tab b>Invert Anti-Aim")
aa.FF = gui.add_checkbox("Fake Flick", "lua>Tab b")
gui.add_keybind("lua>tab b>Fake Flick")
aa.legit = gui.add_checkbox("Legit AA", "lua>tab b")
gui.add_keybind("lua>tab b>Legit AA")
aa.aaim2 = gui.add_checkbox("5-Way", "lua>tab b")
aa.aaim22 = gui.add_slider("5-Way:", "lua>tab b", -50, 50, 0)
local sjj = gui.add_checkbox("Sway Jitter", "lua>tab b")
aa.sjjj = gui.add_slider("Sway Range", "lua>tab b", 0, 60, 0)
aa.sjs = gui.add_slider("Sway Speed", "lua>tab b", 0, 60, 0)
aa.aaim33 = gui.add_checkbox("3-Way", "lua>tab b")
aa.aaim3 = gui.add_slider("3-Way:", "lua>tab b", -30, 30, 0)
aa.aaimxx = gui.add_checkbox("X-Way", "lua>tab b")
aa.aaimx = gui.add_slider("X-Way:", "lua>tab b", -100, 100, 0)
aa.manualb = gui.add_checkbox("Manual Back", "lua>tab b")
aa.manualr = gui.add_checkbox("Manual Right", "lua>tab b")
aa.manualf = gui.add_checkbox("Manual Up", "lua>tab b")
aa.manuall = gui.add_checkbox("Manual Left", "lua>tab b")
gui.add_keybind("lua>tab b>Manual Back")
gui.add_keybind("lua>tab b>Manual Right")
gui.add_keybind("lua>tab b>Manual Up")
gui.add_keybind("lua>tab b>Manual Left")
aa.preset = gui.add_checkbox("Anti-Aim Presets", "lua>tab b")
aa.presets = gui.add_combo("Anti-Aim Presets:", "lua>tab b", {"JustManiak's Preset", "Tank Anti-Aim", "Roll", "Skeet Fucker", "Fast Jitter", "1x1/2x2/3x3", "Small Jitter", "Bombardier AA", "Static Anti-Aim"})
aa.fix = gui.add_checkbox("Fix Freestand Flicking", "lua>Tab b")
aa.puexp = gui.add_checkbox("Pitch Up Exploit", "lua>Tab b")
aa.puexp1 = gui.add_checkbox("Defensive Anti-Aim", "lua>Tab b")
gui.add_keybind("lua>tab b>Defensive Anti-Aim")
aa.abff = gui.add_checkbox("Anti Brute Force", "lua>tab b")
aa.fhh = gui.add_checkbox("Fake Head", "lua>tab b")
gui.add_keybind("lua>tab b>Fake Head")
local djjc = gui.add_checkbox("Jitter", "lua>tab b")
local djs = gui.add_slider("Jitter Range", "lua>tab b", 1, 180, 1)
local djj = gui.add_slider("Jitter Ticks", "lua>tab b", 2, 20, 2)
local fll = gui.add_checkbox("Fakelag", "lua>tab b")
local flll = gui.add_slider("Fakelag Amount:", "lua>tab b", 1, 17, 1)

 
-- visuals
local watermark2 = gui.add_checkbox("Watermark", "lua>tab b")
local watermarks = gui.add_combo("Watermark Styles", "lua>tab b", {"Skeet Style", "Solus UI"})
local infobar = gui.add_checkbox("Info Tab", "lua>tab b")
local keybinds2 = gui.add_checkbox("Keybinds", "lua>tab b")
local keybindss = gui.add_combo("Keybinds Styles", "lua>tab b", {"Skeet Style", "Souls UI"})
local indicatorsmain = gui.add_checkbox("Indicators", "lua>tab b")
local mww = gui.add_checkbox("Menu Watermark", "lua>tab b")
local indicatorstype = gui.add_combo("Indicators | Type", "lua>tab b", {"Aesthetic", "Skeet style"})
local infotabflag = gui.add_combo("Info Tab | Flag", "lua>tab b", {"Romania", "Italy", "French", "Poland"})
local lethalbind = gui.add_checkbox("Lethal Flag", "lua>tab b")
local skeetind = gui.add_checkbox("Skeet Indicators", "lua>tab b")
local g_Type = gui.add_combo("Grenades ESP", "lua>tab b", {"Off", "Top", "Bottom"})
local dmgm = gui.add_checkbox("Damage Indicator", "lua>tab b")



-- others
local killsay = gui.add_checkbox("Killsay", "lua>tab b")
local killsays = gui.add_combo("Killsay Type:", "lua>tab b", {"None", "Sponsor", "Trashtalk"})
local clantag = gui.add_checkbox("Clantag", "lua>tab b")
local clan = gui.add_combo("Clantags:", "lua>tab b", {"None","Maniak.lua", "weed version"})
local aspectratiobutton = gui.add_checkbox("Aspect ratio", "lua>tab b")
local aspect_ratio_slider = gui.add_slider("[Aspect Ratio Value]", "lua>tab b", 1, 200, 1)
local Hitlogs = gui.add_checkbox("Hitlogs", "lua>tab b")
local svc1 = gui.add_checkbox("sv_cheats", "lua>tab b")
local slowwalk_box = gui.add_checkbox("Slow Walk", "lua>tab b")
local slowwalk_slider = gui.add_slider("Speed", "lua>tab b", 1, 100, 1)
local safe1 = gui.add_checkbox("safepoint", "lua>tab b")
local safe2 = gui.add_checkbox("roll safepoint", "lua>tab b")



local screen_size = {render.get_screen_size()}
local keybinds_x = gui.add_slider("keybinds_x", "lua>tab a", 0, screen_size[1], 1)
local keybinds_y = gui.add_slider("keybinds_y", "lua>tab a", 0, screen_size[2], 1)

-- colors
local watermark_bcolor = gui.add_checkbox("Watermark Color", "lua>tab b")
local watermark_color = gui.add_colorpicker("lua>tab b>Watermark Color", true)
local mwatermark_bcolor = gui.add_checkbox("Menu Watermark Color", "lua>tab b")
local mwatermark_color = gui.add_colorpicker("lua>tab b>Menu Watermark Color", true)
local keybinds_bcolor = gui.add_checkbox("Keybinds Color", "lua>tab b")
local keybinds_color = gui.add_colorpicker("lua>tab b>Keybinds Color", true)
local infobar_bcolor = gui.add_checkbox("Infobar Color", "lua>tab b")
local infobar_color = gui.add_colorpicker("lua>tab b>Infobar Color", true)
local indicator_bcolor = gui.add_checkbox("Indicator Color", "lua>tab b")
local indicator_color = gui.add_colorpicker("lua>tab b>Indicator Color", true)
local hllc = gui.add_checkbox("Hitlogs Color", "lua>tab b")
local hlc = gui.add_colorpicker("lua>tab b>Hitlogs Color", true)
local g_bColorPicker = gui.add_checkbox("Grenade ESP Color", "lua>tab b")
local g_ColorPicker = gui.add_colorpicker("lua>tab b>Grenade ESP Color", true)

local WorkAA = gui.add_checkbox("AntiAim Builder", "lua>tab b")

local States = gui.add_combo("Choose AntiAim Condition:", "lua>tab b", {"None", "Standing", "Run","Slow Walk","Crouch", "Crouch In Air", "Air", "Fake Duck", "Auto Peek"})



aa.standing_pitch = gui.add_combo("[Standing] Pitch", "lua>tab b", {"None", "Down", "Up", "Zero"})
aa.standing_jittertoggle = gui.add_checkbox("[Standing] Jitter", "lua>tab b")
aa.standing_jitterrange = gui.add_slider("[Standing] Jitter range", "lua>tab b", -360, 360, 0)
aa.standing_faketoggle = gui.add_checkbox("[Standing] Fake", "lua>tab b")
aa.standing_fakeamount = gui.add_slider("[Standing] Fake %", "lua>tab b", -100, 100, 0)
aa.standing_compangle = gui.add_slider("[Standing] Compensate Angle", "lua>tab b", -100, 100, 0)
aa.standing_att = gui.add_checkbox("[Standing] At fov target", "lua>tab b")
aa.standing_spintog = gui.add_checkbox("[Standing] Spin Toggle", "lua>tab b")
aa.standing_spinr = gui.add_slider("[Standing] Spin Range", "lua>tab b", -360, 360, 0)
aa.standing_spins = gui.add_slider("[Standing] Spin Speed", "lua>tab b", -600, 600, 0)
aa.standing_rollonoff = gui.add_combo("[Standing] Roll", "lua>tab b", {"None", "Static", "Extend Fake", "Invert Fake", "Freestand", "Freestand Opposite", "Jitter"})
aa.standing_roll = gui.add_slider("[Standing] Roll AA", "lua>tab b>",  -            127000, 127000, 0)
aa.standing_ensure = gui.add_checkbox("[Standing] Ensure Roll AA", "lua>tab b")

aa.moving_pitch = gui.add_combo("[Moving] Pitch", "lua>tab b", {"None", "Down", "Up", "Zero"})
aa.moving_jittertoggle = gui.add_checkbox("[Moving] Jitter", "lua>tab b")
aa.moving_jitterrange = gui.add_slider("[Moving] Jitter range", "lua>tab b", -360, 360, 0)
aa.moving_faketoggle = gui.add_checkbox("[Moving] Fake", "lua>tab b")
aa.moving_fakeamount = gui.add_slider("[Moving] Fake %", "lua>tab b", -100, 100, 0)
aa.moving_compangle = gui.add_slider("[Moving] Compensate Angle", "lua>tab b", -100, 100, 0)
aa.moving_att = gui.add_checkbox("[Moving] At fov target", "lua>tab b")
aa.moving_spintog = gui.add_checkbox("[Moving] Spin Toggle", "lua>tab b")
aa.moving_spinr = gui.add_slider("[Moving] Spin Range", "lua>tab b", -360, 360, 0)
aa.moving_spins = gui.add_slider("[Moving] Spin Speed", "lua>tab b", -600, 600, 0)
aa.moving_rollonoff = gui.add_combo("[Moving] Roll", "lua>tab b", {"None", "Static", "Extend Fake", "Invert Fake", "Freestand", "Freestand Opposite", "Jitter"})
aa.moving_roll = gui.add_slider("[Moving] Roll AA", "lua>tab b>",  -127000, 127000, 0)
aa.moving_ensure = gui.add_checkbox("[Moving] Ensure Roll AA", "lua>tab b")

aa.slowwalk_pitch = gui.add_combo("[Slow Walking] Pitch", "lua>tab b", {"None", "Down", "Up", "Zero"})
aa.slowwalk_jittertoggle = gui.add_checkbox("[Slow Walking] Jitter", "lua>tab b")
aa.slowwalk_jitterrange = gui.add_slider("[Slow Walking] Jitter range", "lua>tab b", -360, 360, 0)
aa.slowwalk_faketoggle = gui.add_checkbox("[Slow Walking] Fake", "lua>tab b")
aa.slowwalk_fakeamount = gui.add_slider("[Slow Walking] Fake %", "lua>tab b", -100, 100, 0)
aa.slowwalk_compangle = gui.add_slider("[Slow Walking] Compensate Angle", "lua>tab b", -100, 100, 0)
aa.slowwalk_att = gui.add_checkbox("[Slow Walking] At fov target", "lua>tab b")
aa.slowwalk_spintog = gui.add_checkbox("[Slow Walking] Spin Toggle", "lua>tab b")
aa.slowwalk_spinr = gui.add_slider("[Slow Walking] Spin Range", "lua>tab b", -360, 360, 0)
aa.slowwalk_spins = gui.add_slider("[Slow Walking] Spin Speed", "lua>tab b", -600, 600, 0)
aa.slowwalk_rollonoff = gui.add_combo("[Slow Walking] Roll", "lua>tab b", {"None", "Static", "Extend Fake", "Invert Fake", "Freestand", "Freestand Opposite", "Jitter"})
aa.slowwalk_roll = gui.add_slider("[Slow Walking] Roll AA", "lua>tab b>",  -127000, 127000, 0)
aa.slowwalk_ensure = gui.add_checkbox("[Slow Walking] Ensure Roll AA", "lua>tab b")

aa.crouching_pitch = gui.add_combo("[Crouching] Pitch", "lua>tab b", {"None", "Down", "Up", "Zero"})
aa.crouching_jittertoggle = gui.add_checkbox("[Crouching] Jitter", "lua>tab b")
aa.crouching_jitterrange = gui.add_slider("[Crouching] Jitter range", "lua>tab b", -360, 360, 0)
aa.crouching_faketoggle = gui.add_checkbox("[Crouching] Fake", "lua>tab b")
aa.crouching_fakeamount = gui.add_slider("[Crouching] Fake %", "lua>tab b", -100, 100, 0)
aa.crouching_compangle = gui.add_slider("[Crouching] Compensate Angle", "lua>tab b", -100, 100, 0)
aa.crouching_att = gui.add_checkbox("[Crouching] At fov target", "lua>tab b")
aa.crouching_spintog = gui.add_checkbox("[Crouching] Spin Toggle", "lua>tab b")
aa.crouching_spinr = gui.add_slider("[Crouching] Spin Range", "lua>tab b", -360, 360, 0)
aa.crouching_spins = gui.add_slider("[Crouching] Spin Speed", "lua>tab b", -600, 600, 0)
aa.crouching_rollonoff = gui.add_combo("[Crouching] Roll", "lua>tab b", {"None", "Static", "Extend Fake", "Invert Fake", "Freestand", "Freestand Opposite", "Jitter"})
aa.crouching_roll = gui.add_slider("[Crouching] Roll AA", "lua>tab b>",  -127000, 127000, 0)
aa.crouching_ensure = gui.add_checkbox("[Crouching] Ensure Roll AA", "lua>tab b")

aa.crouchingair_pitch = gui.add_combo("[Crouch + Air] Pitch", "lua>tab b", {"None", "Down", "Up", "Zero"})
aa.crouchingair_jittertoggle = gui.add_checkbox("[Crouch + Air] Jitter", "lua>tab b")
aa.crouchingair_jitterrange = gui.add_slider("[Crouch + Air] Jitter range", "lua>tab b", -360, 360, 0)
aa.crouchingair_faketoggle = gui.add_checkbox("[Crouch + Air] Fake", "lua>tab b")
aa.crouchingair_fakeamount = gui.add_slider("[Crouch + Air] Fake %", "lua>tab b", -100, 100, 0)
aa.crouchingair_compangle = gui.add_slider("[Crouch + Air] Compensate Angle", "lua>tab b", -100, 100, 0)
aa.crouchingair_att = gui.add_checkbox("[Crouch + Air] At fov target", "lua>tab b")
aa.crouchingair_spintog = gui.add_checkbox("[Crouch + Air] Spin Toggle", "lua>tab b")
aa.crouchingair_spinr = gui.add_slider("[Crouch + Air] Spin Range", "lua>tab b", -360, 360, 0)
aa.crouchingair_spins = gui.add_slider("[Crouch + Air] Spin Speed", "lua>tab b", -600, 600, 0)
aa.crouchingair_rollonoff = gui.add_combo("[Crouch + Air] Roll", "lua>tab b", {"None", "Static", "Extend Fake", "Invert Fake", "Freestand", "Freestand Opposite", "Jitter"})
aa.crouchingair_roll = gui.add_slider("[Crouch + Air] Roll AA", "lua>tab b>",  -8, 8, 0)
aa.crouchingair_ensure = gui.add_checkbox("[Crouch + Air] Ensure Roll AA", "lua>tab b")

aa.air_pitch = gui.add_combo("[In Air] Pitch", "lua>tab b", {"None", "Down", "Up", "Zero"})
aa.air_jittertoggle = gui.add_checkbox("[In Air] Jitter", "lua>tab b")
aa.air_jitterrange = gui.add_slider("[In Air] Jitter range", "lua>tab b", -360, 360, 0)
aa.air_faketoggle = gui.add_checkbox("[In Air] Fake", "lua>tab b")
aa.air_fakeamount = gui.add_slider("[In Air] Fake %", "lua>tab b", -100, 100, 0)
aa.air_compangle = gui.add_slider("[In Air] Compensate Angle", "lua>tab b", -100, 100, 0)
aa.air_att = gui.add_checkbox("[In Air] At fov target", "lua>tab b")
aa.air_spintog = gui.add_checkbox("[In Air] Spin Toggle", "lua>tab b")
aa.air_spinr = gui.add_slider("[In Air] Spin Range", "lua>tab b", -360, 360, 0)
aa.air_spins = gui.add_slider("[In Air] Spin Speed", "lua>tab b", -700, 700, 0)
aa.air_rollonoff = gui.add_combo("[In Air] Roll", "lua>tab b", {"None", "Static", "Extend Fake", "Invert Fake", "Freestand", "Freestand Opposite", "Jitter"})
aa.air_roll = gui.add_slider("[In Air] Roll AA", "lua>tab b>",  -8, 8, 0)
aa.air_ensure = gui.add_checkbox("[In Air] Ensure Roll AA", "lua>tab b")

aa.fd_pitch = gui.add_combo("[Fake Ducking] Pitch", "lua>tab b", {"None", "Down", "Up", "Zero"})
aa.fd_jittertoggle = gui.add_checkbox("[Fake Ducking] Jitter", "lua>tab b")
aa.fd_jitterrange = gui.add_slider("[Fake Ducking] Jitter range", "lua>tab b", -360, 360, 0)
aa.fd_faketoggle = gui.add_checkbox("[Fake Ducking] Fake", "lua>tab b")
aa.fd_fakeamount = gui.add_slider("[Fake Ducking] Fake %", "lua>tab b", -100, 100, 0)
aa.fd_compangle = gui.add_slider("[Fake Ducking] Compensate Angle", "lua>tab b", -100, 100, 0)
aa.fd_att = gui.add_checkbox("[Fake Ducking] At fov target", "lua>tab b")
aa.fd_spintog = gui.add_checkbox("[Fake Ducking] Spin Toggle", "lua>tab b")
aa.fd_spinr = gui.add_slider("[Fake Ducking] Spin Range", "lua>tab b", -360, 360, 0)
aa.fd_spins = gui.add_slider("[Fake Ducking] Spin Speed", "lua>tab b", -600, 600, 0)
aa.fd_rollonoff = gui.add_combo("[Fake Ducking] Roll", "lua>tab b", {"None", "Static", "Extend Fake", "Invert Fake", "Freestand", "Freestand Opposite", "Jitter"})
aa.fd_roll = gui.add_slider("[Fake Ducking] Roll AA", "lua>tab b>",  -127000, 127000, 0)
aa.fd_ensure = gui.add_checkbox("[Fake Ducking] Ensure Roll AA", "lua>tab b")

aa.ap_pitch = gui.add_combo("[Auto Peeking] Pitch", "lua>tab b", {"None", "Down", "Up", "Zero"})
aa.ap_jittertoggle = gui.add_checkbox("[Auto Peeking] Jitter", "lua>tab b")
aa.ap_jitterrange = gui.add_slider("[Auto Peeking] Jitter range", "lua>tab b", -360, 360, 0)
aa.ap_faketoggle = gui.add_checkbox("[Auto Peeking] Fake", "lua>tab b")
aa.ap_fakeamount = gui.add_slider("[Auto Peeking] Fake %", "lua>tab b", -100, 100, 0)
aa.ap_compangle = gui.add_slider("[Auto Peeking] Compensate Angle", "lua>tab b", -100, 100, 0)
aa.ap_att = gui.add_checkbox("[Auto Peeking] At fov target", "lua>tab b")
aa.ap_spintog = gui.add_checkbox("[Auto Peeking] Spin Toggle", "lua>tab b")
aa.ap_spinr = gui.add_slider("[Auto Peeking] Spin Range", "lua>tab b", -360, 360, 0)
aa.ap_spins = gui.add_slider("[Auto Peeking] Spin Speed", "lua>tab b", -600, 600, 0)
aa.ap_rollonoff = gui.add_combo("[Auto Peeking] Roll", "lua>tab b", {"None", "Static", "Extend Fake", "Invert Fake", "Freestand", "Freestand Opposite", "Jitter"})
aa.ap_roll = gui.add_slider("[Auto Peeking] Roll AA", "lua>tab b>",  -127000, 127000, 0)
aa.ap_ensure = gui.add_checkbox("[Auto Peeking] Ensure Roll AA", "lua>tab b")

-- data
local calibri = render.create_font("calibrib.ttf", 23, render.font_flag_shadow)
local nextfont2 = render.create_font("calibri.ttf", 13, render.font_flag_shadow)
local fontdmg = render.create_font("verdana.ttf", 13, render.font_flag_shadow)
local pixel = render.create_font("smallest_pixel-7.ttf", 11, render.font_flag_outline)
local calibri11 = render.create_font("calibri.ttf", 11, render.font_flag_outline)
local calibri13 = render.create_font("calibri.ttf", 13, render.font_flag_shadow)
local verdana = render.create_font("verdana.ttf", 13, render.font_flag_outline) 
local font69 = render.create_font("c:/windows/fonts/Calibrib.ttf", 23, render.font_flag_outline, 20, 255)
local verdana2 = render.create_font("verdana.ttf", 10, render.font_flag_outline)
local verdanab = render.create_font("verdanab.ttf", 13, render.font_flag_outline)
local verdanakb = render.create_font("verdana.ttf", 13, render.font_flag_outline)
local verdanakbb = render.create_font("verdana.ttf", 10, render.font_flag_outline)




-- vars

local x, y = render.get_screen_size()
local hs = gui.get_config_item("Rage>Aimbot>Aimbot>Hide shot")
local limit = gui.get_config_item("Rage>Anti-Aim>Fakelag>Limit")
local cache = {
    backup = limit:get_int(),
    override = false,
}

local sp = {
    "Maniak.lua --- Only the best at the lowest prices |discord.gg/yNr6BsyWuN| ",
    "Maniak.lua --- 1 by Maniak.lua |discord.gg/yNr6BsyWuN|",
    "Maniak.lua --- Now on Fatality too! |discord.gg/yNr6BsyWuN|",
    "Maniak.lua --- Just The Best! |discord.gg/yNr6BsyWuN|",
                "Maniak.lua --- Now on youtube! |discord.gg/yNr6BsyWuN|",
                "Maniak.lua --- Don't be bad anymore |discord.gg/yNr6BsyWuN|",
                "Maniak.lua --- Discord server: |discord.gg/yNr6BsyWuN| ",
                "Maniak.lua --- #BestLua |discord.gg/yNr6BsyWuN|",
                "Maniak.lua --- buy or die |discord.gg/yNr6BsyWuN|",
}

local tt = {"Why you so bad?", "For HVH lessonns contact JustManiak#8531 on discord", "You had you're time to kill me, now you are *DEAD*", "Jokes on you, I didn't even try killing you, that is how bad you are", "Little doggy is mad?", "1 tap", "sorry! couldn't hear you over the sound of that 1", "You are not someone if you have skeet and don't know how to play xD"}                                                                                                                                                                                                                                                                                                                                                                                                                            --0

local maniakcl = {
    " ☠ ",
   " ☠M ",
        " ☠M ",
        " ☠Ma ",
        " ☠Man ",
        " ☠Mani ",
        " ☠Mania ",
        " ☠Maniak. ",
        " ☠Maniak.l ",
        " ☠Maniak.lu ",
        " ☠Maniak.lua ",
        " ☠Maniak.lua ",
        " ☠Maniak.lua ",
        " ☠Maniak.lu ",
        " ☠Maniak.l ",
        " ☠Maniak. ",
        " ☠Mania ",
        " ☠Mani ",
        " ☠Man ",
        " ☠Ma ",
        " ☠M ",
        " ☠ "
}



local maniakp = {
        " maNIIIIaK ",
        " MaNNIAk ",
        " mannnnIaK ",
        " mAnIKak ",
        " MaNNiIaK ",
        " mANNiIIaK ",
        " maNNNiIaK ",
        " MaNnNiIaK",
        " maNNiIaK ",
        " mAnIKak ",
        " mannnnIaK ",
        " maNNIAk "
}

local tags = {maniakcl, maniakp }


local old_tag_string   = nil
local old_tag_string1 = nil
local can_reset = false

 
function math_clamp(value, min, max) return math.min(max, math.max(min, value)) end
function math_lerp(a, b_, t) local t = animations.math_clamp(globals.frametime * (0.045 * 175), 0, 1) if type(a) == 'userdata' then r, g, b, a = a.r, a.g, a.b, a.a e_r, e_g, e_b, e_a = b_.r, b_.g, b_.b, b_.a r = animations.math_lerp(r, e_r, t) g = animations.math_lerp(g, e_g, t) b = animations.math_lerp(b, e_b, t) a = animations.math_lerp(a, e_a, t) return color(r, g, b, a) end local d = b_ - a d = d * t d = d + a if b_ == 0 and d < 0.01 and d > -0.01 then d = 0 elseif b_ == 1 and d < 1.01 and d > 0.99 then d = 1 end return d end










local dt = gui.get_config_item("Rage>Aimbot>Aimbot>Double tap")
function guiscc()
    local tab = MenuSelection:get_int()
    local ragetab = ragemenu:get_int()
    local aaaaad = aaad:get_int()
    local visual = vis:get_int()
    local indicatorsenb = indicatorsmain:get_bool()
    local infobar = infobar:get_bool()
    local aspectratiobuttonx = aspectratiobutton:get_bool()
    local clantagx = clantag:get_bool()
    local ksx = killsay:get_bool()
    local osc = rage.osf:get_bool()
    local over11 = override.over:get_bool()
    local way5 = aa.aaim2:get_bool()
    local way3 = aa.aaim33:get_bool()
    local wayx = aa.aaimxx:get_bool()
    local sw1 = slowwalk_box:get_bool()
    local ab = WorkAA:get_bool()
    local rb = rage.rbi:get_bool()
    local ap = aa.preset:get_bool()
    local wm = watermark2:get_bool()
    local kb = keybinds2:get_bool()
    local pss = rage.dttick:get_bool()
    local dta = rage.dttickb:get_bool()
    local sjjjjs = sjj:get_bool()
    local djc = djjc:get_bool()

    -- ragebot
    gui.set_visible("lua>tab a>RageBot", tab == 1 and rb)
    gui.set_visible("lua>tab b>Ragebot Improvements", tab == 1 and ragetab == 0 )
    gui.set_visible("lua>tab b>DT Spammer", tab == 1 and ragetab == 1 )
    gui.set_visible("lua>tab b>Prediction system", ragetab == 1  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Prediction System Settings:", ragetab == 1  and tab == 1 and rb and pss)
    gui.set_visible("lua>tab b>OS-AA fix", ragetab == 1  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Better Scout", ragetab == 1  and tab == 1 and rb)
    gui.set_visible("lua>tab b>OS-AA",  ragetab == 1 and osc  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Ideal Tick", ragetab == 1   and tab == 1 and rb)
    gui.set_visible("lua>tab b>TripleTap",  ragetab == 2  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Dormant Aimbot",  ragetab == 1  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Roll Resolver", ragetab == 1  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Doubletap Improver", ragetab == 1  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Scout Hitchance Override", ragetab == 4  and tab == 1 and rb)
    gui.set_visible("lua>tab b>No Recoil", ragetab == 2  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Override [In Air]:", ragetab == 4 and over11  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Override [Standing]:", ragetab == 4 and over11  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Override [Slowwalk]:", ragetab == 4 and over11  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Override [Crouch]:", ragetab == 4 and over11   and tab == 1 and rb)
    gui.set_visible("lua>tab b>Override [Crouch + Air]:", ragetab == 4 and over11   and tab == 1 and rb)
    gui.set_visible("lua>tab b>Override [Moving]:", ragetab == 4 and over11   and tab == 1 and rb)
    gui.set_visible("lua>tab b>Override [Auto Peek]:", ragetab == 4 and over11   and tab == 1 and rb)
    gui.set_visible("lua>tab b>Override [Fake Duck]:", ragetab == 4 and over11   and tab == 1 and rb)
    gui.set_visible("lua>tab b>Override [No Scope]:", ragetab == 4 and over11  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Wait For DT to recharge", ragetab == 1   and tab == 1 and rb)
    gui.set_visible("lua>tab b>DoubleTap type:", ragetab == 1   and tab == 1 and rb and dta)
    gui.set_visible("lua>tab b>Defensive DT Teleport", ragetab == 2   and tab == 1 and rb and dta)
    gui.set_visible("lua>tab b>No Spread", ragetab == 2   and tab == 1 and rb)
    gui.set_visible("lua>tab b>Force Accuracy", ragetab == 2   and tab == 1 and rb)
    gui.set_visible("lua>tab b>Disable OS-AA on DT", ragetab == 1  and tab == 1 and rb)

    function resolvermode()
        local resolver1 = gui.get_config_item("rage>aimbot>aimbot>resolver mode")
        if rage.resolver:get_bool() then 
            resolver1:set_int(0) 
    else 
        if not rage.resolver:get_bool() then 
        resolver1:set_int(1) 
        end
    end
end



    function OSFF()

        if rage.osf:get_bool() then
            if rage.os:get_int() == 0 and not dt:get_bool() then
              if hs:get_bool() then
                  limit:set_int(1)
                  cache.override = true
              else
                  if cache.override then
                  limit:set_int(cache.backup)
                  cache.override = false
                  else
                  cache.backup = limit:get_int()
                  end
                end
              end
            end
        
          if rage.osf:get_bool() then
            if rage.os:get_int() == 1 and not dt:get_bool() then
              if hs:get_bool() then
                  limit:set_int(global_vars.tickcount % 32 >= 1 and 100000 or 1)
                  cache.override = true
              else
                  if cache.override then
                  limit:set_int(cache.backup)
                  cache.override = false
                  else
                  cache.backup = limit:get_int()
                  end
                end
              end
            end
        
        if rage.osf:get_bool() then
            if rage.os:get_int() == 2 and not dt:get_bool() then
                if hs:get_bool() then
                    limit:set_int(100000)
                    cache.override = true
                else
                    if cache.override then
                    limit:set_int(cache.backup)
                    cache.override = false
                    else
                    cache.backup = limit:get_int()
                    end
                end
            end
        end
        end
        local switcher = false
    function on_create_move(cmd)
        OSFF()
        if not active_buretforce then
            if switcher then
                jitteractive:set_bool(lastjitter)
                fsfake:set_int(lastfs)
                switcher = false
            end
        else
            if not switcher then
                lastjitter = jitteractive:get_bool()
                lastfs = fsfake:get_int()
                switcher = true
            end
     
            jitteractive:set_bool(false)
            fsfake:set_int(0)
        end
    end

    
    


    function DA()
        local TargetDormant = gui.get_config_item("rage>aimbot>aimbot>target dormant");
        local ap = gui.get_config_item("misc>movement>peek assist");
        if rage.DormantA:get_bool()
        then
            TargetDormant:set_int(1)
    
            elseif rage.DormantA:get_bool() == true and  rage.da0:get_bool() == false and ap:get_bool() == false then
                TargetDormant:set_int(1)
            elseif rage.DormantA:get_bool() == false and rage.da0:get_bool() == true and ap:get_bool() == true then
                TargetDormant:set_int(1)
            elseif rage.DormantA:get_bool() == false and rage.da0:get_bool() == false and ap:get_bool() == true then
                TargetDormant:set_int(0)
            elseif rage.DormantA:get_bool() == false and rage.da0:get_bool() == true and ap:get_bool() == false then
                TargetDormant:set_int(0)
            elseif rage.DormantA:get_bool() == true and rage.da0:get_bool() == false and ap:get_bool() == true then
                TargetDormant:set_int(1)
            elseif rage.DormantA:get_bool() == false and rage.da0:get_bool() == false and ap:get_bool() == false then
                TargetDormant:set_int(0) 
            end
        end



    --end

    --Ideal tick

    gui.set_visible("lua>tab b>0 Pitch on Ideal Tick", ragetab == 3  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Freestand on Ideal Tick", ragetab == 3  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Dormant Aimbot on Ideal Tick", ragetab == 3 and tab == 1 and rb)
    gui.set_visible("lua>tab b>Headshot on Ideal Tick", ragetab == 3  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Pitch Up on Ideal Tick", ragetab == 3  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Static Freestand on Ideal Tick", ragetab == 3  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Legit AA on Ideal Tick", ragetab == 3  and tab == 1 and rb)
    gui.set_visible("lua>tab b>Faster DT on Ideal Tick", ragetab == 3  and tab == 1 and rb)

    -- aa addons
    gui.set_visible("lua>Tab a>Anti-Aim", tab == 2)
    gui.set_visible("lua>tab b>Invert Anti-Aim", aaaaad == 5 and tab == 2)
    gui.set_visible("lua>tab b>Fix Freestand Flicking", aaaaad == 5 and tab == 2)
    gui.set_visible("lua>tab b>Fake Flick", aaaaad == 5  and tab == 2)
    gui.set_visible("lua>tab b>Legit AA", aaaaad == 5  and tab == 2)
    gui.set_visible("lua>Tab b>5-Way:", aaaaad == 4  and tab == 2 and way5)
    gui.set_visible("lua>Tab b>5-Way", aaaaad == 4 and tab == 2)
    gui.set_visible("lua>Tab b>3-Way:", aaaaad == 4  and tab == 2 and way3)
    gui.set_visible("lua>Tab b>3-Way", aaaaad == 4  and tab == 2)
    gui.set_visible("lua>Tab b>X-Way:", aaaaad == 4  and tab == 2 and wayx)
    gui.set_visible("lua>Tab b>X-Way", aaaaad == 4  and tab == 2)
    gui.set_visible("lua>tab b>Manual Back", aaaaad == 3  and tab == 2)
    gui.set_visible("lua>tab b>Manual Right", aaaaad == 3  and tab == 2)
    gui.set_visible("lua>tab b>Manual Up", aaaaad == 3  and tab == 2)
    gui.set_visible("lua>tab b>Manual Left", aaaaad == 3  and tab == 2)
    gui.set_visible("lua>tab b>Pitch Up Exploit", aaaaad == 2  and tab == 2)
    gui.set_visible("lua>tab b>Anti Brute Force", aaaaad == 5  and tab == 2)
    gui.set_visible("lua>tab b>Fake Head", aaaaad == 2  and tab == 2)
    gui.set_visible("lua>tab b>Defensive Anti-Aim", aaaaad == 2  and tab == 2)
    gui.set_visible("lua>tab b>Sway Jitter", aaaaad == 5  and tab == 2)
    gui.set_visible("lua>tab b>Sway Range", aaaaad == 5  and tab == 2 and sjjjjs)
    gui.set_visible("lua>tab b>Sway Speed", aaaaad == 5  and tab == 2 and sjjjjs)
    gui.set_visible("lua>tab b>Jitter", aaaaad == 5  and tab == 2)
    gui.set_visible("lua>tab b>Jitter Ticks", aaaaad == 5  and tab == 2 and djc)
    gui.set_visible("lua>tab b>Jitter Range", aaaaad == 5  and tab == 2 and djc)
    gui.set_visible("lua>tab b>Fakelag", aaaaad == 5  and tab == 2)
    gui.set_visible("lua>tab b>Fakelag Amount:", aaaaad == 5  and tab == 2 and fll:get_bool())

    --AA presets
    gui.set_visible("lua>Tab b>Anti-Aim Presets", aaaaad == 1 and tab == 2)
    gui.set_visible("lua>Tab b>Anti-Aim Presets:", aaaaad == 1 and tab == 2 and ap)

    -- visuals
    gui.set_visible("lua>tab a>Visuals", tab == 3)
    gui.set_visible("lua>tab b>Watermark", tab == 3 and visual == 0)
    gui.set_visible("lua>tab b>Watermark Styles", tab == 3 and visual == 0 and wm)
    gui.set_visible("lua>tab b>Keybinds Styles", tab == 3 and visual == 0 and kb)
    gui.set_visible("lua>tab b>info tab", tab == 3 and visual == 0)
    gui.set_visible("lua>tab b>keybinds", tab == 3 and visual == 0)
    gui.set_visible("lua>tab b>indicators", tab == 3 and visual == 0)
    gui.set_visible("lua>tab b>Menu Watermark", tab == 3 and visual == 0)
    gui.set_visible("lua>tab b>indicators | type", tab == 3 and indicatorsenb and visual == 0)
    gui.set_visible("lua>tab b>Info Tab | Flag", tab == 3 and infobar and visual == 0)
    gui.set_visible("lua>Tab b>Lethal Flag", tab == 3 and visual == 0)
    gui.set_visible("lua>tab b>Skeet Indicators", tab == 3 and visual == 0)
    gui.set_visible("lua>tab b>Grenades ESP", tab == 3 and visual == 0)
    gui.set_visible("lua>tab b>Damage Indicator", tab == 3 and visual == 0)


    


    -- home
    gui.set_visible("lua>Tab b>safepoint", tab == 30)
    gui.set_visible("lua>Tab b>roll safepoint", tab == 30)
    -- others
    gui.set_visible("lua>Tab b>Killsay",tab == 4)
    gui.set_visible("lua>tab b>Killsay Type:", tab == 4 and ksx)
    gui.set_visible("lua>tab b>Clantag", tab == 4)
    gui.set_visible("lua>tab b>Aspect ratio", tab == 4)
    gui.set_visible("lua>tab b>[Aspect Ratio Value]", tab == 4 and aspectratiobuttonx)
    gui.set_visible("lua>tab b>Reset Score When You die", tab == 4)
    gui.set_visible("lua>tab b>Hitlogs", tab == 4)
    gui.set_visible("lua>tab b>Clantags:", tab == 4 and clantagx)
    gui.set_visible("lua>tab b>sv_cheats", tab == 4)
    gui.set_visible("lua>tab b>Slow Walk", tab == 4)
    gui.set_visible("lua>tab b>Speed", tab == 4 and sw1)
    -- colours
    gui.set_visible("lua>tab b>Keybinds Color", tab == 3 and visual == 1)
    gui.set_visible("lua>tab b>Infobar Color", tab == 3 and visual == 1)
    gui.set_visible("lua>tab b>Watermark Color", tab == 3 and visual == 1)
    gui.set_visible("lua>tab b>Menu Watermark Color", tab == 3 and visual == 1)
    gui.set_visible("lua>tab b>Indicator Color", tab == 3 and visual == 1)
    gui.set_visible("lua>tab b>Glow", tab == 3 and visual == 1)
    gui.set_visible("lua>tab b>Grenade ESP Color", tab == 3 and visual == 1)
    gui.set_visible("lua>tab b>Hitlogs Color", tab == 3 and visual == 1)


    -- AA
    gui.set_visible("lua>tab b>AntiAim Builder", tab == 2 and aaaaad == 0)
    gui.set_visible("lua>tab b>Choose AntiAim Condition:", tab == 2  and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Standing] Pitch", tab == 2 and States:get_int() == 1 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Standing] Jitter", tab == 2 and  States:get_int() == 1 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Standing] Jitter range", tab == 2 and States:get_int() == 1 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Standing] Fake", tab == 2 and States:get_int() == 1 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Standing] Fake %", tab == 2 and States:get_int() == 1 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Standing] Compensate Angle", tab == 2 and States:get_int() == 1 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Standing] At Fov Target", tab == 2 and States:get_int() == 1 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Standing] Spin Toggle", tab == 2 and States:get_int() == 1 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Standing] Spin Range", tab == 2 and States:get_int() == 1 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Standing] Spin Speed", tab == 2 and States:get_int() == 1 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Standing] Roll", tab == 2 and States:get_int() == 1 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Standing] Roll AA", tab == 2 and States:get_int() == 1 and ab and aaaaad == 0)
    gui.set_visible("lua>Tab b>[Standing] Ensure Roll AA", tab == 2 and States:get_int() == 1 and ab and aaaaad == 0)

    gui.set_visible("lua>tab b>[Moving] Pitch", tab == 2 and States:get_int() == 2 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Moving] Jitter" , tab == 2 and States:get_int() == 2 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Moving] Jitter range", tab == 2 and States:get_int() == 2 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Moving] Fake", tab == 2 and States:get_int() == 2 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Moving] Fake %", tab == 2 and States:get_int() == 2 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Moving] Compensate Angle", tab == 2 and States:get_int() == 2 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Moving] At Fov Target", tab == 2 and States:get_int() == 2 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Moving] Spin Toggle", tab == 2 and States:get_int() == 2 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Moving] Spin Range", tab == 2 and States:get_int() == 2 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Moving] Spin Speed", tab == 2 and States:get_int() == 2 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Moving] Roll", tab == 2 and States:get_int() == 2 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Moving] Roll AA", tab == 2 and States:get_int() == 2 and ab and aaaaad == 0)
    gui.set_visible("lua>Tab b>[Moving] Ensure Roll AA", tab == 2 and States:get_int() == 2 and ab and aaaaad == 0)

    gui.set_visible("lua>tab b>[Slow Walking] Pitch", tab == 2 and States:get_int() == 3 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Slow Walking] Jitter", tab == 2 and States:get_int() == 3 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Slow Walking] Jitter range", tab == 2 and States:get_int() == 3 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Slow Walking] Fake", tab == 2 and States:get_int() == 3 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Slow Walking] Fake %", tab == 2 and States:get_int() == 3 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Slow Walking] Compensate Angle", tab == 2 and States:get_int() == 3 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Slow Walking] At Fov Target", tab == 2 and States:get_int() == 3 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Slow Walking] Spin Toggle", tab == 2 and States:get_int() == 3 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Slow Walking] Spin Range", tab == 2 and States:get_int() == 3 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Slow Walking] Spin Speed", tab == 2 and States:get_int() == 3 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Slow Walking] Roll", tab == 2 and States:get_int() == 3 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Slow Walking] Roll AA", tab == 2 and States:get_int() == 3 and ab and aaaaad == 0)
    gui.set_visible("lua>Tab b>[Slow Walking] Ensure Roll AA", tab == 2 and States:get_int() == 3 and ab and aaaaad == 0)

    gui.set_visible("lua>tab b>[Crouching] Pitch", tab == 2 and States:get_int() == 4 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouching] Jitter", tab == 2 and States:get_int() == 4 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouching] Jitter range", tab == 2 and States:get_int() == 4 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouching] Fake", tab == 2 and States:get_int() == 4 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouching] Fake %", tab == 2 and States:get_int() == 4 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouching] Compensate Angle", tab == 2 and States:get_int() == 4 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouching] At Fov Target", tab == 2 and States:get_int() == 4 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouching] Spin Toggle", tab == 2 and States:get_int() == 4 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouching] Spin Range", tab == 2 and States:get_int() == 4 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouching] Spin Speed", tab == 2 and States:get_int() == 4 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouching] Roll", tab == 2 and States:get_int() == 4 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouching] Roll AA", tab == 2 and States:get_int() == 4 and ab and aaaaad == 0)
    gui.set_visible("lua>Tab b>[Crouching] Ensure Roll AA", tab == 2 and States:get_int() == 4 and ab and aaaaad == 0)

    gui.set_visible("lua>tab b>[Crouch + Air] Pitch", tab == 2 and States:get_int() == 5 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouch + Air] Jitter", tab == 2 and States:get_int() == 5 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouch + Air] Jitter range", tab == 2 and States:get_int() == 5 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouch + Air] Fake", tab == 2 and States:get_int() == 5 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouch + Air] Fake %", tab == 2 and States:get_int() == 5 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouch + Air] Compensate Angle", tab == 2 and States:get_int() == 5 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouch + Air] At Fov Target", tab == 2 and States:get_int() == 5 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouch + Air] Spin Toggle", tab == 2 and States:get_int() == 5 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouch + Air] Spin Range", tab == 2 and States:get_int() == 5 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouch + Air] Spin Speed", tab == 2 and States:get_int() == 5 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouch + Air] Roll", tab == 2 and States:get_int() == 5 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Crouch + Air] Roll AA", tab == 2 and States:get_int() == 5 and ab and aaaaad == 0)
    gui.set_visible("lua>Tab b>[Crouch + Air] Ensure Roll AA", tab == 2 and States:get_int() == 5 and ab and aaaaad == 0)

    gui.set_visible("lua>tab b>[In Air] Pitch", tab == 2 and States:get_int() ==6 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[In Air] Jitter", tab == 2 and States:get_int() ==6 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[In Air] Jitter range", tab == 2 and States:get_int() ==6 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[In Air] Fake", tab == 2 and States:get_int() ==6 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[In Air] Fake %", tab == 2 and States:get_int() ==6 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[In Air] Compensate Angle", tab == 2 and States:get_int() ==6 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[In Air] At Fov Target", tab == 2 and States:get_int() ==6 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[In Air] Spin Toggle", tab == 2 and States:get_int() ==6 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[In Air] Spin Range", tab == 2 and States:get_int() ==6 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[In Air] Spin Speed", tab == 2 and States:get_int() ==6 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[In Air] Roll", tab == 2 and States:get_int() ==6 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[In Air] Roll AA", tab == 2 and States:get_int() ==6 and ab and aaaaad == 0)
    gui.set_visible("lua>Tab b>[In Air] Ensure Roll AA", tab == 2 and States:get_int() ==6 and ab and aaaaad == 0)

    gui.set_visible("lua>tab b>[Fake Ducking] Pitch", tab == 2 and States:get_int() ==7 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Fake Ducking] Jitter", tab == 2 and States:get_int() ==7 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Fake Ducking] Jitter range", tab == 2 and States:get_int() ==7 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Fake Ducking] Fake", tab == 2 and States:get_int() ==7 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Fake Ducking] Fake %", tab == 2 and States:get_int() ==7 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Fake Ducking] Compensate Angle", tab == 2 and States:get_int() ==7 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Fake Ducking] At Fov Target", tab == 2 and States:get_int() ==7 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Fake Ducking] Spin Toggle", tab == 2 and States:get_int() ==7 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Fake Ducking] Spin Range", tab == 2 and States:get_int() ==7 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Fake Ducking] Spin Speed", tab == 2 and States:get_int() ==7 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Fake Ducking] Roll", tab == 2 and States:get_int() ==7 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Fake Ducking] Roll AA", tab == 2 and States:get_int() ==7 and ab and aaaaad == 0)
    gui.set_visible("lua>Tab b>[Fake Ducking] Ensure Roll AA", tab == 2 and States:get_int() ==7 and ab and aaaaad == 0)

    gui.set_visible("lua>tab b>[Auto Peeking] Pitch", tab == 2 and States:get_int() ==8 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Auto Peeking] Jitter", tab == 2 and States:get_int() ==8 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Auto Peeking] Jitter range", tab == 2 and States:get_int() ==8 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Auto Peeking] Fake", tab == 2 and States:get_int() ==8 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Auto Peeking] Fake %", tab == 2 and States:get_int() ==8 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Auto Peeking] Compensate Angle", tab == 2 and States:get_int() ==8 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Auto Peeking] At Fov Target", tab == 2 and States:get_int() ==8 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Auto Peeking] Spin Toggle", tab == 2 and States:get_int() ==8 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Auto Peeking] Spin Range", tab == 2 and States:get_int() ==8 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Auto Peeking] Spin Speed", tab == 2 and States:get_int() ==8 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Auto Peeking] Roll", tab == 2 and States:get_int() ==8 and ab and aaaaad == 0)
    gui.set_visible("lua>tab b>[Auto Peeking] Roll AA", tab == 2 and States:get_int() ==8 and ab and aaaaad == 0)
    gui.set_visible("lua>Tab b>[Auto Peeking] Ensure Roll AA", tab == 2 and States:get_int() ==8 and ab and aaaaad == 0)
    end


function clantagfc()
    local defaultct = gui.get_config_item("misc>various>clan tag") 
    local tag_idx = clan:get_int()
    local tag = tags[tag_idx]
    if clantag:get_bool() and tag then
        local curtime = math.floor((global_vars.curtime) * 3.5)
        local tag_string = tag[curtime % #tag + 1]
        if tag_string ~= old_tag_string then
            utils.set_clan_tag(tag_string)
            defaultct:set_bool(false)
            old_tag_string = tag_string
            can_reset = true
        end
    else
        if can_reset then
            utils.set_clan_tag(" ") 
            can_reset = false
        end
    end
end





local kd = {"You had luck", "You are luck based", "Maniak.lua is still on top but you had luck", "Slave", "I had my AA turned off", "My Resolver was off"}

local rs = gui.add_checkbox("Reset Score When You die", "lua>tab b")
local exit = {""}
local reset = {" /rs", " /rs", "/rs"}
function on_player_death(event)
    if rs:get_bool() then
    local lp = engine.get_local_player();
    local attacker = engine.get_player_for_user_id(event:get_int('attacker'));
    local userid = engine.get_player_for_user_id(event:get_int('userid'));
    local userInfo = engine.get_player_info(userid);
        if attacker ~= lp and userid == lp then
            engine.exec("say " .. reset[utils.random_int(1, #reset)] .. "")
        end
    else
    end
    if killsays:get_int() == 1 then
        local lp = engine.get_local_player();
        local attacker = engine.get_player_for_user_id(event:get_int('attacker'));
        local userid = engine.get_player_for_user_id(event:get_int('userid'));
        local userInfo = engine.get_player_info(userid);
            if attacker == lp and userid ~= lp then
                engine.exec("say " .. sp[utils.random_int(1, #sp)] .. "")
            end
        else
        end
    if killsays:get_int() == 2 then
        local lp = engine.get_local_player();
        local attacker = engine.get_player_for_user_id(event:get_int('attacker'));
        local userid = engine.get_player_for_user_id(event:get_int('userid'));
        local userInfo = engine.get_player_info(userid);
            if attacker == lp and userid ~= lp then
                engine.exec("say " .. tt[utils.random_int(1, #tt)] .. "")
            end
        else
end
end



function set_speed( new_speed )
    local cl_sidespeed = cvar.cl_sidespeed
local cl_forwardspeed = cvar.cl_forwardspeed
local cl_backspeed = cvar.cl_backspeed
    if ( cl_sidespeed:get_int() == 450 and new_speed == 450 ) then
        return;
    end
     cl_sidespeed:set_float( new_speed );
     cl_forwardspeed:set_float( new_speed );
     cl_backspeed:set_float( new_speed );
end






function gui_controller()
    if engine.is_in_game() == false then return end
    local text =  "Maniak.lua"
    local username = engine.get_player_info(engine.get_local_player()).name
    local textx, texty = render.get_text_size(verdana, text)
    local text2 = "user: " ..engine.get_player_info(engine.get_local_player()).name.. ""
    local text2x, text2y = render.get_text_size(verdana, text2)
    local infotabflag = infotabflag:get_int()
    local alpha2 = math.floor(math.abs(math.sin(global_vars.realtime) * 2) * 255)
    if infobar:get_bool() then
        render.rect_filled_multicolor(5, y / 2, 150, (y / 2) + 26,infobar_color:get_color(), render.color(0,0,0,0),render.color(0,0,0,0), infobar_color:get_color())
        render.text(verdana, 35,(y / 2) - 1, "Lua Name:", render.color(255,255,255,255))
        render.text(verdana, 90,(y / 2) - 1, "Maniak.lua ", infobar_color:get_color())
        render.text(verdana, 37 + textx,(y / 2) + 1, " ", infobar_color:get_color())
        render.text(verdana, 34.5,(y / 2) + 10, "Version: ", render.color(255,255,255,255))
        render.text(verdana, 75,(y / 2) + 10, " [1.4 "..version.."]", infobar_color:get_color())
        if infotabflag == 0 then
            render.rect_filled(7, (y / 2) + 24, 24, (y / 2) + 2,render.color(0, 43, 127, 255))
            render.rect_filled(16, (y / 2) + 24, 24, (y / 2) + 2,render.color(252, 209, 22, 255))
            render.rect_filled(24, (y / 2) + 24, 32, (y / 2) + 2,render.color(206, 17, 38, 255))
        end
        if infotabflag == 1 then
            render.rect_filled(7, (y / 2) + 24, 24, (y / 2) + 1.5,render.color(206, 17, 38, 255))
            render.rect_filled(16, (y / 2) + 24, 24, (y / 2) + 1.5,render.color(252, 255, 255, 255))
            render.rect_filled(24, (y / 2) + 24, 32, (y / 2) + 1.5,render.color(0, 160, 10, 255))
        end
        if infotabflag == 2 then
            render.rect_filled(7, (y / 2) + 24, 24, (y / 2) + 1.5,render.color(0, 43, 127, 255))
            render.rect_filled(16, (y / 2) + 24, 24, (y / 2) + 1.5,render.color(255, 255, 255, 255))
            render.rect_filled(24, (y / 2) + 24, 32, (y / 2) + 1.5,render.color(206, 17, 38, 255))
        end
        if infotabflag == 3 then
            render.rect_filled(5.6, (y / 2) + 13, 33, (y / 2) + 1,render.color(255, 255, 255, 255))
            render.rect_filled(5.6, (y / 2) + 25, 33, (y / 2) + 13,render.color(255, 0, 0, 255))
        end
    end
end

local r_aspectratio = cvar.r_aspectratio

local default_value = r_aspectratio:get_float()

local function set_aspect_ratio(multiplier)
    local screen_width,screen_height = render.get_screen_size()

    local value = (screen_width * multiplier) / screen_height
if aspectratiobutton:get_bool() then

    if multiplier == 1 then
        value = 0
    end
    r_aspectratio:set_float(value)
end
end
function aspect_ratio2()
    if aspectratiobutton:get_bool() then
    local aspect_ratio = aspect_ratio_slider:get_int() * 0.01
    aspect_ratio = 2 - aspect_ratio
    set_aspect_ratio(aspect_ratio)
end
end

function watermark()
    if watermark2:get_bool() then 
        if watermarks:get_int() == 0 then
    local latency  = math.floor((utils.get_rtt() or 0)*1000)
    local Time = utils.get_time()
    local realtime = string.format("%02d:%02d", Time.hour, Time.min)
    local textone = "Maniak.lua"
    if watermark2:get_bool() or player == nil then
        local x, y=render.get_screen_size()
        local player=entities.get_entity(engine.get_local_player())
        local text= 'Maniak.lua | ' ..engine.get_player_info(engine.get_local_player()).name.. ' | delay: '..latency..'ms | Time:  '.. realtime ..''
        local textx, texty = render.get_text_size(pixel, text)
        render.rect_filled_rounded(x-12,8, x-textx-25, 25, render.color(0, 0, 0, 40), 2, render.all)
        render.rect_filled_rounded(x-12,8, x-textx-25, 10, render.color(watermark_color:get_color().r, watermark_color:get_color().g, watermark_color:get_color().b, 255), 1.5, render.all)
        render.text(pixel, x-textx-20,12, text, render.color(255,255, 255, 255))
    end
end
end
end



local function animation(check, name, value, speed) 
    if check then 
        return name + (value - name) * global_vars.frametime * speed / 1.5
    else 
        return name - (value + name) * global_vars.frametime * speed / 1.5
        
    end
end

local offset_scope = 0
local dton = 0
local alpha = 0
function dmg()
    local function Clamp(Value, Min, Max)
        return Value < Min and Min or (Value > Max and Max or Value)
    end
        
        local alpha2 = math.floor(math.abs(math.sin(global_vars.realtime) * 2) * 255)
        local lp = entities.get_entity(engine.get_local_player())
        if not lp then return end
        if not lp:is_alive() then return end
        local screen_width, screen_height = render.get_screen_size( )
        local x = screen_width / 2
        local y = screen_height / 2
        local ay = 0
    local player = entities.get_entity(engine.get_local_player())
    local weapon = player:get_prop("m_hActiveWeapon")
    if not weapon then return end
    
    local weapon = entities.get_entity_from_handle(weapon)
    if not weapon then return end
    
    local things = {}
    
    things.weapon = utils.get_weapon_info(weapon:get_prop("m_iItemDefinitionIndex")).console_name
        --Weapon id for min-damage
        if things.weapon == "weapon_g3sg1" or things.weapon == "weapon_scar20" then things.id = "autosniper>auto" 
        elseif things.weapon == "weapon_ssg08" then things.id = "ssg08>scout"
        elseif things.weapon == "weapon_awp" then things.id = "awp>awp"
        elseif things.weapon == "weapon_revolver" or things.weapon == "weapon_deagle" then things.id = "heavy_pistol>heavy pistols" 
        elseif things.weapon == "weapon_glock" or things.weapon == "weapon_hkp2000" or things.weapon == "weapon_elite" or things.weapon == "weapon_p250" or things.weapon == "weapon_fiveseven" or things.weapon == "weapon_tec9" or things.weapon == "weapon_cz75a" then things.id = "pistol>pistols"
        else things.id = "other>other" end
        
        local damagevalue = gui.get_config_item("rage>aimbot>".. things.id ..">override"):get_bool() and gui.get_config_item("rage>aimbot>".. things.id ..">minimum damage override"):get_int() or gui.get_config_item("rage>aimbot>".. things.id ..">>minimum damage"):get_int()
        if dmgm:get_bool() then
        render.text(fontdmg, x+offset_scope + 40 , y + -15, ("%s"):format(damagevalue), render.color(255, 255, 255), render.align_center, render.align_center)
    end
end
local slide = gui.get_config_item("misc>movement>slide")

function get_local_speed()
    local local_player = entities.get_entity(engine.get_local_player())
    if local_player == nil then
      return
    end
  
    local velocity_x = local_player:get_prop("m_vecVelocity[0]")
    local velocity_y = local_player:get_prop("m_vecVelocity[1]")
    local velocity_z = local_player:get_prop("m_vecVelocity[2]")
  
    local velocity = math.vec3(velocity_x, velocity_y, velocity_z)
    local speed = math.ceil(velocity:length2d())
    if speed < 10 then
        return 0
    else 
        return speed 
    end
end
function indicators()
    local is_dt = gui.get_config_item("Rage>Aimbot>Aimbot>Double Tap")
local is_fs = gui.get_config_item("Rage>Anti-Aim>Angles>Freestand")
local is_onshot = gui.get_config_item("Rage>Aimbot>Aimbot>Hide shot")
    local lp = entities.get_entity(engine.get_local_player())
    if not lp then return end
    if not lp:is_alive() then return end
    local scoped = lp:get_prop("m_bIsScoped")
    offset_scope = animation(scoped, offset_scope, 25, 10)
    
    local function Clamp(Value, Min, Max)
        return Value < Min and Min or (Value > Max and Max or Value)
    end
        
        local alpha2 = math.floor(math.abs(math.sin(global_vars.realtime) * 2) * 255)
        if not lp then return end
        if not lp:is_alive() then return end
        local screen_width, screen_height = render.get_screen_size( )
        local x = screen_width / 2
        local y = screen_height / 2
        local ay = 0
    
        local slowwalk = slide:get_bool()
        local lplr = entities.get_entity(engine.get_local_player())
        local flag = lplr:get_prop("m_fFlags")
        local air = lplr:get_prop("m_hGroundEntity") == -1
        local air2 = input.is_key_down(0x20)
        local velocity_x = math.floor(lplr:get_prop("m_vecVelocity[0]"))
        local velocity_y = math.floor(lplr:get_prop("m_vecVelocity[1]"))
        local speed = math.sqrt(velocity_x ^ 2 + velocity_y ^ 2)
        local crouch = input.is_key_down(0x11)
      local is_da =  gui.get_config_item("Rage>Aimbot>aimbot>Target Dormant"):get_bool()
        if indicatorsmain:get_bool() and indicatorstype:get_int() == 0 then
            if engine.is_in_game() == false then return end
            local alpha2 = math.floor(math.abs(math.sin(global_vars.realtime) * 2) * 255)
            local lp = entities.get_entity(engine.get_local_player())
            if not lp then return end
            if not lp:is_alive() then return end
            local local_player = entities.get_entity(engine.get_local_player())
            local ay = 0
            local desync_percentage = Clamp(math.abs(local_player:get_prop("m_flPoseParameter", 11) * 120 - 60.5), 0.5 / 60, 60) / 56
            local w, h = 35, 3
            local screen_width, screen_height = render.get_screen_size( )
            local x = screen_width / 2
            local y = screen_height / 2
            local textx , texty = render.get_text_size(verdana, "Maniak") 
            local color1 = render.color(indicator_color:get_color().r, indicator_color:get_color().g, indicator_color:get_color().b, 255)
            local color2 = render.color(indicator_color:get_color().r - 70, indicator_color:get_color().g - 90, indicator_color:get_color().b - 70, 185)
        
            local text =  "Maniak.lua"
            local textx, texty = render.get_text_size(verdana, text)
            local alpha3 = math.floor(math.abs(math.sin(global_vars.realtime) * 2) * 255)
           
            render.text(verdana, x+offset_scope + 4 , y + 2 + texty, "Maniak", render.color(255, 255, 255, 255  ) )
            render.text(verdana, x+offset_scope + 40 , y + 2 + texty, ".lua", render.color(indicator_color:get_color().r, indicator_color:get_color().g, indicator_color:get_color().b, 255  ) )
            if is_dt:get_bool()  then
                render.text(verdana, x+offset_scope + 3.5 , y + 22 + texty, "DT", render.color(255, 255, 255, 255  ))
            end
                if not is_dt:get_bool() then
                render.text(verdana, x+offset_scope + 3.5 , y + 22 + texty, "DT", render.color(105, 105, 105, 100))
                end
                if is_onshot:get_bool() then
                    render.text(verdana, x+offset_scope + 3.5 , y + 32 + texty, "HS", render.color(255, 255, 255, 255  ))
                   end
                   if not is_onshot:get_bool() then
                    render.text(verdana, x+offset_scope + 3.5, y + 32 + texty, "HS", render.color(105, 105, 105, 100  ))
                   end
                   if is_fs:get_bool() then
                    render.text(verdana, x+offset_scope + 20 , y + 32 + texty, "FS", render.color(255, 255, 255, 255  ))
                   end
                   if not is_fs:get_bool() then
                    render.text(verdana, x+offset_scope + 20 , y + 32 + texty, "FS", render.color(105, 105, 105, 100  ))
                   end
                   if is_da then
                    render.text(verdana, x+offset_scope + 36.5 , y + 32 + texty, "DA", render.color(255, 255, 255, 255  ))
                   end
                   if not is_da then
                    render.text(verdana, x+offset_scope + 36.5 , y + 32 + texty, "DA", render.color(105, 105, 105, 100  ))
                   end
--states
                   if slowwalk and not air and flag ~= 263 then
                    render.text(verdana, x+offset_scope + 3.5 , y + 12 + texty, "SLOWALKING", render.color(indicator_color:get_color().r, indicator_color:get_color().g, indicator_color:get_color().b, 255  ))
                else if speed > 4 and not air and not crouch then 
                    render.text(verdana, x+offset_scope + 3.5 , y + 12 + texty, "MOVING", render.color(indicator_color:get_color().r, indicator_color:get_color().g, indicator_color:get_color().b, 255  ))
                else if speed <= 4 and flag == 257 then
                    render.text(verdana, x+offset_scope + 3.5 , y + 12 + texty, "STANDING", render.color(indicator_color:get_color().r, indicator_color:get_color().g, indicator_color:get_color().b, 255  ))
                else if   flag == 262 and not fd or ap  then
                    render.text(verdana, x+offset_scope + 3.5 , y + 12 + texty, "CROUCH+", render.color(indicator_color:get_color().r, indicator_color:get_color().g, indicator_color:get_color().b, 255  ))
                else if crouch then
                    render.text(verdana, x+offset_scope + 3.5 , y + 12 + texty, "CROUCH", render.color(indicator_color:get_color().r, indicator_color:get_color().g, indicator_color:get_color().b, 255  ))
                else if air and flag ~= 262 then
                    render.text(verdana, x+offset_scope + 3.5 , y + 12 + texty, "AIR", render.color(indicator_color:get_color().r, indicator_color:get_color().g, indicator_color:get_color().b, 255  ))
                end
                end
            end
        end
    end
end
end
end
        







function ID()
    local lp = entities.get_entity(engine.get_local_player())
    if not lp then return end
    if not lp:is_alive() then return end
    local scoped = lp:get_prop("m_bIsScoped")
    offset_scope = animation(scoped, offset_scope, 25, 10)
    
        
        local alpha2 = math.floor(math.abs(math.sin(global_vars.realtime) * 2) * 255)
        local lp = entities.get_entity(engine.get_local_player())
        if not lp then return end
        if not lp:is_alive() then return end
        local screen_width, screen_height = render.get_screen_size( )
        local x = screen_width / 2
        local y = screen_height / 2
        local ay = 0
    
    
        if indicatorsmain:get_bool() and indicatorstype:get_int() == 1 then
        
            local function Clamp(Value, Min, Max)
                return Value < Min and Min or (Value > Max and Max or Value)
            end

            local alpha2 = math.floor(math.abs(math.sin(global_vars.realtime) * 2) * 255)
            local lp = entities.get_entity(engine.get_local_player())
            if not lp then return end
            if not lp:is_alive() then return end
            local local_player = entities.get_entity(engine.get_local_player())
            local ay = 0
            local desync_percentage = Clamp(math.abs(local_player:get_prop("m_flPoseParameter", 11) * 120 - 60.5), 0.5 / 90, 60) / 56
            local w, h = 35, 3
            local screen_width, screen_height = render.get_screen_size( )
            local x = screen_width / 2
            local y = screen_height / 2
            local color1 = render.color(indicator_color:get_color().r, indicator_color:get_color().g, indicator_color:get_color().b, 255)
            local color2 = render.color(indicator_color:get_color().r - 70, indicator_color:get_color().g - 100, indicator_color:get_color().b - 70, 185)
        
            local text =  "Maniak.lua"
            local textx, texty = render.get_text_size(pixel, text)
        
            render.text(calibri11, x+offset_scope + 5, y + 6, text, render.color(indicator_color:get_color().r, indicator_color:get_color().g, indicator_color:get_color().b, 255))
        
            render.rect_filled(x + 4 +offset_scope, y + 17, x+offset_scope + w + 17, y + 18 + h + 1, render.color("#000000"))
            render.rect_filled_multicolor(x+offset_scope + 5, y + 18, x+offset_scope + 15 + w * desync_percentage, y + 18 + h, color1, color2, color2, color1)
        
        end
        end




-- screen size


-- menu

gui.set_visible("lua>tab a>keybinds_x", false)
gui.set_visible("lua>tab a>keybinds_y", false)


function animate(value, cond, max, speed, dynamic, clamp)

    -- animation speed
    speed = speed * global_vars.frametime * 20

    -- static animation
    if dynamic == false then
        if cond then
            value = value + speed
        else
            value = value - speed
        end
    
    -- dynamic animation
    else
        if cond then
            value = value + (max - value) * (speed / 100)
        else
            value = value - (0 + value) * (speed / 100)
        end
    end

    -- clamp value
    if clamp then
        if value > max then
            value = max
        elseif value < 0 then
            value = 0
        end
    end

    return value
end

function drag(var_x, var_y, size_x, size_y)
    local mouse_x, mouse_y = input.get_cursor_pos()

    local drag = false

    if input.is_key_down(0x01) then
        if mouse_x > var_x:get_int() and mouse_y > var_y:get_int() and mouse_x < var_x:get_int() + size_x and mouse_y < var_y:get_int() + size_y then
            drag = true
        end
    else
        drag = false
    end

    if (drag) then
        var_x:set_int(mouse_x - (size_x / 2))
        var_y:set_int(mouse_y - (size_y / 2))
    end

end
function on_keybinds()
    local offset_scope = 0
    local dton = 0
    local alpha = 255
    if engine.is_in_game() == false then return end
    if not keybinds2:get_bool() then return end
if keybindss:get_int() == 0 then
    local pos = {keybinds_x:get_int(), keybinds_y:get_int()}

    local size_offset = 0

    local binds =
    {
        gui.get_config_item("rage>aimbot>aimbot>double tap"):get_bool(),
        gui.get_config_item("rage>aimbot>aimbot>hide shot"):get_bool(),
        gui.get_config_item("rage>aimbot>ssg08>scout>override"):get_bool(), -- override dmg is taken from the scout
        gui.get_config_item("rage>aimbot>aimbot>headshot only"):get_bool(),
        gui.get_config_item("misc>movement>fake duck"):get_bool(),
        gui.get_config_item("misc>movement>peek assist"):get_bool(),
        gui.get_config_item("Rage>Aimbot>aimbot>Target Dormant"):get_bool(),
        gui.get_config_item("rage>aimbot>aimbot>resolver mode"):get_int() == 0,
        gui.get_config_item("lua>tab b>Fake Flick"):get_bool(),
        gui.get_config_item("lua>tab b>Invert Anti-Aim"):get_bool()
    }

    local binds_name = 
    {
        "Doubletap",
        "Hideshots",
        "Min. Damage",
        "HeadShot Only",
        "Fake duck",
        "Auto Peek",
        "Dormant Aimbot",
        "Roll Resolver",
        "Fake Flick",
        "Inverter"
    }

    if not binds[4] then
        if not binds[5] then
            if not binds[3] then
                if not binds[1] then
                    if not binds[7] then
                    if not binds[6] then
                        if not binds[8] then
                            if not binds[9] then
                             if not binds[10] then   
                         if not binds[2] then
                            size_offset = 0
                        else
                            size_offset = 38
                        end
                    else
                        size_offset = 40
                    end
                else
                    size_offset = 41
                end
            else
                size_offset = 54
            end
        else
            size_offset = 63
        end
    else
        size_offset = 70
    end
    else
        size_offset = 77
    end
else
    size_offset = 84
end
else size_offset = 91
end
else size_offset = 98
end

    animated_size_offset = animate(animated_size_offset or 0, true, size_offset, 60, true, false)

    local size = {100 + animated_size_offset, 22}

    local enabled = "   [enabled]"
    local text_size = render.get_text_size(verdana, enabled) + 5

    local override_active = binds[3] or binds[4] or binds[5] or binds[6] or binds[7] or binds[8]
    local other_binds_active = binds[1] or binds[2] or binds[9] or binds[10] or binds[11]

    drag(keybinds_x, keybinds_y, size[1], size[2])

    alpha = animate(alpha or 0, gui.is_menu_open() or override_active or other_binds_active, 1, 0.5, false, true)


    
    -- top rect
    render.push_clip_rect(pos[1], pos[2], pos[1] + size[1], pos[2] + 10)
    render.rect_filled_rounded(pos[1], pos[2], pos[1] + size[1], pos[2] + size[2], render.color(0, 0, 0, 0 * alpha), 10)
    render.pop_clip_rect()

    -- bot rect
    render.push_clip_rect(pos[1], pos[2] + 17, pos[1] + size[1], pos[2] + 2)
    render.rect_filled_rounded(pos[1], pos[2], pos[1] + size[1], pos[2] + 2, render.color(0, 0, 0, 0 * alpha), 5)
    render.pop_clip_rect()

    -- other colormain:get_color().r
    render.rect_filled_multicolor(pos[1], pos[2] + 0, pos[1] + size[1], pos[2] + 4, render.color(keybinds_color:get_color().r, keybinds_color:get_color().g, keybinds_color:get_color().b, 0 * alpha), render.color(keybinds_color:get_color().r, keybinds_color:get_color().g, keybinds_color:get_color().b, 0 * alpha), render.color(keybinds_color:get_color().r, keybinds_color:get_color().g, keybinds_color:get_color().b, 0 * alpha), render.color(keybinds_color:get_color().r, keybinds_color:get_color().g, keybinds_color:get_color().b, 0 * alpha))
    render.rect_filled_rounded(pos[1] + 2, pos[2] + 2, pos[1] + size[1] - -2, pos[2] + 20, render.color(0, 0, 0, 40 * alpha), 1)
    render.rect_filled_rounded(pos[1] + 2, pos[2] - 1, pos[1] + size[1] - -2, pos[2] + 2, render.color(keybinds_color:get_color().r, keybinds_color:get_color().g, keybinds_color:get_color().b, 250 * alpha), 1)
    render.text(verdanakb, pos[1] + size[1] / 2.15 - render.get_text_size(verdanakbb, "keybinds") / 2.29 - 0.1, pos[2] + 3, "keybinds", render.color(255, 255, 255, 255 * alpha))
    

    local bind_offset = 0
    dt_alpha = animate(dt_alpha or 0, binds[1], 1, 0.5, false, true)
    render.text(verdanakb, pos[1] + 6, pos[2] + size[2] + 2, binds_name[1], render.color(255, 255, 255, 255 * dt_alpha))
    render.text(verdanakb, pos[1] + size[1] - text_size, pos[2] + size[2] + 0, enabled, render.color(255, 255, 255, 255 * dt_alpha))
    if binds[1] then
        bind_offset = bind_offset + 11
    end

    hs_alpha = animate(hs_alpha or 0, binds[2], 1, 0.5, false, true)
    render.text(verdanakb, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[2], render.color(255, 255, 255, 255 * hs_alpha))
    render.text(verdanakb, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255 * hs_alpha))
    if binds[2] then
        bind_offset = bind_offset + 11
    end

    dmg_alpha = animate(dmg_alpha or 0, binds[3], 1, 0.5, false, true)
    render.text(verdanakb, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[3], render.color(255, 255, 255, 255 * dmg_alpha))
    render.text(verdanakb, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255 * dmg_alpha))
    if binds[3] then
        bind_offset = bind_offset + 11
    end

    fs_alpha = animate(fs_alpha or 0, binds[4], 1, 0.5, false, true)
    render.text(verdanakb, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[4], render.color(255, 255, 255, 255 * fs_alpha))
    render.text(verdanakb, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255 * fs_alpha))
    if binds[4] then
        bind_offset = bind_offset + 11
    end

    ho_alpha = animate(ho_alpha or 0, binds[5], 1, 0.5, false, true)
    render.text(verdanakb, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[5], render.color(255, 255, 255, 255 * ho_alpha))
    render.text(verdanakb, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255 * ho_alpha))
    if binds[5] then
        bind_offset = bind_offset + 11
    end

    fd_alpha = animate(fd_alpha or 0, binds[6], 1, 0.5, false, true)
    render.text(verdanakb, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[6], render.color(255, 255, 255, 255 * fd_alpha))
    render.text(verdanakb, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255 * fd_alpha))
if binds[6] then
    bind_offset = bind_offset + 11
end
rr_alpha = animate(rr_alpha or 0, binds[8], 1, 0.5, false, true)
render.text(verdanakb, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[8], render.color(255, 255, 255, 255 * rr_alpha))
render.text(verdanakb, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255 * rr_alpha))
if binds[8] then
bind_offset = bind_offset + 11
end

ff_alpha = animate(ff_alpha or 0, binds[9], 1, 0.5, false, true)
render.text(verdanakb, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[9], render.color(255, 255, 255, 255 * ff_alpha))
render.text(verdanakb, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255 * ff_alpha))
if binds[9] then
bind_offset = bind_offset + 11
end

in_alpha = animate(in_alpha or 0, binds[10], 1, 0.5, false, true)
render.text(verdanakb, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[10], render.color(255, 255, 255, 255 * in_alpha))
render.text(verdanakb, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255 * in_alpha))
if binds[10] then
bind_offset = bind_offset + 11
end

ap_alpha = animate(ap_alpha or 0, binds[7], 1, 0.5, false, true)
render.text(verdanakb, pos[1] + 6, pos[2] + size[2] + 2 + bind_offset, binds_name[7], render.color(255, 255, 255, 255 * ap_alpha))
render.text(verdanakb, pos[1] + size[1] - text_size, pos[2] + size[2] + 2 + bind_offset, enabled, render.color(255, 255, 255, 255 * ap_alpha))
end
end









function builder()
    local fd = gui.get_config_item("misc>movement>fake duck"):get_bool()
    local ap = gui.get_config_item("misc>movement>peek assist"):get_bool()
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
local jitterrange = gui.get_config_item("rage>anti-aim>angles>jitter range")
local faketoggle = gui.get_config_item("rage>anti-aim>desync>fake")
local fakeamount = gui.get_config_item("rage>anti-aim>desync>fake amount")
local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
local fsfake = gui.get_config_item("rage>anti-aim>desync>freestand fake")
local fakejitter = gui.get_config_item("rage>anti-aim>desync>flip fake with jitter")
local slide = gui.get_config_item("misc>movement>slide")
    local rollex = gui.get_config_item("rage>anti-aim>desync>roll lean")
    local roll = gui.get_config_item("rage>Anti-Aim>Desync>Lean Amount")
    local att = gui.get_config_item("rage>anti-aim>angles>at fov target")
    if engine.is_in_game() == false then return end
    if WorkAA:get_bool() == false then return end
    if WorkAA:get_bool() == true then
        local slowwalk = slide:get_bool()
        local lplr = entities.get_entity(engine.get_local_player())
        local flag = lplr:get_prop("m_fFlags")
        local air = lplr:get_prop("m_hGroundEntity") == -1
        local air2 = input.is_key_down(0x20)
        local velocity_x = math.floor(lplr:get_prop("m_vecVelocity[0]"))
        local velocity_y = math.floor(lplr:get_prop("m_vecVelocity[1]"))
        local speed = math.sqrt(velocity_x ^ 2 + velocity_y ^ 2)
        local crouch = input.is_key_down(0x11)


        if slowwalk and not air and flag ~= 263 then
            jittertoggle:set_bool(aa.slowwalk_jittertoggle:get_bool())
            jitterrange:set_int(aa.slowwalk_jitterrange:get_int())
            faketoggle:set_bool(aa.slowwalk_faketoggle:get_bool())
            fakeamount:set_int(aa.slowwalk_fakeamount:get_int())
            compangle:set_int(aa.slowwalk_compangle:get_int())
            att:set_bool(aa.slowwalk_att:get_bool())
            rollex:set_int(aa.slowwalk_rollonoff:get_int())
            roll:set_int(aa.slowwalk_roll:get_int())

        else if speed > 4 and not air and not crouch then 
            jittertoggle:set_bool(aa.moving_jittertoggle:get_bool())
            jitterrange:set_int(aa.moving_jitterrange:get_int())
            faketoggle:set_bool(aa.moving_faketoggle:get_bool())
            fakeamount:set_int(aa.moving_fakeamount:get_int())
            compangle:set_int(aa.moving_compangle:get_int())
            att:set_bool(aa.moving_att:get_bool())
            rollex:set_int(aa.moving_rollonoff:get_int())
            roll:set_int(aa.moving_roll:get_int())

        else if speed <= 4 and flag == 257 then
            jittertoggle:set_bool(aa.standing_jittertoggle:get_bool())
            jitterrange:set_int(aa.standing_jitterrange:get_int())
            faketoggle:set_bool(aa.standing_faketoggle:get_bool())
            fakeamount:set_int(aa.standing_fakeamount:get_int())
            compangle:set_int(aa.standing_compangle:get_int())
            att:set_bool(aa.standing_att:get_bool())
            rollex:set_int(aa.standing_rollonoff:get_int())
            roll:set_int(aa.standing_roll:get_int())

        else if   flag == 262 and not fd or ap  then
            jittertoggle:set_bool(aa.crouchingair_jittertoggle:get_bool())
            jitterrange:set_int(aa.crouchingair_jitterrange:get_int())
            faketoggle:set_bool(aa.crouchingair_faketoggle:get_bool())
            fakeamount:set_int(aa.crouchingair_fakeamount:get_int())
            compangle:set_int(aa.crouchingair_compangle:get_int())
            att:set_bool(aa.crouchingair_att:get_bool())
            rollex:set_int(aa.crouchingair_rollonoff:get_int())
            roll:set_int(aa.crouchingair_roll:get_int())

        else if crouch then
            jittertoggle:set_bool(aa.crouching_jittertoggle:get_bool())
            jitterrange:set_int(aa.crouching_jitterrange:get_int())
            faketoggle:set_bool(aa.crouching_faketoggle:get_bool())
            fakeamount:set_int(aa.crouching_fakeamount:get_int())
            compangle:set_int(aa.crouching_compangle:get_int())
            att:set_bool(aa.crouching_att:get_bool())
            rollex:set_int(aa.crouching_rollonoff:get_int())
            roll:set_int(aa.crouching_roll:get_int())

        else if air and flag ~= 262 then
            jittertoggle:set_bool(aa.air_jittertoggle:get_bool())
            jitterrange:set_int(aa.air_jitterrange:get_int())
            faketoggle:set_bool(aa.air_faketoggle:get_bool())
            fakeamount:set_int(aa.air_fakeamount:get_int())
            compangle:set_int(aa.air_compangle:get_int())
            att:set_bool(aa.air_att:get_bool())
            rollex:set_int(aa.air_rollonoff:get_int())
            roll:set_int(aa.air_roll:get_int())
        
        end
        end
        end
        end
        end
    end
end
end
function builder2()
    local fd = gui.get_config_item("misc>movement>fake duck"):get_bool()
    local ap = gui.get_config_item("misc>movement>peek assist"):get_bool()
    local ensure = gui.get_config_item("rage>anti-aim>desync>ensure lean")
    local pitch = gui.get_config_item("rage>anti-aim>angles>pitch")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
local jitterrange = gui.get_config_item("rage>anti-aim>angles>jitter range")
local faketoggle = gui.get_config_item("rage>anti-aim>desync>fake")
local fakeamount = gui.get_config_item("rage>anti-aim>desync>fake amount")
local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
local fsfake = gui.get_config_item("rage>anti-aim>desync>freestand fake")
local fakejitter = gui.get_config_item("rage>anti-aim>desync>flip fake with jitter")
local slide = gui.get_config_item("misc>movement>slide")
    local rollex = gui.get_config_item("rage>anti-aim>desync>roll lean")
    local roll = gui.get_config_item("rage>Anti-Aim>Desync>Lean Amount")
    local att = gui.get_config_item("rage>anti-aim>angles>at fov target")
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    local spinrange = gui.get_config_item("rage>anti-aim>angles>spin range")
    local spinspeed = gui.get_config_item("rage>anti-aim>angles>spin speed")
    if engine.is_in_game() == false then return end
    if WorkAA:get_bool() == false then return end
    if WorkAA:get_bool() == true then
        local slowwalk = slide:get_bool()
        local lplr = entities.get_entity(engine.get_local_player())
        local flag = lplr:get_prop("m_fFlags")
        local air = lplr:get_prop("m_hGroundEntity") == -1
        local air2 = input.is_key_down(0x20)
        local velocity_x = math.floor(lplr:get_prop("m_vecVelocity[0]"))
        local velocity_y = math.floor(lplr:get_prop("m_vecVelocity[1]"))
        local speed = math.sqrt(velocity_x ^ 2 + velocity_y ^ 2)
        local crouch = input.is_key_down(0x11)

        if slowwalk and not air and flag ~= 263 then
            pitch:set_int(aa.slowwalk_pitch:get_int())
        spintoggle:set_int(aa.slowwalk_spintog:get_int())
        spinrange:set_int(aa.slowwalk_spinr:get_int())
        spinspeed:set_int(aa.slowwalk_spins:get_int())
        ensure:set_int(aa.slowwalk_ensure:get_int())
        

        else if speed > 4 and not air and not crouch and not fd or ap then 
            pitch:set_int(aa.moving_pitch:get_int())
            spintoggle:set_int(aa.moving_spintog:get_int())
            spinrange:set_int(aa.moving_spinr:get_int())
            spinspeed:set_int(aa.moving_spins:get_int())
            ensure:set_int(aa.moving_ensure:get_int())
        

        else if speed <= 4 and flag == 257 and not fd or ap then
            pitch:set_int(aa.standing_pitch:get_int())
            spintoggle:set_int(aa.standing_spintog:get_int())
            spinrange:set_int(aa.standing_spinr:get_int())
            spinspeed:set_int(aa.standing_spins:get_int())
            ensure:set_int(aa.standing_ensure:get_int())
        

        else if  flag == 262 and not fd or ap then
            pitch:set_int(aa.crouchingair_pitch:get_int())
            spintoggle:set_int(aa.crouchingair_spintog:get_int())
            spinrange:set_int(aa.crouchingair_spinr:get_int())
            spinspeed:set_int(aa.crouchingair_spins:get_int())
            ensure:set_int(aa.crouchingair_ensure:get_int())
        else 

      if crouch and not fd or ap then
            pitch:set_int(aa.crouching_pitch:get_int())
            spintoggle:set_int(aa.crouching_spintog:get_int())
            spinrange:set_int(aa.crouching_spinr:get_int())
            spinspeed:set_int(aa.crouching_spins:get_int())
            ensure:set_int(aa.crouching_ensure:get_int())
        

        else  if air and flag ~= 262 and not fd or ap then
            pitch:set_int(aa.air_pitch:get_int())
            spintoggle:set_int(aa.air_spintog:get_int())
            spinrange:set_int(aa.air_spinr:get_int())
            spinspeed:set_int(aa.air_spins:get_int())
            ensure:set_int(aa.air_ensure:get_int())
        
        
        else  if fd and speed <= 1 and flag == 257 and not ap  then
            jittertoggle:set_bool(aa.fd_jittertoggle:get_bool())
            jitterrange:set_int(aa.fd_jitterrange:get_int())
            faketoggle:set_bool(aa.fd_faketoggle:get_bool())
            fakeamount:set_int(aa.fd_fakeamount:get_int())
            compangle:set_int(aa.fd_compangle:get_int())
            att:set_bool(aa.fd_att:get_bool())
            rollex:set_int(aa.fd_rollonoff:get_int())
            roll:set_int(aa.fd_roll:get_int())
            pitch:set_int(aa.fd_pitch:get_int())
            spintoggle:set_int(aa.fd_spintog:get_int())
            spinrange:set_int(aa.fd_spinr:get_int())
            spinspeed:set_int(aa.fd_spins:get_int())
            ensure:set_int(aa.fd_ensure:get_int())
        
        else  if fd and speed > 4 and not air and not crouch and not ap  then
            jittertoggle:set_bool(aa.fd_jittertoggle:get_bool())
            jitterrange:set_int(aa.fd_jitterrange:get_int())
            faketoggle:set_bool(aa.fd_faketoggle:get_bool())
            fakeamount:set_int(aa.fd_fakeamount:get_int())
            compangle:set_int(aa.fd_compangle:get_int())
            att:set_bool(aa.fd_att:get_bool())
            rollex:set_int(aa.fd_rollonoff:get_int())
            roll:set_int(aa.fd_roll:get_int())
            pitch:set_int(aa.fd_pitch:get_int())
            spintoggle:set_int(aa.fd_spintog:get_int())
            spinrange:set_int(aa.fd_spinr:get_int())
            spinspeed:set_int(aa.fd_spins:get_int())
            ensure:set_int(aa.fd_ensure:get_int())
        

        else if ap and speed <= 1 and flag == 257 and not fd   then
            jittertoggle:set_bool(aa.ap_jittertoggle:get_bool())
            jitterrange:set_int(aa.ap_jitterrange:get_int())
            faketoggle:set_bool(aa.ap_faketoggle:get_bool())
            fakeamount:set_int(aa.ap_fakeamount:get_int())
            compangle:set_int(aa.ap_compangle:get_int())
            att:set_bool(aa.ap_att:get_bool())
            rollex:set_int(aa.ap_rollonoff:get_int())
            roll:set_int(aa.ap_roll:get_int())
            pitch:set_int(aa.ap_pitch:get_int())
            spintoggle:set_int(aa.ap_spintog:get_int())
            spinrange:set_int(aa.ap_spinr:get_int())
            spinspeed:set_int(aa.ap_spins:get_int())
            ensure:set_int(aa.ap_ensure:get_int())
        
        
        else  if ap and speed > 4 and not air and not crouch and not fd   then
            jittertoggle:set_bool(aa.ap_jittertoggle:get_bool())
            jitterrange:set_int(aa.ap_jitterrange:get_int())
            faketoggle:set_bool(aa.ap_faketoggle:get_bool())
            fakeamount:set_int(aa.ap_fakeamount:get_int())
            compangle:set_int(aa.ap_compangle:get_int())
            att:set_bool(aa.ap_att:get_bool())
            rollex:set_int(aa.ap_rollonoff:get_int())
            roll:set_int(aa.ap_roll:get_int())
            pitch:set_int(aa.ap_pitch:get_int())
            spintoggle:set_int(aa.ap_spintog:get_int())
            spinrange:set_int(aa.ap_spinr:get_int())
            spinspeed:set_int(aa.ap_spins:get_int())
            ensure:set_int(aa.ap_ensure:get_int())
        
        end
        end
        end
    end
end
end
end
end
end
end
end
end



function on_shutdown()
    utils.set_clan_tag("");
end


function on_paint()
    nsss()
    fl()
    watermark()
    gui_controller()
    guiscc()
    on_keybinds()
    clantagfc()
    builder()
    builder2()
    aspect_ratio2()
    indicators()
    ID()
    idealtickv()
    get_tickrate()
    mw()
    freestandstat()
    legitaait()
    DA()
    manual()
    resolvermode()
    InvertDesync()
    fastdtonit()
    fakeflick()
    dttickbase()
    legitaa()
    OSFF()
    itpitchz()
    itpitchup()
    sv_cheats1()
    ov()
    way()
    way3()
    wayx()
    nr()
    sw()
    flaghandle()
    wfdtr()
    indhandle()
    dttp()
    aapre()
    aapre1()
    aapre2()
    aapre3()
    aapre4()
    aapre5()
    aapre6()
    aapre7()
    aapre8()
    fsf()
    keybinds1()
    watermark1()
    pitchupexp()
    g()
    dmg()
    fh()
    get_local_speed()
    pitchupexp1()
    dte()
    sj()
    dj()
    resolver()
    dishsondt()
    nsss1()
    end



--tickrate

function get_tickrate()
    local cmd_ticks = cvar.sv_maxusrcmdprocessticks
    if not engine.is_in_game() then return end
    if rage.tripletap:get_bool() then
    cmd_ticks:set_int(-300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
    else
        if not rage.tripletap:get_bool() and not rage.dttick:get_bool() then
            return math.floor( 1 / global_vars.interval_per_tick )
        else
            if not rage.dttick:get_bool() and not rage.tripletap:get_bool() then
                return math.floor( 1 / global_vars.interval_per_tick )
            else
            if rage.dttick:get_bool() then
                if rage.pred:get_int() == 0 then
                return math.floor( -13.693   / global_vars.interval_per_tick )
                else
                if rage.dttick:get_bool() then
                    if rage.pred:get_int() == 1 then
                    return math.floor( -19 / global_vars.interval_per_tick )
                else
                    if rage.dttick:get_bool() then
                        if rage.pred:get_int() == 2 then
                            return math.floor( -11000 / global_vars.interval_per_tick )
                        else
                if rage.dttick:get_bool() == true and rage.tripletap:get_bool() == true then
                    rage.tripletap:set_int(0)
                else
                if rage.tripletap:get_bool() == true and rage.dttick:get_bool() == true then
                    rage.dttick:set_int(0)
                end
            end
        end       
end
end
end
end
end
end
end
end
end
















































































--Ideal tick

function idealtickv()
    local fs = gui.get_config_item("rage>Anti-Aim>angles>freestand");
    local ap = gui.get_config_item("misc>movement>peek assist");
    local pitch = gui.get_config_item("rage>Anti-Aim>angles>pitch");
    local head = gui.get_config_item("rage>aimbot>aimbot>headshot only");
    local Dormant = gui.get_config_item("Rage>Aimbot>aimbot>Target Dormant");
    local jitter = gui.get_config_item("Rage>Anti-Aim>Angles>Jitter");
         if rage.idealtick:get_bool() then 
    if ap:get_bool() == true then

if rage.fs0:get_bool() == true then
    fs:set_int(1)
end
if rage.hs0:get_bool() == true then
    head:set_int(1)
end

else
        if ap:get_bool() == false then
            if rage.fs0:get_bool() == false or true then
                fs:set_int(0)
            else return
            end
            if rage.hs0:get_bool() == false or true then
                head:set_int(0)
            else return
            end

            else return
            end
        end
            end
        end
    

        








--menu watermark




function mw()
    if mww:get_bool() then
        local menuopen = gui.is_menu_open()
        local menupos_x1, menupos_y1, menupos_x2, menupos_y2 = gui.get_menu_rect()
        local textsize_w, textsize_h = render.get_text_size(font69, "Maniak.lua")
        if menuopen then
            render.push_uv(0, 0, 0, 0)
            render.pop_uv()
            render.pop_uv()
            render.text(font69, menupos_x2 - textsize_w - 630, menupos_y1 - textsize_h, "Maniak.lua V1.4", render.color(mwatermark_color:get_color().r, mwatermark_color:get_color().g, mwatermark_color:get_color().b, 255), 1.5, render.all)
            render.text(font69, menupos_x2 - textsize_w - 10, menupos_y1 - textsize_h,  ''..engine.get_player_info(engine.get_local_player()).name.. '', render.color(mwatermark_color:get_color().r, mwatermark_color:get_color().g, mwatermark_color:get_color().b, 255), 1.5, render.all )
        end
    end
end

--end








function on_shot_registered(shot)

    local cheatlogs = gui.get_config_item("misc>various>hurt log")
    local safetytext = 0
    local safetyv = shot.very_secure
    local safetyk = shot.secure

    
    local hitgroup = {

    [0] = "generic",
    [1] = "head",
    [2] = "chest",
    [3] = "stomach",
    [4] = "left arm",
    [5] = "right arm",
    [6] = "left leg",
    [7] = "right leg",
    [10] = "gear"
    }

    local safety = {

        [0] = "Not Really",
        [1] = "Kinda",
        [2] = "Yeah"
    }

    safe1:set_bool(safetyk)
    safe2:set_bool(safetyv)

    local safetytext = safe1:get_int() + safe2:get_int()
    if Hitlogs:get_bool() then
    if shot.manual then return end

    local p = entities.get_entity(shot.target)
    local n = p:get_player_info()

    if shot.server_damage == -1 then
        utils.print_console('\n[Maniak.lua] ', hlc:get_color())
        print(string.format("Miss: %s in %s due to: %s | HC: %i | Dmg: %i | BT: %i | Safe: %s",
           n.name, hitgroup[shot.client_hitgroup], shot.result, shot.hitchance, shot.client_damage, shot.backtrack, safety[safetytext], shot.secure, shot.very_secure))

    else
        utils.print_console('\n[Maniak.lua] ', hlc:get_color())
        print(string.format("Hit: %s in %s(%s) | HC: %i | Dmg: %i(%i) | BT: %i | Safe: %s",
         n.name, hitgroup[shot.server_hitgroup], hitgroup[shot.client_hitgroup], shot.hitchance, shot.server_damage, shot.client_damage, shot.backtrack, safety[safetytext]))


    end

        end

    end

        
    




      
        
   
   






--ideal tick fss



--AA presets

--legit aa on it 
function legitaait()
    local ap = gui.get_config_item("misc>movement>peek assist");
    local leg= gui.get_config_item("Rage>Anti-Aim>angles>Anti-Aim");
    if rage.idealtick:get_bool() == true then
        if rage.legitaaitt:get_bool() == true then
        if ap:get_bool() == true then
            aa.legit:set_int(0)
        else
            if ap:get_bool() == false then
                aa.legit:set_int(1)
            else
                if rage.idealtick:get_bool() == false then
                    if rage.legitaaitt:get_bool() == false or true then
                        if ap:get_bool() == false or true then
                            aa.legit:set_int(1)
                        end
                    end
                end
            end
        end
    end
end
end















-- 205 76









--pitch up exploit





function InvertDesync()
    local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
    local fakeangle = gui.get_config_item("Rage>Anti-Aim>Desync>Fake Amount")
    if aa.IV:get_bool() then
        compangle:set_int(compangle:get_int() * -1)
    end
end



function fastdtonit()
    local dt = gui.get_config_item("Rage>Aimbot>Aimbot>Double tap")
    local ap = gui.get_config_item("misc>movement>peek assist");
    if rage.idealtick:get_bool() == true then
    if rage.fastdt:get_bool() == true then
            if dt:get_bool() == true then
            if rage.dttick:get_bool() == true then
            if ap:get_bool() == true then
        return math.floor( -19.9 / global_vars.interval_per_tick )
            else
                if rage.idealtick:get_bool() == false then
                    if rage.fastdt:get_bool() == false then
                        if dt:get_bool() == true then
                            if rage.dttick:get_bool() == true then
                            if ap:get_bool() == true then
                                if rage.pred:get_int() == 0 then
                                return math.floor( -12.693 / global_vars.interval_per_tick )
                            else
                                if rage.idealtick:get_bool() == false then
                                    if rage.fastdt:get_bool() == false then
                                        if dt:get_bool() == true then
                                            if rage.dttick:get_bool() == true then
                                            if ap:get_bool() == true then
                                                if rage.pred:get_int() == 1 then
                                                return math.floor( -19 / global_vars.interval_per_tick )
                                            else
                                if rage.idealtick:get_bool() == false then
                                    if rage.fastdt:get_bool() == false then
                                        if dt:get_bool() == false then
                                            if rage.dttick:get_bool() == true then
                                            if ap:get_bool() == true then
                                                if rage.pred:get_int() == 0 then
                                                return math.floor( -13.693 / global_vars.interval_per_tick )
                                            else
                                                if rage.idealtick:get_bool() == false then
                                                    if rage.fastdt:get_bool() == false then
                                                        if dt:get_bool() == false then
                                                            if rage.dttick:get_bool() == true then
                                                            if ap:get_bool() == true then
                                                                if rage.pred:get_int() == 1 then
                                                                return math.floor( -15.79 / global_vars.interval_per_tick )
                                                            else
                                                if rage.idealtick:get_bool() == false then
                                                    if rage.fastdt:get_bool() == false then
                                                        if dt:get_bool() == false then
                                                            if rage.dttick:get_bool() == false then
                                                            if ap:get_bool() == true then
                                                                return math.floor( 1 / global_vars.interval_per_tick )
                                                            else
                                                                if rage.idealtick:get_bool() == false then
                                                                    if rage.fastdt:get_bool() == false then
                                                                        if dt:get_bool() == false then
                                                                            if rage.dttick:get_bool() == false then
                                                                            if ap:get_bool() == false then
                                                                                return math.floor( 1 / global_vars.interval_per_tick )

    end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end

function fakeflick()
  local  ticks = cvar.sv_maxusrcmdprocessticks
    local fakeangle = gui.get_config_item("Rage>Anti-Aim>Desync>Fake Amount")
    local add = gui.get_config_item("Rage>Anti-Aim>Angles>Add")
    local yadd = gui.get_config_item("Rage>Anti-Aim>Angles>yaw Add")
    local fakeamount = fakeangle:get_int() >= 0
    if aa.FF:get_bool() then
        if global_vars.tickcount % 14 == 13 and fakeangle:get_int() >= 0 then
            ticks:set_int(25)
            limit:set_int(999999)
            yadd:set_int(1)
            add:set_int(104)
        else
            if global_vars.tickcount % 14 == 13 and 0 >= fakeangle:get_int() then
                ticks:set_int(25)
                limit:set_int(999999)
                yadd:set_int(1)
                add:set_int(-104)
            end
            if aa.FF:get_bool() == false then 
                ticks:set_int(ticks:get_int())
                limit:set_int(limit:get_int())
                yadd:set_int(yadd:get_int())
                add:set_int(add:get_int())
        end 
    end
end
end




function dttickbase()
    local cmd_ticks = cvar.sv_maxusrcmdprocessticks
    if rage.dttickb:get_bool() then
        if rage.dttype:get_int() == 0 then
    if dt:get_bool() == true and info.fatality.can_fastfire then
       cmd_ticks:set_int(-21.9) 
    else
        if rage.dttickb:get_bool() then
        if rage.dttype:get_int() == 1 then
     if rage.dttickb:get_bool() then      
      if not dt:get_bool() and info.fatality.can_fastfire or not info.fatality.can_fastfire then
    cmd_ticks:set_int(17)
      end
      if rage.dttickb:get_bool() then
        if rage.dttype:get_int() == 1 then
     if rage.dttickb:get_bool() then      
      if dt:get_bool() and not info.fatality.can_fastfire then
        cmd_ticks:set_int(17)
    end
 if not rage.dttickb:get_bool() then cmd_ticks:set_int(cmd_ticks:get_int()) 

end
end
end
end
end
end
end
end
end
end
end


function legitaa()
    local yes = gui.get_config_item("rage>anti-aim>angles>pitch")
    local yes1 = gui.get_config_item("rage>anti-aim>angles>yaw")
    local yes2 = gui.get_config_item("rage>anti-aim>angles>anti-aim")
    local yes3 = gui.get_config_item("rage>anti-aim>angles>at fov target")
    local rollex = gui.get_config_item("rage>anti-aim>desync>roll lean")
    local roll = gui.get_config_item("rage>Anti-Aim>Desync>Lean Amount")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    local fakeangle = gui.get_config_item("Rage>Anti-Aim>Desync>Fake Amount")
    local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
    if aa.legit:get_bool() == true and aa.IV:get_bool() == false then
        yes2:set_int(1)
        yes:set_int(0)
        yes1:set_int(0)
        yes3:set_int(0)
        rollex:set_int(0)
        roll:set_int(0)
        jittertoggle:set_int(0)
        fakeangle:set_int(150)
        compangle:set_int(-150)
    elseif aa.legit:get_bool() == false then
        yes2:set_int(yes2:get_int())
        yes:set_int(yes:get_int())
        yes1:set_int(1)
        yes3:set_int(yes3:get_int())
        roll:set_int(roll:get_int())
        jittertoggle:set_int(jittertoggle:get_int())
        fakeangle:set_int(fakeangle:get_int())
        compangle:set_int(compangle:get_int())
    end
    if aa.legit:get_bool() == true and aa.IV:get_bool() == true then
        yes2:set_int(1)
        yes:set_int(0)
        yes1:set_int(0)
        yes3:set_int(0)
        rollex:set_int(0)
        roll:set_int(0)
        jittertoggle:set_int(0)
        fakeangle:set_int(-100)
        compangle:set_int(50)
    end
end





















function sv_cheats1()
    local sv_cheats = cvar.sv_cheats
    if svc1:get_bool() == true then
        sv_cheats:set_int(1)
    end
    if svc1:get_bool() == false then
        sv_cheats:set_int(0)
    end
end




function nr()
    local nore = cvar.weapon_recoil_scale 
    if rage.nore1:get_bool() == true then
        nore:set_int(0)
    end
    if rage.nore1:get_bool() == false then
        nore:set_int(2)
    end
end


function ov()
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    local jitterrange = gui.get_config_item("rage>anti-aim>angles>jitter range")
    local faketoggle = gui.get_config_item("rage>anti-aim>desync>fake")
    local fakeamount = gui.get_config_item("rage>anti-aim>desync>fake amount")
    local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
    local fsfake = gui.get_config_item("rage>anti-aim>desync>freestand fake")
    local fakejitter = gui.get_config_item("rage>anti-aim>desync>flip fake with jitter")
    local slide = gui.get_config_item("misc>movement>slide")
    local ove =  gui.get_config_item("rage>aimbot>ssg08>scout>Minimum hit chance")
   local fd = gui.get_config_item("misc>movement>fake duck"):get_bool()
    local ap = gui.get_config_item("misc>movement>peek assist"):get_bool()
    if engine.is_in_game() == false then return end
    if override.over:get_bool() == false then return end
    if override.over:get_bool() == true then
        local slowwalk = slide:get_bool()
        local lplr = entities.get_entity(engine.get_local_player())
        local flag = lplr:get_prop("m_fFlags")
        local air = lplr:get_prop("m_hGroundEntity") == -1
        local air2 = input.is_key_down(0x20)
        local velocity_x = math.floor(lplr:get_prop("m_vecVelocity[0]"))
        local velocity_y = math.floor(lplr:get_prop("m_vecVelocity[1]"))
        local speed = math.sqrt(velocity_x ^ 2 + velocity_y ^ 2)
        local crouch = input.is_key_down(0x11)
        local lp = entities.get_entity(engine.get_local_player())
        local scoped = lp:get_prop("m_bIsScoped")

        if slowwalk and not air and flag ~= 263 then --sw
            ove:set_int(override.over2:get_int())
        
        else if speed > 4 and not air and not crouch then --moving
            ove:set_int(override.over3:get_int()) 
        else
         if speed <= 4 and flag == 257 then --standing
            ove:set_int(override.over4:get_int()) 
            else
         if flag == 262 then
            ove:set_int(override.over0:get_int()) -- C + A
        else
         if crouch then
            ove:set_int(override.over5:get_int()) -- crouch
        else
         if air and flag ~= 262 then --air
            ove:set_int(override.over1:get_int())
        else
         if ap then --auto peek
            ove:set_int(override.over6:get_int())
        else
         if fd then --fakeduck
            ove:set_int(override.over7:get_int())
        else
        if scoped == false and not fd or ap or air and flag ~= 262 or crouch or flag == 262 or speed <= 1 and flag == 257 or speed > 4 or slowwalk then 
            ove:set_int(override.over8:get_int())
        
        end
        end
    end
end
end
end
end
end
end
end
end


function way()
    local yawadd = gui.get_config_item("Rage>Anti-Aim>Angles>Add")
    local yaw = gui.get_config_item("Rage>Anti-Aim>Angles>yaw add")
    if aa.aaim2:get_bool() then
        yaw:set_int(1)
        local clic = global_vars.tickcount % 5
        if clic == 1 then yawadd:set_int(aa.aaim22:get_int()) end
        if clic == 3 then yawadd:set_int(math.max(aa.aaim22:get_int() / -5)) end
        if clic == 4 then yawadd:set_int(math.max(aa.aaim22:get_int() / 5)) end
        if clic == 5 then yawadd:set_int(math.max(aa.aaim22:get_int() / -10)) end
        if clic == 6 then yawadd:set_int(math.max(aa.aaim22:get_int() / 10)) end
        if clic == 7 then yawadd:set_int(math.max(aa.aaim22:get_int() / -20)) end
        if clic == 8 then yawadd:set_int(math.max(aa.aaim22:get_int() / 20)) end
        if clic == 9 then yawadd:set_int(math.max(aa.aaim22:get_int() /- 40)) end
        if clic == 10 then yawadd:set_int(math.max(aa.aaim22:get_int() / -50)) end
        if clic == 2 then yawadd:set_int(aa.aaim22:get_int() / 1) end
    end
end


function way3()
    local yawadd = gui.get_config_item("Rage>Anti-Aim>Angles>Add")
    local yaw = gui.get_config_item("Rage>Anti-Aim>Angles>yaw add")
    if aa.aaim33:get_bool() then
        yaw:set_int(1)
        local clic = global_vars.tickcount % 3
        if clic == 1 then yawadd:set_int(aa.aaim3:get_int()) end
        if clic == 3 then yawadd:set_int(math.max(aa.aaim3:get_int() / -3)) end
        if clic == 4 then yawadd:set_int(math.max(aa.aaim3:get_int() / 3)) end
        if clic == 5 then yawadd:set_int(math.max(aa.aaim3:get_int() / -6)) end
        if clic == 6 then yawadd:set_int(math.max(aa.aaim3:get_int() / 6)) end
        if clic == 7 then yawadd:set_int(math.max(aa.aaim3:get_int() / -12)) end
        if clic == 8 then yawadd:set_int(math.max(aa.aaim3:get_int() / 12)) end
        if clic == 9 then yawadd:set_int(math.max(aa.aaim3:get_int() / -24)) end
        if clic == 10 then yawadd:set_int(math.max(aa.aaim3:get_int() / -34)) end
        if clic == 2 then yawadd:set_int(aa.aaim3:get_int() / 1) end

end
end

function wayx()
    local yawadd = gui.get_config_item("Rage>Anti-Aim>Angles>Add")
    local yaw = gui.get_config_item("Rage>Anti-Aim>Angles>yaw add")
    if aa.aaimxx:get_bool() then
        yaw:set_int(1)
        local clic = global_vars.tickcount % 10
        if clic == 1 then yawadd:set_int(aa.aaimx:get_int()) end
        if clic == 3 then yawadd:set_int(math.max(aa.aaimx:get_int() / -10)) end
        if clic == 4 then yawadd:set_int(math.max(aa.aaimx:get_int() / 10)) end
        if clic == 5 then yawadd:set_int(math.max(aa.aaimx:get_int() / -20)) end
        if clic == 6 then yawadd:set_int(math.max(aa.aaimx:get_int() / 20)) end
        if clic == 7 then yawadd:set_int(math.max(aa.aaimx:get_int() / -40)) end
        if clic == 8 then yawadd:set_int(math.max(aa.aaimx:get_int() / 40)) end
        if clic == 9 then yawadd:set_int(math.max(aa.aaimx:get_int() / -80)) end
        if clic == 10 then yawadd:set_int(math.max(aa.aaimx:get_int() / -94)) end
        if clic == 2 then yawadd:set_int(aa.aaimx:get_int() / 1) end
end
end

















function sw( )
    local cl_sidespeed = cvar.cl_sidespeed
local cl_forwardspeed = cvar.cl_forwardspeed
local cl_backspeed = cvar.cl_backspeed
    if slowwalk_box:get_bool() == true then
        local is_down = input.is_key_down( 16 );
        if not ( is_down ) then
            set_speed( 450 )
        else
            local final_val = 250 * slowwalk_slider:get_float( ) / 100
            set_speed( final_val )
        end
    end
end


espfont = render.font_esp




function flaghandle()
    
--    local localp = entities.get_entity(engine.get_local_player())
        if lethalbind:get_bool() then
--            if localp:is_alive() ~= true then return end
            entities.for_each_player(function(player)
               if player:is_valid() and player:is_enemy() then
                  local x1, y1, x2, y2 = player:get_bbox()
                    local hp = player:get_prop("m_iHealth")
--                  if weapon == "scout" and hp <= 92 then
                  if hp <= 92 then
                      render.text(espfont, x2 + 4, y1 - 8, "LETHAL", render.color(255, 155,155, 255))
 --                     render.esp_flag("LETHAL", render.color(255, 155,155, 255))
                  end
              end
        end)
    end
end


function indhandle()
    local is_rage = gui.get_config_item("Rage>Aimbot>Aimbot>Aimbot")
    local is_dt = gui.get_config_item("Rage>Aimbot>Aimbot>Double Tap")
    local is_ax = gui.get_config_item("Rage>Aimbot>Aimbot>Anti-exploit")
    local is_sf = gui.get_config_item("Rage>Aimbot>Aimbot>Force extra safety")
    local is_fd = gui.get_config_item("Misc>Movement>Fake duck")
    local is_da = gui.get_config_item("Rage>Aimbot>Aimbot>Target dormant")
    local is_onshot = gui.get_config_item("Rage>Aimbot>Aimbot>Hide shot")
    local is_dmg = gui.get_config_item("Rage>Aimbot>ssg08>Scout>Override")
    local is_fs = gui.get_config_item("Rage>Anti-Aim>Angles>Freestand")
    local is_rr = gui.get_config_item("Rage>Aimbot>Aimbot>Resolver Mode")
    local is_fake = gui.get_config_item("Rage>Anti-Aim>Desync>Fake")
    local is_ap = gui.get_config_item("Misc>Movement>Peek assist")
    local screen_width, screen_height = render.get_screen_size()
local y = screen_height / 2
    local y = render.get_screen_size() / 2 -100
    local sp = 1
   
   
    if  engine.is_in_game() then
    if skeetind:get_bool() and engine.is_in_game() then
     
   
   
     
    
      if is_dt:get_bool() and info.fatality.can_fastfire then
       render.text(calibri, 10, y + 20 * sp, "DT", render.color(208, 206, 205, 255))
       if is_ax:get_bool()  then
         render.text(calibri, 50, y + 20 * sp, "AX", render.color(170, 170, 170, 255))
       end
       sp = sp + 1
       else if is_dt:get_bool()  and not info.fatality.can_fastfire then
       render.text(calibri, 10, y + 20 * sp, "DT", render.color(208, 7, 21, 255))
       sp = sp + 1
       end
       end
   
      if is_fd:get_bool()  then
       render.text(calibri, 10, y + 20 * sp, "DUCK", render.color(208, 206, 205, 255))
       sp = sp + 1
      end
   
      if not is_dt:get_bool() and not is_onshot:get_bool()  and input.is_key_down(0x20) then
       render.text(calibri, 10, y + 20 * sp, "LC", render.color(132, 195, 16, 255))
       sp = sp + 1
      end
   
      if is_onshot:get_bool()  and not is_fd:get_bool() then
       render.text(calibri, 10, y + 20 * sp, "ONSHOT", render.color(132, 195, 16, 255))
       sp = sp + 1
      end
   
      
      if is_dmg:get_bool()  then
       render.text(calibri, 10, y + 20 * sp, "DMG", render.color(255, 255, 255, 255))
       sp = sp + 1
      end
   
      if is_sf:get_bool() then
       render.text(calibri, 10, y + 20 * sp, "SAFE", render.color(132, 195, 16, 255))
       sp = sp + 1
      end
     
      if is_da:get_bool() then
       render.text(calibri, 10, y + 20 * sp, "DA", render.color(132, 195, 16, 255))
       sp = sp + 1
      end
   
      if not is_rr:get_bool() then
       render.text(calibri, 10, y + 20 * sp, "Roll Resolver", render.color(255, 255, 16, 255))
       sp = sp + 1
      end
   
      if is_fs:get_bool()  then
       render.text(calibri, 10, y + 20 * sp, "FREESTAND", render.color(208, 206, 205, 255))
       sp = sp + 1
      end
   
      if is_ap:get_bool()  then
       render.text(calibri, 10, y + 20 * sp, "AP", render.color(132, 195, 16, 255))
       sp = sp + 1
      end
      
      local fakepercent = gui.get_config_item("Rage>Anti-Aim>Desync>Fake Amount"):get_int()
      local circlepercent = fakepercent * -1
      if fakepercent <= 0 then
       local circlepercent = fakepercent * -1
      else
       local circlepercent = fakepercent
      end
      local circlevalue = utils.random_int(circlepercent - 15, circlepercent + 15) /100
      if circlevalue > 1.1 then
       circlevalue = 1
      else if circlevalue < 0 then
       circlevalue = circlevalue * -1
      end
      end
      
   
      if is_fake:get_bool() then
       render.text(calibri, 10, y + 20 * sp, "FAKE", render.color(132, 195, 16, 255))
       render.circle(70, y + 9.5 + 20 * sp, 5, render.color(0, 0, 0, 0), 3, 22, 1, 1)
       render.circle(70, y + 9.5 + 20 * sp, 5, render.color(132, 195, 16, 255), 3, 12, circlevalue, 0)
       sp = sp + 1
       --print(circlevalue)
      end
   
      if not is_dt:get_bool() and not is_onshot:get_bool() then
       render.text(calibri, 10, y + 20 * sp, "FAKELAG", render.color(132, 195, 16, 255))
       sp = sp + 1
      end
    end
   end
   end






function wfdtr()
    local af = gui.get_config_item("rage>aimbot>aimbot>autofire")
    if rage.wfdtr:get_bool() == true and dt and info.fatality.can_fastfire == true then
        af:set_int(1)
        if rage.wfdtr:get_bool() == true and dt == true and info.fatality.can_fastfire == false then
            af:set_int(0)
            if rage.wfdtr:get_bool() == false and dt == true or false and info.fatality.can_fastfire == true or false then
                af:set_int(1)
                af:set_int(af:get_int())
                if rage.wfdtr:get_bool() == true and dt == false and info.fatality.can_fastfire == true then
                    af:set_int(1)
            end
        end
    end
end
end

function manual()
    local add = gui.get_config_item("rage>anti-aim>angles>add")
    local yawadd = gui.get_config_item("rage>anti-aim>angles>yaw add")
    if aa.manualb:get_bool() then
        yawadd:set_int(1)
        add:set_int(0)
    end
    if aa.manuall:get_bool() then
        yawadd:set_int(1)
        add:set_int(-90)
    end
    if aa.manualr:get_bool() then
        yawadd:set_int(1)
        add:set_int(90)
    end
    if aa.manualf:get_bool() then
        yawadd:set_int(1)
        add:set_int(180)
    end
    if not aa.manualb:get_bool() and not aa.manuall:get_bool() and not aa.manualr:get_bool() and not aa.manualf:get_bool() then
        yawadd:set_int(yawadd:get_int())
        add:set_int(add:get_int())
    end
end


-- dt teleport
function dttp()
    if rage.dtttp:get_bool() == true then
        local timer1 = utils.new_timer(55, function()
        dt:set_int(1)
    end)
    local timer2 = utils.new_timer(60, function()
        dt:set_int(0)
    end)
    timer1:run_once() 
       timer2:run_once()
 if rage.dtttp:get_bool() == false then
    dt:set_int(dt:get_int())
end
end
end

--pitch up exp
function pitchupexp()
    local pitch = gui.get_config_item("rage>anti-aim>angles>pitch")
    if aa.puexp:get_bool() == true then
        local timer1 = utils.new_timer(8, function()
        pitch:set_int(1)
    end)
    local timer2 = utils.new_timer(500, function()
        pitch:set_int(2)
    end)
    timer1:run_once() 
       timer2:run_once()
 if aa.puexp:get_bool() == false then
    pitch:set_int(pitch:get_int())
end
end
end

function pitchupexp1()
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    local spinrange = gui.get_config_item("rage>anti-aim>angles>spin range")
    local spinspeed = gui.get_config_item("rage>anti-aim>angles>spin speed")
    local pitch = gui.get_config_item("rage>anti-aim>angles>pitch")
        local yaw = gui.get_config_item("rage>anti-aim>angles>yaw")
        local att = gui.get_config_item("rage>anti-aim>angles>at fov target")
    if aa.puexp1:get_bool() == true then
        local timer1 = utils.new_timer(50, function()
        yaw:set_int(1)
        pitch:set_int(1)
        att:set_int(1)

    end)
    local timer2 = utils.new_timer(65, function()
        yaw:set_int(0)
        pitch:set_int(2)
        att:set_int(0)

    end)
    local timer3 = utils.new_timer(100, function()
        yaw:set_int(0)
        pitch:set_int(3)
        att:set_int(0)

    end)
    timer1:run_once() 
       timer2:run_once()
       timer3:run_once()
else if ap then 
    yaw:set_int(1)
    pitch:set_int(1)
    att:set_int(1)
else
 if aa.puexp1:get_bool() == false then
    pitch:set_int(pitch:get_int())
    yaw:set_int(yaw:get_int())
    att:set_int(att:get_int())
end
end
end
end

function aapre()
    local fl = gui.get_config_item("Rage>Anti-Aim>Fakelag>Limit")
    local pitch = gui.get_config_item("rage>anti-aim>angles>pitch")
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    local spinrange = gui.get_config_item("rage>anti-aim>angles>spin range")
    local spinspeed = gui.get_config_item("rage>anti-aim>angles>spin speed")
    local rollex = gui.get_config_item("rage>anti-aim>desync>roll lean")
    local roll = gui.get_config_item("rage>Anti-Aim>Desync>Lean Amount")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    local jitterrange = gui.get_config_item("rage>anti-aim>angles>jitter range")
    local faketoggle = gui.get_config_item("rage>anti-aim>desync>fake")
    local fakeamount = gui.get_config_item("rage>anti-aim>desync>fake amount")
    local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
    local fsfake = gui.get_config_item("rage>anti-aim>desync>freestand fake")
    local fakejitter = gui.get_config_item("rage>anti-aim>desync>flip fake with jitter")
    local slide = gui.get_config_item("misc>movement>slide")
   local fd = gui.get_config_item("misc>movement>fake duck"):get_bool()
    local ap = gui.get_config_item("misc>movement>peek assist"):get_bool()
    if engine.is_in_game() == false then return end
    if aa.preset:get_bool() == false then return end
    if aa.preset:get_bool() == true then
        if aa.presets:get_int() == 0  then
            fl:set_int(fl:get_int())
        local slowwalk = slide:get_bool()
        local lplr = entities.get_entity(engine.get_local_player())
        local flag = lplr:get_prop("m_fFlags")
        local air = lplr:get_prop("m_hGroundEntity") == -1
        local air2 = input.is_key_down(0x20)
        local velocity_x = math.floor(lplr:get_prop("m_vecVelocity[0]"))
        local velocity_y = math.floor(lplr:get_prop("m_vecVelocity[1]"))
        local speed = math.sqrt(velocity_x ^ 2 + velocity_y ^ 2)
        local crouch = input.is_key_down(0x11)
        local lp = entities.get_entity(engine.get_local_player())
        local scoped = lp:get_prop("m_bIsScoped") 

        if slowwalk and not air and flag ~= 263 then --sw
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(32)
            faketoggle:set_int(1)
            fakeamount:set_int(-59)
            compangle:set_int(36)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        
        else if speed > 4 and not air and not crouch then --moving
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(44)
            faketoggle:set_int(1)
            fakeamount:set_int(80)
            compangle:set_int(85)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if speed <= 4 and flag == 257 then --standing
            pitch:set_int(1)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(90)
            compangle:set_int(97)
            rollex:set_int(0)
            spintoggle:set_int(1)
            spinrange:set_int(50)
            spinspeed:set_int(28)
            else
         if flag == 262 then -- C + A
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(26)
            faketoggle:set_int(1)
            fakeamount:set_int(39)
            compangle:set_int(46)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if crouch then
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(-59)
            faketoggle:set_int(1)
            fakeamount:set_int(100)
            compangle:set_int(87)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if air and flag ~= 262 then --air
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(44)
            faketoggle:set_int(1)
            fakeamount:set_int(66)
            compangle:set_int(77)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if fd then --fakeduck
            pitch:set_int(1)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(100)
            compangle:set_int(-1)
            rollex:set_int(5)
            roll:set_int(127000)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
         end
     
end
end
end
end
end
end
end
end
end



function aapre1()
    local fl = gui.get_config_item("Rage>Anti-Aim>Fakelag>Limit")
    local pitch = gui.get_config_item("rage>anti-aim>angles>pitch")
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    local spinrange = gui.get_config_item("rage>anti-aim>angles>spin range")
    local spinspeed = gui.get_config_item("rage>anti-aim>angles>spin speed")
    local rollex = gui.get_config_item("rage>anti-aim>desync>roll lean")
    local roll = gui.get_config_item("rage>Anti-Aim>Desync>Lean Amount")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    local jitterrange = gui.get_config_item("rage>anti-aim>angles>jitter range")
    local faketoggle = gui.get_config_item("rage>anti-aim>desync>fake")
    local fakeamount = gui.get_config_item("rage>anti-aim>desync>fake amount")
    local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
    local fsfake = gui.get_config_item("rage>anti-aim>desync>freestand fake")
    local fakejitter = gui.get_config_item("rage>anti-aim>desync>flip fake with jitter")
    local slide = gui.get_config_item("misc>movement>slide")
   local fd = gui.get_config_item("misc>movement>fake duck"):get_bool()
    local ap = gui.get_config_item("misc>movement>peek assist"):get_bool()
    fl:set_int(fl:get_int())
    if engine.is_in_game() == false then return end
    if aa.preset:get_bool() == false then return end
    if aa.preset:get_bool() == true then
        if aa.presets:get_int() == 1  then
        local slowwalk = slide:get_bool()
        local lplr = entities.get_entity(engine.get_local_player())
        local flag = lplr:get_prop("m_fFlags")
        local air = lplr:get_prop("m_hGroundEntity") == -1
        local air2 = input.is_key_down(0x20)
        local velocity_x = math.floor(lplr:get_prop("m_vecVelocity[0]"))
        local velocity_y = math.floor(lplr:get_prop("m_vecVelocity[1]"))
        local speed = math.sqrt(velocity_x ^ 2 + velocity_y ^ 2)
        local crouch = input.is_key_down(0x11)
        local lp = entities.get_entity(engine.get_local_player())
        local scoped = lp:get_prop("m_bIsScoped") 
            if slowwalk and not air and flag ~= 263 then --sw
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(25)
                faketoggle:set_int(1)
                fakeamount:set_int(95)
                compangle:set_int(100)
                rollex:set_int(0)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
            
            else if speed > 4 and not air and not crouch then --moving
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(66)
                faketoggle:set_int(1)
                fakeamount:set_int(96)
                compangle:set_int(100)
                rollex:set_int(0)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
            else
             if speed <= 4 and flag == 257 then --standing
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(41)
                faketoggle:set_int(1)
                fakeamount:set_int(106)
                compangle:set_int(100)
                rollex:set_int(0)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
                else
             if flag == 262 then
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(-39)
                faketoggle:set_int(1)
                fakeamount:set_int(95)
                compangle:set_int(100)
                rollex:set_int(0)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
            else
             if crouch then -- crouch
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(52)
                faketoggle:set_int(1)
                fakeamount:set_int(99)
                compangle:set_int(100)
                rollex:set_int(0)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
            else
             if air and flag ~= 262 then --air
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(-23)
                faketoggle:set_int(1)
                fakeamount:set_int(97)
                compangle:set_int(100)
                rollex:set_int(0)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
            else
             if fd then --fakeduck
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(30)
                faketoggle:set_int(1)
                fakeamount:set_int(109)
                compangle:set_int(100)
                rollex:set_int(0)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
             end
  
end
end
end
end
end
end
end
end
end


function aapre2()
    local ensure = gui.get_config_item("rage>anti-aim>desync>ensure lean")
    local fl = gui.get_config_item("Rage>Anti-Aim>Fakelag>Limit")
    local pitch = gui.get_config_item("rage>anti-aim>angles>pitch")
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    local spinrange = gui.get_config_item("rage>anti-aim>angles>spin range")
    local spinspeed = gui.get_config_item("rage>anti-aim>angles>spin speed")
    local rollex = gui.get_config_item("rage>anti-aim>desync>roll lean")
    local roll = gui.get_config_item("rage>Anti-Aim>Desync>Lean Amount")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    local jitterrange = gui.get_config_item("rage>anti-aim>angles>jitter range")
    local faketoggle = gui.get_config_item("rage>anti-aim>desync>fake")
    local fakeamount = gui.get_config_item("rage>anti-aim>desync>fake amount")
    local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
    local fsfake = gui.get_config_item("rage>anti-aim>desync>freestand fake")
    local fakejitter = gui.get_config_item("rage>anti-aim>desync>flip fake with jitter")
    local slide = gui.get_config_item("misc>movement>slide")
   local fd = gui.get_config_item("misc>movement>fake duck"):get_bool()
    local ap = gui.get_config_item("misc>movement>peek assist"):get_bool()
    if engine.is_in_game() == false then return end
    if aa.preset:get_bool() == false then return end
    if aa.preset:get_bool() == true then
        if aa.presets:get_int() == 2  then
        local slowwalk = slide:get_bool()
        local lplr = entities.get_entity(engine.get_local_player())
        local flag = lplr:get_prop("m_fFlags")
        local air = lplr:get_prop("m_hGroundEntity") == -1
        local air2 = input.is_key_down(0x20)
        local velocity_x = math.floor(lplr:get_prop("m_vecVelocity[0]"))
        local velocity_y = math.floor(lplr:get_prop("m_vecVelocity[1]"))
        local speed = math.sqrt(velocity_x ^ 2 + velocity_y ^ 2)
        local crouch = input.is_key_down(0x11)
        local lp = entities.get_entity(engine.get_local_player())
        local scoped = lp:get_prop("m_bIsScoped") 
        fl:set_int(fl:get_int())
                    if slowwalk and not air and flag ~= 263 then --sw
                        pitch:set_int(1)
                        jittertoggle:set_int(0)
                        jitterrange:set_int(0)
                        faketoggle:set_int(1)
                        fakeamount:set_int(-135)
                        compangle:set_int(189)
                        rollex:set_int(2)
                        roll:set_int(127000)
                        spintoggle:set_int(0)
                        spinrange:set_int(0)
                        spinspeed:set_int(0)
                        ensure:set_int(1)
                        
                    
                    else if speed > 4 and not air and not crouch then --moving
                        pitch:set_int(1)
                        jittertoggle:set_int(0)
                        jitterrange:set_int(0)
                        faketoggle:set_int(1)
                        fakeamount:set_int(-120)
                        compangle:set_int(189)
                        rollex:set_int(2)
                        roll:set_int(127000)
                        spintoggle:set_int(0)
                        spinrange:set_int(0)
                        spinspeed:set_int(0)
                        ensure:set_int(1)
                    else
                     if speed <= 4 and flag == 257 then --standing
                        pitch:set_int(1)
                        jittertoggle:set_int(0)
                        jitterrange:set_int(0)
                        faketoggle:set_int(1)
                        fakeamount:set_int(-141)
                        compangle:set_int(176)
                        rollex:set_int(2)
                        roll:set_int(127000)
                        spintoggle:set_int(0)
                        spinrange:set_int(0)
                        spinspeed:set_int(0)
                        ensure:set_int(1)
                        else
                     if flag == 262 then -- crouch + air
                        jittertoggle:set_int(0)
                        jitterrange:set_int(0)
                        spintoggle:set_int(0)
                        spinrange:set_int(0)
                        spinspeed:set_int(0)
                        pitch:set_int(1)
                        faketoggle:set_int(1)
                        fakeamount:set_int(95)
                        compangle:set_int(100)
                        rollex:set_int(0)
                        roll:set_int(0)
                        ensure:set_int(1)
                    else
                     if crouch then -- crouch
                        pitch:set_int(1)
                        jittertoggle:set_int(0)
                        jitterrange:set_int(0)
                        faketoggle:set_int(1)
                        fakeamount:set_int(-135)
                        compangle:set_int(189)
                        rollex:set_int(2)
                        roll:set_int(127000)
                        spintoggle:set_int(0)
                        spinrange:set_int(0)
                        spinspeed:set_int(0)
                        ensure:set_int(1)
                    else
                     if air and flag ~= 262 then --air
                        pitch:set_int(1)
                        jittertoggle:set_int(0)
                        jitterrange:set_int(0)
                        faketoggle:set_int(1)
                        fakeamount:set_int(97)
                        compangle:set_int(100)
                        rollex:set_int(1)
                        roll:set_int(0)
                        spintoggle:set_int(0)
                        spinrange:set_int(0)
                        spinspeed:set_int(0)
                    else

                     if fd then --fakeduck
                        pitch:set_int(1)
                        jittertoggle:set_int(0)
                        jitterrange:set_int(0)
                        faketoggle:set_int(1)
                        fakeamount:set_int(-135)
                        compangle:set_int(189)
                        rollex:set_int(2)
                        roll:set_int(127000)
                        spintoggle:set_int(0)
                        spinrange:set_int(0)
                        spinspeed:set_int(0)
                        ensure:set_int(1)
                    end
end
end
end
end
end
end
end
end
end

function aapre3()
    local att = gui.get_config_item("rage>anti-aim>angles>at fov target")
    local fl = gui.get_config_item("Rage>Anti-Aim>Fakelag>Limit")
    local pitch = gui.get_config_item("rage>anti-aim>angles>pitch")
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    local spinrange = gui.get_config_item("rage>anti-aim>angles>spin range")
    local spinspeed = gui.get_config_item("rage>anti-aim>angles>spin speed")
    local rollex = gui.get_config_item("rage>anti-aim>desync>roll lean")
    local roll = gui.get_config_item("rage>Anti-Aim>Desync>Lean Amount")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    local jitterrange = gui.get_config_item("rage>anti-aim>angles>jitter range")
    local faketoggle = gui.get_config_item("rage>anti-aim>desync>fake")
    local fakeamount = gui.get_config_item("rage>anti-aim>desync>fake amount")
    local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
    local fsfake = gui.get_config_item("rage>anti-aim>desync>freestand fake")
    local fakejitter = gui.get_config_item("rage>anti-aim>desync>flip fake with jitter")
    local slide = gui.get_config_item("misc>movement>slide")
   local fd = gui.get_config_item("misc>movement>fake duck"):get_bool()
    local ap = gui.get_config_item("misc>movement>peek assist"):get_bool()
    if engine.is_in_game() == false then return end
    if aa.preset:get_bool() == false then return end
    if aa.preset:get_bool() == true then
        if aa.presets:get_int() == 3  then
        local slowwalk = slide:get_bool()
        local lplr = entities.get_entity(engine.get_local_player())
        local flag = lplr:get_prop("m_fFlags")
        local air = lplr:get_prop("m_hGroundEntity") == -1
        local air2 = input.is_key_down(0x20)
        local velocity_x = math.floor(lplr:get_prop("m_vecVelocity[0]"))
        local velocity_y = math.floor(lplr:get_prop("m_vecVelocity[1]"))
        local speed = math.sqrt(velocity_x ^ 2 + velocity_y ^ 2)
        local crouch = input.is_key_down(0x11)
        local lp = entities.get_entity(engine.get_local_player())
        fl:set_int(fl:get_int())
            if slowwalk and not air and flag ~= 263 then --sw
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(45)
                faketoggle:set_int(1)
                fakeamount:set_int(98)
                compangle:set_int(100)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
                rollex:set_int(0)
                roll:set_int(0)
                att:set_int(1)
            
            else if speed > 4 and not air and not crouch then --moving
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(66)
                faketoggle:set_int(1)
                fakeamount:set_int(96)
                compangle:set_int(100)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
                rollex:set_int(0)
                roll:set_int(0)
                att:set_int(1)
            else
             if speed <= 4 and flag == 257 then --standing
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(44)
                faketoggle:set_int(1)
                fakeamount:set_int(98)
                compangle:set_int(100)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
                rollex:set_int(0)
                roll:set_int(0)
                att:set_int(1)
                else
             if flag == 262 then -- crouch + air
                jittertoggle:set_int(0)
                jitterrange:set_int(0)
                spintoggle:set_int(1)
                spinrange:set_int(360)
                spinspeed:set_int(-450)
                pitch:set_int(3)
                faketoggle:set_int(1)
                fakeamount:set_int(95)
                compangle:set_int(100)
                rollex:set_int(0)
                roll:set_int(0)
                att:set_int(1)
            else
             if crouch then -- crouch
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(50)
                faketoggle:set_int(1)
                fakeamount:set_int(97)
                compangle:set_int(100)
                rollex:set_int(0)
                roll:set_int(0)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
                att:set_int(1)
            else
             if air and flag ~= 262 then --air
                jittertoggle:set_int(0)
                jitterrange:set_int(0)
                spintoggle:set_int(1)
                spinrange:set_int(360)
                spinspeed:set_int(-450)
                pitch:set_int(1)
                faketoggle:set_int(1)
                fakeamount:set_int(95)
                compangle:set_int(100)
                rollex:set_int(0)
                roll:set_int(0)
                att:set_int(1)
             else
             if fd then --fakeduck
                pitch:set_int(1)
                jittertoggle:set_int(0)
                jitterrange:set_int(0)
                faketoggle:set_int(1)
                fakeamount:set_int(99)
                compangle:set_int(100)
                rollex:set_int(1)
                roll:set_int(127000)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
                att:set_int(1)
            end
end
end
end
end
end
end
end
end
end



function aapre4()
    local fl = gui.get_config_item("Rage>Anti-Aim>Fakelag>Limit")
    local pitch = gui.get_config_item("rage>anti-aim>angles>pitch")
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    local spinrange = gui.get_config_item("rage>anti-aim>angles>spin range")
    local spinspeed = gui.get_config_item("rage>anti-aim>angles>spin speed")
    local rollex = gui.get_config_item("rage>anti-aim>desync>roll lean")
    local roll = gui.get_config_item("rage>Anti-Aim>Desync>Lean Amount")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    local jitterrange = gui.get_config_item("rage>anti-aim>angles>jitter range")
    local faketoggle = gui.get_config_item("rage>anti-aim>desync>fake")
    local fakeamount = gui.get_config_item("rage>anti-aim>desync>fake amount")
    local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
    local fsfake = gui.get_config_item("rage>anti-aim>desync>freestand fake")
    local fakejitter = gui.get_config_item("rage>anti-aim>desync>flip fake with jitter")
    local slide = gui.get_config_item("misc>movement>slide")
   local fd = gui.get_config_item("misc>movement>fake duck"):get_bool()
    local ap = gui.get_config_item("misc>movement>peek assist"):get_bool()
    if engine.is_in_game() == false then return end
    if aa.preset:get_bool() == false then return end
    if aa.preset:get_bool() == true then
        if aa.presets:get_int() == 4  then
        local slowwalk = slide:get_bool()
        local lplr = entities.get_entity(engine.get_local_player())
        local flag = lplr:get_prop("m_fFlags")
        local air = lplr:get_prop("m_hGroundEntity") == -1
        local air2 = input.is_key_down(0x20)
        local velocity_x = math.floor(lplr:get_prop("m_vecVelocity[0]"))
        local velocity_y = math.floor(lplr:get_prop("m_vecVelocity[1]"))
        local speed = math.sqrt(velocity_x ^ 2 + velocity_y ^ 2)
        local crouch = input.is_key_down(0x11)
        local lp = entities.get_entity(engine.get_local_player())
        local scoped = lp:get_prop("m_bIsScoped") 
            if slowwalk and not air and flag ~= 263 then --sw
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(45)
                faketoggle:set_int(1)
                fakeamount:set_int(95)
                compangle:set_int(100)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
                rollex:set_int(0)
                roll:set_int(0)
                fl:set_int(-1)
            
            else if speed > 4 and not air and not crouch then --moving
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(66)
                faketoggle:set_int(1)
                fakeamount:set_int(96)
                compangle:set_int(100)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
                rollex:set_int(0)
                roll:set_int(0)
                fl:set_int(-1)
            else
             if speed <= 4 and flag == 257 then --standing
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(44)
                faketoggle:set_int(1)
                fakeamount:set_int(98)
                compangle:set_int(100)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
                rollex:set_int(0)
                roll:set_int(0)
                fl:set_int(-1)
                else
             if flag == 262 then -- crouch + air
                jittertoggle:set_int(0)
                jitterrange:set_int(0)
                spintoggle:set_int(1)
                spinrange:set_int(360)
                spinspeed:set_int(500)
                pitch:set_int(1)
                faketoggle:set_int(1)
                fakeamount:set_int(95)
                compangle:set_int(100)
                rollex:set_int(0)
                roll:set_int(0)
                fl:set_int(-1)
            else
             if crouch then -- crouch
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(50)
                faketoggle:set_int(1)
                fakeamount:set_int(97)
                compangle:set_int(100)
                rollex:set_int(0)
                roll:set_int(0)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
                fl:set_int(-1)
            else
             if air and flag ~= 262 then --air
                pitch:set_int(1)
                jittertoggle:set_int(1)
                jitterrange:set_int(-20)
                faketoggle:set_int(1)
                fakeamount:set_int(97)
                compangle:set_int(100)
                rollex:set_int(0)
                roll:set_int(0)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
                fl:set_int(-1)
            else
             if fd then --fakeduck
                pitch:set_int(1)
                jittertoggle:set_int(0)
                jitterrange:set_int(0)
                faketoggle:set_int(1)
                fakeamount:set_int(109)
                compangle:set_int(100)
                rollex:set_int(1)
                roll:set_int(127000)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
                fl:set_int(-30)
            end
end
end
end
end
end
end
end
end
end

function fsf()
   local fsfl = gui.get_config_item("rage>anti-aim>desync>freestand fake")
    if aa.fix:get_bool() then
        fsfl:set_int(2)
    else
        fsfl:set_int(0)
    end
end


















function aapre5()
    local fl = gui.get_config_item("Rage>Anti-Aim>Fakelag>Limit")
    local pitch = gui.get_config_item("rage>anti-aim>angles>pitch")
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    local spinrange = gui.get_config_item("rage>anti-aim>angles>spin range")
    local spinspeed = gui.get_config_item("rage>anti-aim>angles>spin speed")
    local rollex = gui.get_config_item("rage>anti-aim>desync>roll lean")
    local roll = gui.get_config_item("rage>Anti-Aim>Desync>Lean Amount")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    local jitterrange = gui.get_config_item("rage>anti-aim>angles>jitter range")
    local faketoggle = gui.get_config_item("rage>anti-aim>desync>fake")
    local fakeamount = gui.get_config_item("rage>anti-aim>desync>fake amount")
    local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
    local fsfake = gui.get_config_item("rage>anti-aim>desync>freestand fake")
    local fakejitter = gui.get_config_item("rage>anti-aim>desync>flip fake with jitter")
    local slide = gui.get_config_item("misc>movement>slide")
   local fd = gui.get_config_item("misc>movement>fake duck"):get_bool()
    local ap = gui.get_config_item("misc>movement>peek assist"):get_bool()
    if engine.is_in_game() == false then return end
    if aa.preset:get_bool() == false then return end
    if aa.preset:get_bool() == true then
        if aa.presets:get_int() == 5  then
            fl:set_int(fl:get_int())
        local slowwalk = slide:get_bool()
        local lplr = entities.get_entity(engine.get_local_player())
        local flag = lplr:get_prop("m_fFlags")
        local air = lplr:get_prop("m_hGroundEntity") == -1
        local air2 = input.is_key_down(0x20)
        local velocity_x = math.floor(lplr:get_prop("m_vecVelocity[0]"))
        local velocity_y = math.floor(lplr:get_prop("m_vecVelocity[1]"))
        local speed = math.sqrt(velocity_x ^ 2 + velocity_y ^ 2)
        local crouch = input.is_key_down(0x11)
        local lp = entities.get_entity(engine.get_local_player())
        local scoped = lp:get_prop("m_bIsScoped") 

          if slowwalk and not air and flag ~= 263 then --sw
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(36)
            faketoggle:set_int(1)
            fakeamount:set_int(80)
            compangle:set_int(100)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        
        else if speed > 4 and not air and not crouch then --moving
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(36)
            faketoggle:set_int(1)
            fakeamount:set_int(80)
            compangle:set_int(100)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if speed <= 4 and flag == 257 then --standing
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(15)
            faketoggle:set_int(1)
            fakeamount:set_int(75)
            compangle:set_int(100)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
            else
         if flag == 262 then -- C + A
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(21)
            faketoggle:set_int(1)
            fakeamount:set_int(100)
            compangle:set_int(72)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if crouch then
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(24)
            faketoggle:set_int(1)
            fakeamount:set_int(100)
            compangle:set_int(72)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if air and flag ~= 262 then --air
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(15)
            faketoggle:set_int(1)
            fakeamount:set_int(41)
            compangle:set_int(64)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if ap then --auto peek
            pitch:set_int(1)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(95)
            compangle:set_int(100)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if fd then --fakeduck
            pitch:set_int(1)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(109)
            compangle:set_int(100)
            rollex:set_int(2)
            roll:set_int(127000)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
         end
     
end
end
end
end
end
end
end
end
end
end


function aapre6()
    local fl = gui.get_config_item("Rage>Anti-Aim>Fakelag>Limit")
    local pitch = gui.get_config_item("rage>anti-aim>angles>pitch")
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    local spinrange = gui.get_config_item("rage>anti-aim>angles>spin range")
    local spinspeed = gui.get_config_item("rage>anti-aim>angles>spin speed")
    local rollex = gui.get_config_item("rage>anti-aim>desync>roll lean")
    local roll = gui.get_config_item("rage>Anti-Aim>Desync>Lean Amount")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    local jitterrange = gui.get_config_item("rage>anti-aim>angles>jitter range")
    local faketoggle = gui.get_config_item("rage>anti-aim>desync>fake")
    local fakeamount = gui.get_config_item("rage>anti-aim>desync>fake amount")
    local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
    local fsfake = gui.get_config_item("rage>anti-aim>desync>freestand fake")
    local fakejitter = gui.get_config_item("rage>anti-aim>desync>flip fake with jitter")
    local slide = gui.get_config_item("misc>movement>slide")
   local fd = gui.get_config_item("misc>movement>fake duck"):get_bool()
    local ap = gui.get_config_item("misc>movement>peek assist"):get_bool()
    if engine.is_in_game() == false then return end
    if aa.preset:get_bool() == false then return end
    if aa.preset:get_bool() == true then
        if aa.presets:get_int() == 6  then
            fl:set_int(fl:get_int())
        local slowwalk = slide:get_bool()
        local lplr = entities.get_entity(engine.get_local_player())
        local flag = lplr:get_prop("m_fFlags")
        local air = lplr:get_prop("m_hGroundEntity") == -1
        local air2 = input.is_key_down(0x20)
        local velocity_x = math.floor(lplr:get_prop("m_vecVelocity[0]"))
        local velocity_y = math.floor(lplr:get_prop("m_vecVelocity[1]"))
        local speed = math.sqrt(velocity_x ^ 2 + velocity_y ^ 2)
        local crouch = input.is_key_down(0x11)
        local lp = entities.get_entity(engine.get_local_player())
        local scoped = lp:get_prop("m_bIsScoped") 

          if slowwalk and not air and flag ~= 263 then --sw
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(13)
            faketoggle:set_int(1)
            fakeamount:set_int(65)
            compangle:set_int(83)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        
        else if speed > 4 and not air and not crouch then --moving
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(13)
            faketoggle:set_int(1)
            fakeamount:set_int(65)
            compangle:set_int(83)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if speed <= 4 and flag == 257 then --standing
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(6)
            faketoggle:set_int(1)
            fakeamount:set_int(100)
            compangle:set_int(65)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
            else
         if flag == 262 then -- C + A
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(8)
            faketoggle:set_int(1)
            fakeamount:set_int(53)
            compangle:set_int(78)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if crouch then
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(8)
            faketoggle:set_int(1)
            fakeamount:set_int(53)
            compangle:set_int(78)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if air and flag ~= 262 then --air
            pitch:set_int(1)
            jittertoggle:set_int(1)
            jitterrange:set_int(20)
            faketoggle:set_int(1)
            fakeamount:set_int(85)
            compangle:set_int(34)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if fd then --fakeduck
            pitch:set_int(1)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(109)
            compangle:set_int(100)
            rollex:set_int(2)
            roll:set_int(127000)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
         end
         if rage.idealtick:get_bool() and ap and rage.fss:get_bool() then
            pitch:set_int(1)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(65)
            compangle:set_int(83)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
         else
            if rage.idealtick:get_bool() and ap and rage.fss:get_bool() and rage.idp0:get_bool() then
                pitch:set_int(2)
                jittertoggle:set_int(0)
                jitterrange:set_int(0)
                faketoggle:set_int(1)
                fakeamount:set_int(65)
                compangle:set_int(83)
                rollex:set_int(0)
                spintoggle:set_int(0)
                spinrange:set_int(0)
                spinspeed:set_int(0)
            end
            
     
end
end
end
end
end
end
end
end
end
end


function aapre7()
    local fl = gui.get_config_item("Rage>Anti-Aim>Fakelag>Limit")
    local pitch = gui.get_config_item("rage>anti-aim>angles>pitch")
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    local spinrange = gui.get_config_item("rage>anti-aim>angles>spin range")
    local spinspeed = gui.get_config_item("rage>anti-aim>angles>spin speed")
    local rollex = gui.get_config_item("rage>anti-aim>desync>roll lean")
    local roll = gui.get_config_item("rage>Anti-Aim>Desync>Lean Amount")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    local jitterrange = gui.get_config_item("rage>anti-aim>angles>jitter range")
    local faketoggle = gui.get_config_item("rage>anti-aim>desync>fake")
    local fakeamount = gui.get_config_item("rage>anti-aim>desync>fake amount")
    local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
    local fsfake = gui.get_config_item("rage>anti-aim>desync>freestand fake")
    local fakejitter = gui.get_config_item("rage>anti-aim>desync>flip fake with jitter")
    local slide = gui.get_config_item("misc>movement>slide")
    local yaw = gui.get_config_item("rage>anti-aim>angles>yaw")
   local fd = gui.get_config_item("misc>movement>fake duck"):get_bool()
    local ap = gui.get_config_item("misc>movement>peek assist"):get_bool()
    if engine.is_in_game() == false then return end
    if aa.preset:get_bool() == false then return end
    if aa.preset:get_bool() == true then
        if aa.presets:get_int() == 7  then
            fl:set_int(fl:get_int())
        local slowwalk = slide:get_bool()
        local lplr = entities.get_entity(engine.get_local_player())
        local flag = lplr:get_prop("m_fFlags")
        local air = lplr:get_prop("m_hGroundEntity") == -1
        local air2 = input.is_key_down(0x20)
        local velocity_x = math.floor(lplr:get_prop("m_vecVelocity[0]"))
        local velocity_y = math.floor(lplr:get_prop("m_vecVelocity[1]"))
        local speed = math.sqrt(velocity_x ^ 2 + velocity_y ^ 2)
        local crouch = input.is_key_down(0x11)
        local lp = entities.get_entity(engine.get_local_player())
        local scoped = lp:get_prop("m_bIsScoped") 

          if slowwalk and not air and flag ~= 263 then --sw
            yaw:set_int(0)
            pitch:set_int(0)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(65)
            compangle:set_int(83)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        
        else if speed > 4 and not air and not crouch then --moving
            yaw:set_int(0)
            pitch:set_int(0)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(65)
            compangle:set_int(83)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if speed <= 4 and flag == 257 then --standing
            yaw:set_int(0)
            pitch:set_int(0)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(100)
            compangle:set_int(65)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
            else
         if flag == 262 then -- C + A
            yaw:set_int(0)
            pitch:set_int(0)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(53)
            compangle:set_int(78)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if crouch then
            yaw:set_int(0)
            pitch:set_int(0)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(53)
            compangle:set_int(78)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if air and flag ~= 262 then --air
            yaw:set_int(1)
            pitch:set_int(0)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(85)
            compangle:set_int(34)
            rollex:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if fd then --fakeduck
            yaw:set_int(0)
            pitch:set_int(0)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(109)
            compangle:set_int(100)
            rollex:set_int(2)
            roll:set_int(127000)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
         end
     
end
end
end
end
end
end
end
end
end

function aapre8()
    local fl = gui.get_config_item("Rage>Anti-Aim>Fakelag>Limit")
    local pitch = gui.get_config_item("rage>anti-aim>angles>pitch")
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    local spinrange = gui.get_config_item("rage>anti-aim>angles>spin range")
    local spinspeed = gui.get_config_item("rage>anti-aim>angles>spin speed")
    local rollex = gui.get_config_item("rage>anti-aim>desync>roll lean")
    local roll = gui.get_config_item("rage>Anti-Aim>Desync>Lean Amount")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    local jitterrange = gui.get_config_item("rage>anti-aim>angles>jitter range")
    local faketoggle = gui.get_config_item("rage>anti-aim>desync>fake")
    local fakeamount = gui.get_config_item("rage>anti-aim>desync>fake amount")
    local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
    local fsfake = gui.get_config_item("rage>anti-aim>desync>freestand fake")
    local fakejitter = gui.get_config_item("rage>anti-aim>desync>flip fake with jitter")
    local slide = gui.get_config_item("misc>movement>slide")
    local yaw = gui.get_config_item("rage>anti-aim>angles>yaw")
   local fd = gui.get_config_item("misc>movement>fake duck"):get_bool()
    local ap = gui.get_config_item("misc>movement>peek assist"):get_bool()
    if engine.is_in_game() == false then return end
    if aa.preset:get_bool() == false then return end
    if aa.preset:get_bool() == true then
        if aa.presets:get_int() == 8  then
            fl:set_int(fl:get_int())
        local slowwalk = slide:get_bool()
        local lplr = entities.get_entity(engine.get_local_player())
        local flag = lplr:get_prop("m_fFlags")
        local air = lplr:get_prop("m_hGroundEntity") == -1
        local air2 = input.is_key_down(0x20)
        local velocity_x = math.floor(lplr:get_prop("m_vecVelocity[0]"))
        local velocity_y = math.floor(lplr:get_prop("m_vecVelocity[1]"))
        local speed = math.sqrt(velocity_x ^ 2 + velocity_y ^ 2)
        local crouch = input.is_key_down(0x11)
        local lp = entities.get_entity(engine.get_local_player())
        local scoped = lp:get_prop("m_bIsScoped") 

          if slowwalk and not air and flag ~= 263 then --sw
            yaw:set_int(1)
            pitch:set_int(1)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(0)
            fakeamount:set_int(0)
            compangle:set_int(0)
            rollex:set_int(2)
            roll:set_int(76200)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        
        else if speed > 4 and not air and not crouch then --moving
            yaw:set_int(1)
            pitch:set_int(1)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(97)
            compangle:set_int(100)
            rollex:set_int(0)
            roll:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if speed <= 4 and flag == 257 then --standing
            yaw:set_int(1)
            pitch:set_int(1)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(0)
            fakeamount:set_int(0)
            compangle:set_int(0)
            rollex:set_int(2)
            roll:set_int(76200)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
            else
         if flag == 262 then -- C + A
            yaw:set_int(1)
            pitch:set_int(1)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(97)
            compangle:set_int(100)
            rollex:set_int(0)
            roll:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if crouch then
            yaw:set_int(1)
            pitch:set_int(1)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(0)
            fakeamount:set_int(0)
            compangle:set_int(0)
            rollex:set_int(2)
            roll:set_int(76200)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if air and flag ~= 262 then --air
            yaw:set_int(1)
            pitch:set_int(1)
            yaw:set_int(0)
            pitch:set_int(1)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(1)
            fakeamount:set_int(97)
            compangle:set_int(100)
            rollex:set_int(0)
            roll:set_int(0)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
        else
         if fd then --fakeduck
            yaw:set_int(1)
            pitch:set_int(1)
            jittertoggle:set_int(0)
            jitterrange:set_int(0)
            faketoggle:set_int(0)
            fakeamount:set_int(0)
            compangle:set_int(0)
            rollex:set_int(2)
            roll:set_int(76200)
            spintoggle:set_int(0)
            spinrange:set_int(0)
            spinspeed:set_int(0)
         end
     
end
end
end
end
end
end
end
end
end

--- @region: dependencies
--- @param: pos: vector
--- @param: size: vector
--- @return: boolean
local function is_mouse_in_bounds(pos, size)
    local x, y = pos.x, pos.y
    local w, h = size.x, size.y

    local mouse_position = {input.get_cursor_pos()}

    return ((mouse_position[1] >= x and mouse_position[1] < x + w and mouse_position[2] >= y and mouse_position[2] < y + h) and gui.is_menu_open()) 
end
--- @endregion

--- @region: enumerations
local e_global = {
    SCREEN = {render.get_screen_size()}
}
--- @endregion

--- @region: table
--- @param: tbl: table
--- @return: number
function table.count(tbl)
    if tbl == nil then 
        return 0 
    end

    if #tbl == 0 then 
        local count = 0

        for data in pairs(tbl) do 
            count = count + 1 
        end

        return count 
    end
    return #tbl
end
--- @endregion

--- @region: animation
local animation = {}

animation.data = {}

--- @param: start: any
--- @param: end_pos: any
--- @param: time: number
--- @return: any
function animation.lerp(start, end_pos, time)
    if (type(start) == "table") then
        local color_data = {0, 0, 0, 0}

        for i, color_key in ipairs({"r", "g", "b", "a"}) do
            color_data[i] = animation.lerp(start[color_key], end_pos[color_key], time)
        end

        return render.color(unpack(color_data))
    end

    return (end_pos - start) * (global_vars.frametime * time) + start
end

--- @param: name: string
--- @param: value: any
--- @param: time: number
--- @retrun: any
function animation.new(name, value, time)
    if (animation.data[name] == nil) then
        animation.data[name] = value
    end

    animation.data[name] = animation.lerp(animation.data[name], value, time)

    return animation.data[name]
end
--- @endregion

--- @region: drag
--- @class: c_drag
--- @field: public: x: number
--- @field: public: y: number
--- @field: public: width: number
--- @field: public: height: number
--- @field: public: d_x: number
--- @field: public: d_y: number
--- @field: public: dragging: boolean
--- @field: public: unlocked: boolean
local c_drag = {}
local m_drag = { __index = c_drag }

--- @param: slider_x: MenuItem
--- @param: slider_y: MenuItem
--- @param: x: number
--- @param: y: number
--- @return c_drag
function c_drag.new(slider_x, slider_y, x, y)
    slider_x:set_int(x)
    slider_y:set_int(y)

    return setmetatable({
        x = slider_x,
        y = slider_y,

        d_x = 0,
        d_y = 0,

        dragging = false,
        unlocked = false
    }, m_drag)
end

--- @return void
function c_drag:unlock()
    self.unlocked = true
end

--- @return void
function c_drag:lock()
    self.unlocked = false
end

--- @param: width: number
--- @param: height: number
--- @return: void
function c_drag:handle(width, height)
    self.width = width
    self.height = height

    local screen = e_global.SCREEN
    local mouse_position = {input.get_cursor_pos()}

    if (is_mouse_in_bounds(math.vec3(self.x:get_int(), self.y:get_int()), math.vec3(self.width, self.height))) then
        if (input.is_key_down(0x01) and not self.dragging) then
            self.dragging = true

            self.d_x = self.x:get_int() - mouse_position[1]
            self.d_y = self.y:get_int() - mouse_position[2]
        end
    end

    if (not input.is_key_down(0x01)) then 
        self.dragging = false
    end

    if (self.dragging and gui.is_menu_open()) then
        local new_x = math.max(0, math.min(screen[1] - self.width, mouse_position[1] + self.d_x))
        local new_y = math.max(0, math.min(screen[2] - self.height, mouse_position[2] + self.d_y))
        new_x = self.unlocked and mouse_position[1] + self.d_x or new_x
        new_y = self.unlocked and mouse_position[2] + self.d_y or new_y

        self.x:set_int(new_x)
        self.y:set_int(new_y)
    end
end

--- @return: number, number
function c_drag:get()
    return self.x:get_int(), self.y:get_int()
end
--- @endregion

--- @region: draw
local draw = {}

--- @param: pos: vec3
--- @param: size: vec3
--- @param: color1: color
--- @param: round: number: optional
--- @param: round_flags: number: optional
--- @return: void
function draw.rect(pos, size, color1, round, round_flags)
    local a, b = pos, pos + size

    if (round ~= nil) then
        render.rect_filled_rounded(a.x, a.y, b.x, b.y, color1, round, round_flags or render.all)
        return
    end

    return render.rect_filled(a.x, a.y, b.x, b.y, color1)
end

--- @param: pos: vec3
--- @param: size: vec3
--- @param: color1: color
--- @return: void
function draw.rect_outline(pos, size, color1)
    local a, b = pos, pos + size

    return render.rect(a.x, a.y, b.x, b.y, color1)
end

--- @param: pos: vector
--- @param: size: vector
--- @param: color1: color
--- @param: color2: color
--- @param: ltr: boolean: optional
--- @param: normal: boolean: optional
--- @return: void
function draw.gradient(pos, size, color1, color2, ltr, normal)
    local a, b = pos, pos + size

    if (normal == true) then
        a, b = pos, size
    end

    if (ltr == true) then
        render.rect_filled_multicolor(a.x, a.y, b.x, b.y, color1, color2, color1, color2)
        return
    end

    return render.rect_filled_multicolor(a.x, a.y, b.x, b.y, color1, color1, color2, color2)
end

--- @param: pos: vec3
--- @param: size: vec3
--- @vararg: any
--- @return: void
function draw.push_clip_rect(pos, size, ...)
    local a, b = pos, pos + size

    return render.push_clip_rect(a.x, a.y, b.x, b.y, ...)
end

--- @return: void
function draw.pop_clip_rect()
    return render.pop_clip_rect()
end

--- @param: pos: vec3
--- @param: color1: color
--- @param: radius: number
--- @param: angle: number: optional
--- @param: percentage: number: optional
--- @param: thickness: number: optional
--- @param: segments: number: optional
--- @return: void
function draw.circle_outline(pos, color1, radius, angle, percentage, thickness, segments)
    local x, y = pos.x, pos.y

    return render.circle(x, y, radius, color1, thickness or 1, segments or 12, percentage or 1, angle or 0)
end

--- @param: pos: vector
--- @param: size: vector
--- @param: color1: color
--- @param: length: number
--- @return: void
function draw.shadow(pos, size, color1, length)
    local r, g, b, a = color1.r, color1.g, color1.b, color1.a

    for i = 1, 10 do
        draw.rect_outline(pos - math.vec3(i, i), size + math.vec3(i * 2, i * 2), render.color(r, g, b, (60 - (60 / length) * i) * (a / 255)))
    end
end

--- @param: pos: vec3
--- @param: size: vec3
--- @param: color1: color
--- @param: glow: boolean: optional
--- @return: void
function draw.window(pos, size, color1, glow)
    local round = 6

    local x, y = pos.x, pos.y
    local width, height = x + size.x, y + size.y

    local r, g, b, a = color1.r, color1.g, color1.b, color1.a

    if (glow == true) then
        draw.shadow(pos, size, render.color(r, g, b, (255 / 255) * a), 10)
    end

    draw.rect(pos, size, render.color(0, 0, 0, (80 / 255) * a), round-2)

    draw.push_clip_rect(math.vec3(x, y), math.vec3(round, round + 1))
    draw.circle_outline(pos + math.vec3(round + 1, round + 1), render.color(r, g, b, (255 / 255) * a), round + 2, 180, 0.3, 1)
    draw.pop_clip_rect()

    draw.push_clip_rect(pos + math.vec3(size.x - round), math.vec3(round, round + 1))
    draw.circle_outline(pos + math.vec3(size.x - round - 1, round + 1), render.color(r, g, b, (255 / 255) * a), round + 2, 280, 0.3, 1)
    draw.pop_clip_rect()

    draw.rect(math.vec3(pos.x + round - 3, pos.y), math.vec3(size.x - (round * 2) + 6, 1), render.color(r, g, b, (255 / 255) * a))

    draw.gradient(math.vec3(pos.x, pos.y + round - 3), math.vec3(1, (size.y + 5) / 2), render.color(r, g, b, (255 / 255) * a), render.color(r, g, b, (0 / 255) * a))
    draw.gradient(math.vec3(pos.x + size.x - 1, pos.y + round - 3), math.vec3(1, (size.y + 5) / 2), render.color(r, g, b, (255 / 255) * a), render.color(r, g, b, (0 / 255) * a))
end
--- @endregion

--- @region: fonts
local fonts = {}

fonts.verdana = {}

fonts.verdana.default = render.create_font("verdana.ttf", 12, render.font_flag_shadow)
--- @endregion

--- @region: ui
local ui_general = {}


ui_general.glow = gui.add_checkbox("Glow", "lua>tab b")



ui_general.keybinds_x = gui.add_slider("Keybinds x", "lua>tab b", 0, e_global.SCREEN[1], 1); gui.set_visible("lua>tab b>Keybinds x", false)
ui_general.keybinds_y = gui.add_slider("Keybinds y", "lua>tab b", 0, e_global.SCREEN[2], 1); gui.set_visible("lua>tab b>Keybinds y", false)
--- @endregion

--- @region: watermark
local watermark = {}

function watermark1()
    if (not watermark2:get_bool()) then
        return
    end
    if watermarks:get_int() == 1 then

    local accent_color = watermark_color:get_color()
    local a_r, a_g, a_b = accent_color.r, accent_color.g, accent_color.b

    local prefix = "Maniak"
    local pre = ".lua"

    local ping = math.floor((utils.get_rtt() or 0) * 1000)
    local latency = ping >= 1 and ("%dms"):format(ping) or ""
    local Time = utils.get_time()
    local realtime = string.format("%02d:%02d", Time.hour, Time.min)
    local username = engine.get_player_info(engine.get_local_player()).name
    local text = 'Maniak      | ' ..engine.get_player_info(engine.get_local_player()).name.. ' | delay: '..latency..' | Time:  '.. realtime ..''
    local text1 ='           .lua'
    local text_size = {render.get_text_size(fonts.verdana.default, text)}
    local x, y = e_global.SCREEN[1], 8
    local width, height = animation.new("watermark width", text_size[1] + 12, 8), 22

    x = x - width - 10

    draw.window(math.vec3(x, y), math.vec3(width, height), render.color(a_r, a_g, a_b, 255), ui_general.glow:get_bool())
    render.text(fonts.verdana.default, x + (width / 2) - (text_size[1] / 2), y + (height / 2) - (text_size[2] / 2) + 1, text, render.color(255, 255, 255, 255))
    render.text(fonts.verdana.default, x + (width / 2) - (text_size[1] / 2), y + (height / 2) - (text_size[2] / 2) + 1, text1, render.color(watermark_color:get_color().r, watermark_color:get_color().g, watermark_color:get_color().b, 255))
end
end
--- @endregion

--- @region: keybinds
local keybinds = {}

keybinds.active = {}

keybinds.list = {
    ["Double tap"] = "rage>aimbot>aimbot>double tap",
    ["Hideshots"] = "rage>aimbot>aimbot>hide shot",
    ["Minimum damage"] = "rage>aimbot>ssg08>scout>override",
    ["Force safepoint"] = "rage>aimbot>aimbot>force extra safety",
    ["Headshot only"] = "rage>aimbot>aimbot>headshot only",
    ["Fake Duck"] = "misc>movement>fake duck",
    ["Auto Peek"] = "misc>movement>peek assist",
}

keybinds.width = 0

keybinds.modes = { 
    [0] = "always",
    [1] = "holding",
    [2] = "toggled",
    [3] = "off"
}

keybinds.dragging = c_drag.new(ui_general.keybinds_x, ui_general.keybinds_y, 0, 0)

function keybinds1()
    if (not keybinds2:get_bool()) then
        return
    end
if keybindss:get_int() == 1 then
    local accent_color = keybinds_color:get_color()
    local a_r, a_g, a_b = accent_color.r, accent_color.g, accent_color.b

    local latest_item = false
    local maximum_offset = 66

    for bind_name, path in pairs(keybinds.list) do
        local item_active = gui.get_config_item(path):get_bool()

        if (item_active) then
            latest_item = true

            if (keybinds.active[bind_name] == nil) then
                keybinds.active[bind_name] = {mode = "", alpha = 0, offset = 0, active = false}
            end

            local key_code, key_type = gui.get_keybind(path)
            local bind_mode = keybinds.modes[key_type]

            local bind_name_size = {render.get_text_size(fonts.verdana.default, bind_name)}
            local bind_state_size = {render.get_text_size(fonts.verdana.default, bind_mode)}

            keybinds.active[bind_name].mode = bind_mode

            keybinds.active[bind_name].alpha = animation.lerp(keybinds.active[bind_name].alpha, 1, 12)
            keybinds.active[bind_name].offset = bind_name_size[1] + bind_state_size[1]

            keybinds.active[bind_name].active = true
        elseif (keybinds.active[bind_name] ~= nil) then
            keybinds.active[bind_name].alpha = animation.lerp(keybinds.active[bind_name].alpha, 0, 12)
            keybinds.active[bind_name].active = false

            if (keybinds.active[bind_name].alpha < 0.1) then
                keybinds.active[bind_name] = nil
            end
        end

        if (keybinds.active[bind_name] ~= nil and keybinds.active[bind_name].offset > maximum_offset) then
            maximum_offset = keybinds.active[bind_name].offset
        end
    end

    local alpha = animation.new("keybinds alpha", (gui.is_menu_open() or table.count(keybinds.active) > 0 and latest_item) and 1 or 0, 12)

    local text = "keybinds"
    local text_size = {render.get_text_size(fonts.verdana.default, text)}

    local x, y = keybinds.dragging:get()

    local width, height = animation.new("keybinds width", 30 + maximum_offset, 8), 22
    local height_offset = height + 3

    draw.window(math.vec3(x, y), math.vec3(width, height), render.color(a_r, a_g, a_b, 255 * alpha), ui_general.glow:get_bool())
    render.text(fonts.verdana.default, x + (width / 2) - (text_size[1] / 2), y + (height / 2) - (text_size[2] / 2) + 1, text, render.color(255, 255, 255, 255 * alpha))

    for bind_name, value in pairs(keybinds.active) do
        local key_type = "[" .. (value.mode or "?") .. "]"
        local key_type_size = {render.get_text_size(fonts.verdana.default, key_type)}

        render.text(fonts.verdana.default, x + 5, y + height_offset, bind_name, render.color(255, 255, 255, 255 * alpha * value.alpha))
        render.text(fonts.verdana.default, x + width - key_type_size[1] - 5, y + height_offset, key_type, render.color(255, 255, 255, 255 * alpha * value.alpha))

        height_offset = height_offset + 15 * value.alpha
    end

    keybinds.dragging:handle(width, (table.count(keybinds.active) > 0 and height_offset or height))
end
end
--- @endregion

function itpitchz()
    local ap = gui.get_config_item("misc>movement>peek assist");
    local pitch = gui.get_config_item("rage>Anti-Aim>angles>pitch");
    if rage.idealtick:get_bool() then 
        if ap:get_bool() == true then
    if rage.idp0:get_bool() == true then
        pitch:set_int(3)
        if ap:get_bool() == false then
            if rage.idp0:get_bool() == false or true then
                pitch:set_int(pitch:get_int())
            else  if rage.idealtick:get_bool() then 
                if ap:get_bool() == true then
                    if rage.idp0:get_bool() then
                    if aa.preset:get_bool() == true and aa.presets:get_int() == 0 or 1 or 2 or 3 or 4 or 5 or 6 or 7 then
                        pitch:set_int(3)
                    end
        end
    end
end
end
end
end
end
end
end

function itpitchup()
    local ap = gui.get_config_item("misc>movement>peek assist");
    local pitch = gui.get_config_item("rage>Anti-Aim>angles>pitch");
    if rage.idealtick:get_bool() then 
        if ap:get_bool() == true then
            if rage.idp1:get_bool() == true then
                pitch:set_int(2)
        if ap:get_bool() == false then
            if rage.idp1:get_bool() == false or true then
                pitch:set_int(pitch:get_int())
            else if rage.idealtick:get_bool() then 
                if ap:get_bool() == true then
                    if rage.idp1:get_bool() then
                    if aa.preset:get_bool() == true and aa.presets:get_int() == 0 or 1 or 2 or 3 or 4 or 5 or 6 or 7 then
                        pitch:set_int(2)
                    end
            end
        end
    end
end
end
end
end
end
end



function freestandstat()
    local jitter = gui.get_config_item("Rage>Anti-Aim>Angles>Jitter");
    local fs = gui.get_config_item("rage>Anti-Aim>angles>freestand");
    local ap = gui.get_config_item("misc>movement>peek assist");
    if rage.idealtick:get_bool() == true then
        if rage.fss:get_bool() == true then
        if ap:get_bool() == true then
        if fs:get_bool() == true then
            jitter:set_int(0)
        else
            if fs:get_bool() == false then
            jitter:set_int(1)
            else
                if rage.idealtick:get_bool() == false then
                    if rage.fss:get_bool() == false or true then
                        if ap:get_bool() == false or true then
                        if fs:get_bool() == true or false then
                            jitter:set_int(1)
                        end
                end
            end
        end
    end
end
end
end
end
end



-- grenade visual

local weapons = require("weapons")

local g_TextureSpacing = 3

local TextureInfo = function (weapon_name)
    local id, w, h = weapons[weapon_name]:get_texture(17)
    return {ID =  id, Width = w, Height = h}
end

local g_Textures = 
{
    [43] = TextureInfo("weapon_flashbang"),
    [44] = TextureInfo("weapon_hegrenade"),
    [45] = TextureInfo("weapon_smokegrenade"),
    [46] = TextureInfo("weapon_molotov"),
    [47] = TextureInfo("weapon_decoy"),
    [48] = TextureInfo("weapon_incgrenade"),
}

local g_SortTable = 
{
    [43] = 4,
    [44] = 5,
    [45] = 3,
    [46] = 1,
    [47] = 6,
    [48] = 2,
}
local SortCallback = function (a, b)return g_SortTable[a] < g_SortTable[b] end

local g_NameRef         = gui.get_config_item("visuals>esp>player>name")
local g_WeaponTextRef   = gui.get_config_item("visuals>esp>player>weapon")
local g_WeaponIconRef   = gui.get_config_item("visuals>esp>player>weapon icons")
local g_AmmoRef         = gui.get_config_item("visuals>esp>player>ammo")



function g()
    local DrawType = g_Type:get_int()
    if DrawType == 0 then
        return
    end

    local NameState         = g_NameRef:get_bool()
    local WeaponTextState   = g_WeaponTextRef:get_bool()
    local WeaponIconState   = g_WeaponIconRef:get_bool()
    local AmmoState         = g_AmmoRef:get_bool()
    local Color             = g_ColorPicker:get_color()

    local LP = engine.get_local_player()
    entities.for_each_player(function(Player)
        if not Player:is_alive() or Player:get_index() == LP or not Player:is_enemy() then
            return
        end

        local Grenades = {}
        for i = 0, 63 do
            local WeaponHandle = Player:get_prop("m_hMyWeapons", i)
            local Weapon = entities.get_entity_from_handle(WeaponHandle)
            if Weapon then
                local m_iItemDefinitionIndex = Weapon:get_prop("m_iItemDefinitionIndex")
                if g_Textures[m_iItemDefinitionIndex] then
                    table.insert(Grenades, m_iItemDefinitionIndex)
                end
            end
        end

        if #Grenades == 0 then
            return
        end

        table.sort(Grenades, SortCallback)

        local DrawColor     = Player:is_valid() and Color or render.color(225, 225, 225, Color.a * (Player:get_esp_alpha() / 255))
        local TotalWidth    = 0

        for i, m_iItemDefinitionIndex in pairs(Grenades) do
            TotalWidth = TotalWidth + g_Textures[m_iItemDefinitionIndex].Width + (i == #Grenades and 0 or g_TextureSpacing)
        end


        local x, y, x2, y2 = Player:get_bbox()
        if x then
            local Offset = {x = 0, y = 0}

            if DrawType == 1 then
                Offset.y = NameState and 14 or 4
            else
                if AmmoState then
                    Offset.y = Offset.y + 5
                end
                
                if WeaponTextState then
                    Offset.y = Offset.y + 8
                end

                if WeaponIconState then
                    Offset.y = Offset.y + 13
                end
            end

            local DrawPos = {x = x + (x2 - x) / 2 - TotalWidth / 2 , y = (DrawType == 1 and y - Offset.y or y2 + Offset.y)}
            for _, m_iItemDefinitionIndex in pairs(Grenades) do
                local Texture = g_Textures[m_iItemDefinitionIndex]
                
                render.push_texture(Texture.ID)

                local Min = DrawType == 1 and {x = DrawPos.x + Offset.x, y = DrawPos.y - Texture.Height} or {x = DrawPos.x + Offset.x, y = DrawPos.y }
                local Max = DrawType == 1 and {x = DrawPos.x + Offset.x + Texture.Width, y = DrawPos.y} or {x = DrawPos.x + Offset.x + Texture.Width, y = DrawPos.y + Texture.Height}



                render.rect_filled(Min.x + 1, Min.y + 1, Max.x + 1, Max.y + 1, render.color(50, 50, 50, DrawColor.a))
                render.rect_filled(Min.x, Min.y, Max.x, Max.y, DrawColor)
                render.pop_texture()


                Offset.x = Offset.x + Texture.Width + g_TextureSpacing
            end
        end
    end)
end



--fake head

function fh()
    local rollex = gui.get_config_item("rage>anti-aim>desync>roll lean")
    local roll = gui.get_config_item("rage>Anti-Aim>Desync>Lean Amount")
    local faketoggle = gui.get_config_item("rage>anti-aim>desync>fake")
    local fakeamount = gui.get_config_item("rage>anti-aim>desync>fake amount")
    local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
    local ensure = gui.get_config_item("rage>anti-aim>desync>ensure lean")
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    local yadd = gui.get_config_item("Rage>Anti-Aim>Angles>yaw Add")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    if aa.fhh:get_bool() == true and aa.IV:get_bool() == false then
        faketoggle:set_int(1)
        fakeamount:set_int(-115)
        compangle:set_int(100)
        rollex:set_int(2)
        roll:set_int(1000)
        ensure:set_int(1)
        jittertoggle:set_bool(false)
        spintoggle:set_bool(false)
        yadd:set_bool(false)
    else
        if aa.fhh:get_bool() == false then
            faketoggle:set_int(faketoggle:get_int())
            fakeamount:set_int(fakeamount:get_int())
            compangle:set_int(compangle:get_int())
            rollex:set_int(rollex:get_int())
            roll:set_int(roll:get_int())
            ensure:set_int(ensure:get_int())
            jittertoggle:set_int(jittertoggle:get_int())
            spintoggle:set_bool(spintoggle:get_bool())
            yadd:set_bool(yadd:get_bool())
        else 
            if aa.fhh:get_bool() == true and aa.IV:get_bool() == true then
            faketoggle:set_int(1)
            fakeamount:set_int(-120)
            compangle:set_int(-170)
            rollex:set_int(2)
            roll:set_int(1000)
            ensure:set_int(1)
            jittertoggle:set_bool(false)
            spintoggle:set_bool(false)
            yadd:set_bool(false)
    end
end
end
end






--defensive tp
function dte()
    local dtstyle = gui.get_config_item("lua>tab b>DoubleTap type:")
    if rage.dtee:get_bool() then
    if rage.dttickb:get_bool() then
if dt:get_bool() and info.fatality.can_fastfire then
    rage.dttype:set_int(0)
else
    if dt:get_bool() and not info.fatality.can_fastfire then
        rage.dttype:set_int(1)
    end
    if dt:get_bool() == false then
        rage.dttype:set_int(1)
end
end
end
end
end
















local active_bruteforce = false
local jitteractive = gui.get_config_item('rage>anti-aim>angles>jitter')
local fakeamt = gui.get_config_item('rage>anti-aim>desync>fake amount')
local fsfake = gui.get_config_item('rage>anti-aim>desync>freestand fake')
local lastfs = fsfake:get_int()
local lastjitter = jitteractive:get_bool()
local brute_timer = utils.new_timer(5000, function()
    active_buretforce = false
end)


local function flip_desync(dist) --flip func
    brute_timer:set_delay(5000)
    if not brute_timer:is_active() then
        brute_timer:start()
    end

    active_buretforce = true
    if dist < 0 then
        fakeamt:set_int(100)
    else
        fakeamt:set_int(-100)
    end
end


local fcount = global_vars.framecount
function on_game_event(event)--bullet calculations
    if aa.abff:get_bool() then
    if event:get_name() == "bullet_impact" and fcount + 30 <= global_vars.framecount then
        
        local person = entities.get_entity(engine.get_player_for_user_id(event:get_int("userid")))
        local lp = entities.get_entity(engine.get_local_player())
        if not person or not lp or not lp:is_alive() or lp:get_index() == person:get_index() then return end
     
        local x = event:get_int("x")
        local y = event:get_int("y")
        local z = event:get_int("z")
        local endpos = math.vec3(x, y, z)
     
        local startpos = math.vec3(person:get_eye_position())
        local localpos = math.vec3(lp:get_eye_position())
     
        local headang = startpos:calc_angle(localpos)
        local shotang = startpos:calc_angle(endpos)
     
        dist = math.vec3((headang.x - shotang.x), (headang.y - shotang.y))
        posdist = math.vec3((headang.x - shotang.x), (headang.y - shotang.y))
     
        if posdist.y < 0 then posdist.y = posdist.y * -1 end
        if posdist.y <= 8 and dist.x < 1.5 then
            flip_desync(dist.y)
            fcount = global_vars.framecount
        end
    end
end
end

function on_player_hurt(event) --just incase
    if fcount + 30 <= global_vars.framecount then
        
        local person = entities.get_entity(engine.get_player_for_user_id(event:get_int("userid")))
        local lp = entities.get_entity(engine.get_local_player())
        if not person or not lp or not lp:is_alive() then return end
        if lp:get_index() == person:get_index() then
            flip_desync(fakeamt:get_int())
            fcount = global_vars.framecount
        end
    end
end

--sway jitter

function sj()
    local add = gui.get_config_item("Rage>Anti-Aim>Angles>Add")
    local yadd = gui.get_config_item("Rage>Anti-Aim>Angles>yaw Add")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    local spinrange = gui.get_config_item("rage>anti-aim>angles>spin range")
    local spinspeed = gui.get_config_item("rage>anti-aim>angles>spin speed")
    if sjj:get_bool() then
        yadd:set_bool(true)
        jittertoggle:set_bool(false)
        spintoggle:set_bool(true) 
        add:set_int(-aa.sjjj:get_int() +25 )
        spinrange:set_int(aa.sjjj:get_int() * 1.5)
        spinspeed:set_int(aa.sjs:get_int() * 4)
    end
    if aa.fhh:get_bool() then
        spintoggle:set_bool(false) 
    end
end
--delay jitter 
function dj()
    local add = gui.get_config_item("Rage>Anti-Aim>Angles>Add")
    local yadd = gui.get_config_item("Rage>Anti-Aim>Angles>yaw Add")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    if djjc:get_bool() then
        jittertoggle:set_bool(false)
        yadd:set_bool(true)
        add:set_int(global_vars.tickcount %djj:get_int() ~= 1 and djs:get_int() or djs:get_int() * -1 or djs:get_int() * 1)
    end
    if aa.fhh:get_bool() then
        yadd:set_bool(false)
end
end
function resolver()
    local fl = gui.get_config_item("Rage>Anti-Aim>Fakelag>Limit")
    local pitch = gui.get_config_item("rage>anti-aim>angles>pitch")
    local spintoggle = gui.get_config_item("rage>anti-aim>angles>spin")
    local spinrange = gui.get_config_item("rage>anti-aim>angles>spin range")
    local spinspeed = gui.get_config_item("rage>anti-aim>angles>spin speed")
    local rollex = gui.get_config_item("rage>anti-aim>desync>roll lean")
    local roll = gui.get_config_item("rage>Anti-Aim>Desync>Lean Amount")
    local jittertoggle = gui.get_config_item("rage>anti-aim>angles>jitter")
    local jitterrange = gui.get_config_item("rage>anti-aim>angles>jitter range")
    local faketoggle = gui.get_config_item("rage>anti-aim>desync>fake")
    local fakeamount = gui.get_config_item("rage>anti-aim>desync>fake amount")
    local compangle = gui.get_config_item("rage>anti-aim>desync>compensate angle")
    local fsfake = gui.get_config_item("rage>anti-aim>desync>freestand fake")
    local fakejitter = gui.get_config_item("rage>anti-aim>desync>flip fake with jitter")
    local slide = gui.get_config_item("misc>movement>slide")
    local yaw = gui.get_config_item("rage>anti-aim>angles>yaw")
   local fd = gui.get_config_item("misc>movement>fake duck"):get_bool()
    local ap = gui.get_config_item("misc>movement>peek assist"):get_bool()
    if engine.is_in_game() == false then return end
        local slowwalk = slide:get_bool()
        local lplr = entities.get_entity(engine.get_local_player())
        local flag = lplr:get_prop("m_fFlags")
        local air = lplr:get_prop("m_hGroundEntity") == -1
        local air2 = input.is_key_down(0x20)
        local velocity_x = math.floor(lplr:get_prop("m_vecVelocity[0]"))
        local velocity_y = math.floor(lplr:get_prop("m_vecVelocity[1]"))
        local speed = math.sqrt(velocity_x ^ 2 + velocity_y ^ 2)
        local crouch = input.is_key_down(0x11)
        local lp = entities.get_entity(engine.get_local_player())
        local scoped = lp:get_prop("m_bIsScoped") 
        local ove =  gui.get_config_item("rage>aimbot>ssg08>scout>Minimum hit chance")
    local ove1 =  gui.get_config_item("rage>aimbot>ssg08>scout>pointscale")
    local ove2 =  gui.get_config_item("rage>aimbot>ssg08>scout>Minimum Damage")
    if rage.rs:get_bool() then
        if not air then
        ove:set_int(math.random(69, 72))
        ove1:set_int(math.random(69, 89))
        ove2:set_int(math.random(98, 102))
        else if air then
            ove:set_int(math.random(30, 60))
            ove1:set_int(math.random(30, 100))
            ove2:set_int(math.random(3, 120))
    end
end
end
end

function dishsondt()
    local hs = gui.get_config_item("Rage>Aimbot>Aimbot>Hide shot")
    if rage.dhodt:get_bool() then
        if dt:get_bool() then
            hs:set_bool(false)
     
        end
    end
    end


    function fl()
        if fll:get_bool() then
            limit:set_int(flll:get_int())
        end
    end
    local clipboard = require("clipboard")
    local ints = {rage.os,rage.pred,rage.dttype,override.over1,override.over2,override.over3,override.over4,override.over0,override.over5,override.over6,override.over7,override.over8,aa.aaim22,aa.sjjj,aa.sjs,aa.aaim3,aa.aaimx,aa.presets,djs,djj,flll,watermarks,keybindss,indicatorstype,infotabflag,g_Type,killsays,clan,aspect_ratio_slider,slowwalk_slider,aa.standing_pitch,aa.standing_jitterrange,aa.standing_fakeamount,aa.standing_compangle,aa.standing_spinr,aa.standing_spins,aa.standing_rollonoff,aa.standing_roll,aa.moving_pitch,aa.moving_jitterrange,aa.moving_fakeamount,aa.moving_compangle,aa.moving_spinr,aa.moving_spins,aa.moving_rollonoff,aa.moving_roll,aa.slowwalk_pitch,aa.slowwalk_jitterrange,aa.slowwalk_fakeamount,aa.slowwalk_compangle,aa.slowwalk_spinr,aa.slowwalk_spins,aa.slowwalk_rollonoff,aa.slowwalk_roll,aa.crouching_pitch,aa.crouching_jitterrange,aa.crouching_fakeamount,aa.crouching_compangle,aa.crouching_spinr,aa.crouching_spins,aa.crouching_rollonoff,aa.crouching_roll,aa.crouchingair_pitch,aa.crouchingair_jitterrange,aa.crouchingair_fakeamount,aa.crouchingair_compangle,aa.crouchingair_spinr,aa.crouchingair_spins,aa.crouchingair_rollonoff,aa.crouchingair_roll,aa.air_pitch,aa.air_jitterrange,aa.air_fakeamount,aa.air_compangle,aa.air_spinr,aa.air_spins,aa.air_rollonoff,aa.air_roll,aa.fd_pitch,aa.fd_jitterrange,aa.fd_fakeamount,aa.fd_compangle,aa.fd_spinr,aa.fd_spins,aa.fd_rollonoff,aa.fd_roll,aa.ap_pitch,aa.ap_jitterrange,aa.ap_fakeamount,aa.ap_compangle,aa.ap_spinr,aa.ap_spins,aa.ap_rollonoff,aa.ap_roll}

    local bools = {rage.rbi,rage.rs,rage.osf,rage.resolver,rage.dttick,rage.idealtick,rage.tripletap,rage.idp0,rage.idp1,rage.fs0,rage.da0,rage.hs0,rage.fss,rage.legitaaitt,rage.fastdt,rage.dttickb,rage.dttype,rage.nore1,rage.wfdtr,rage.ns,rage.ns1,rage.dhodt,override.over,aa.fix,aa.puexp,aa.abff,djjc,fll,watermark2,infobar,keybinds2,indicatorsmain,mww,lethalbind,skeetind,dmgm,killsay,clantag,aspectratiobutton,Hitlogs,svc1,slowwalk_box,safe1,safe2,WorkAA,aa.standing_jittertoggle,aa.standing_faketoggle,aa.standing_att,aa.standing_spintog,aa.standing_ensure,aa.moving_jittertoggle,aa.moving_faketoggle,aa.moving_att,aa.moving_spintog,aa.moving_ensure,aa.slowwalk_jittertoggle,aa.slowwalk_faketoggle,aa.slowwalk_att,aa.slowwalk_spintog,aa.slowwalk_ensure,aa.crouching_jittertoggle,aa.crouching_faketoggle,aa.crouching_att,aa.crouching_spintog,aa.crouching_ensure,aa.crouchingair_jittertoggle,aa.crouchingair_faketoggle,aa.crouchingair_att,aa.crouchingair_spintog,aa.crouchingair_ensure,aa.air_jittertoggle,aa.air_faketoggle,aa.air_att,aa.air_spintog,aa.air_ensure,aa.fd_jittertoggle,aa.fd_faketoggle,aa.fd_att,aa.fd_spintog,aa.fd_ensure,aa.ap_jittertoggle,aa.ap_faketoggle,aa.ap_att,aa.ap_spintog,aa.ap_ensure}
    
    local colors = {watermark_color,mwatermark_color,keybinds_color,infobar_color,indicator_color,hlc,g_ColorPicker,}
    
    local function ColorToHex(c)
        return string.format("#".."%02x%02x%02x%02x", c:get_color().r, c:get_color().g, c:get_color().b, c:get_color().a)
    end
    
    function export()
        local cfg_data = { {}, {},{}}
        local final_string = ""
        for i = 1,#bools do
            bool = tostring(bools[i]:get_bool())
            table.insert(cfg_data[1],bool.." ")
        end
        for i = 1,#ints do
            int = tostring(ints[i]:get_int())
            table.insert(cfg_data[2],int.." ")
        end
        for i=1,#colors do
           color = ColorToHex(colors[i])
           table.insert(cfg_data[3],color.." ")
        end    
        for i = 1,#cfg_data[1] do
            final_string = final_string..cfg_data[1][i]
        end
        for i = 1,#cfg_data[2] do
            final_string = final_string..cfg_data[2][i]
        end
        for i=1,#cfg_data[3] do
            final_string = final_string..cfg_data[3][i]
        end
        encoded_string = utils.base64_encode(final_string)
        clipboard.set(encoded_string)
    end 
    
    function import(string)
        local decoded = utils.base64_decode(string)
        if not decoded then print("Failed to import config") end
        elements = {}
        for word in decoded:gmatch("%S+") do
            table.insert(elements, word)
        end
        local cfg_data = { {}, {},{}}
        for i = 1, #bools do
            if elements[i] == "true" or elements[i] == "false" then
              table.insert(cfg_data[1], elements[i] == "true") 
            else
                utils.error_print("Invalid Config")
            end
        end
        for i = #bools+1,#bools+#ints+1 do
            num = tonumber(elements[i])
            if num then
                table.insert(cfg_data[2],elements[i])
            else
                utils.error_print("Invalid Config")
            end
        end
        for i=#bools+#ints+1,#elements do
            table.insert(cfg_data[3],elements[i])
        end
        for i = 1 , #cfg_data[1] do
            bools[i]:set_bool(cfg_data[1][i]) 
        end  
        for i = 1 , #cfg_data[2] do
            ints[i]:set_int(cfg_data[2][i]) 
        end 
        for i = 1, #cfg_data[3] do
            colors[i]:set_color(render.color(cfg_data[3][i]))
        end 
    end    
    
    gui.add_button("Kfg Export", "lua>tab a", function() 
        export()
    end)
    gui.add_button("Kfg Import", "lua>tab a", function() 
        succes,result = pcall(import,clipboard.get())
        if succes then
            import(clipboard.get())
        else
            print("Invalid config")
        end
    end)
    gui.add_button("Default KFG","lua>tab a", function()
        import("dHJ1ZSB0cnVlIHRydWUgZmFsc2UgdHJ1ZSB0cnVlIGZhbHNlIGZhbHNlIGZhbHNlIHRydWUgdHJ1ZSBmYWxzZSB0cnVlIGZhbHNlIHRydWUgdHJ1ZSB0cnVlIGZhbHNlIGZhbHNlIHRydWUgZmFsc2UgdHJ1ZSBmYWxzZSBmYWxzZSBmYWxzZSB0cnVlIHRydWUgdHJ1ZSB0cnVlIHRydWUgdHJ1ZSB0cnVlIHRydWUgdHJ1ZSB0cnVlIHRydWUgdHJ1ZSB0cnVlIHRydWUgdHJ1ZSB0cnVlIHRydWUgdHJ1ZSB0cnVlIHRydWUgZmFsc2UgdHJ1ZSB0cnVlIGZhbHNlIGZhbHNlIHRydWUgdHJ1ZSB0cnVlIGZhbHNlIGZhbHNlIHRydWUgdHJ1ZSBmYWxzZSBmYWxzZSBmYWxzZSB0cnVlIHRydWUgdHJ1ZSBmYWxzZSBmYWxzZSBmYWxzZSB0cnVlIHRydWUgZmFsc2UgZmFsc2UgZmFsc2UgdHJ1ZSB0cnVlIHRydWUgZmFsc2UgdHJ1ZSB0cnVlIHRydWUgZmFsc2UgZmFsc2UgZmFsc2UgZmFsc2UgZmFsc2UgZmFsc2UgZmFsc2UgMiAwIDEgMjcgNzIgNzIgNzIgMjQgNzIgNzIgNzIgMzUgMCAxMyAxNSAwIDAgNiAyMyAzIDE3IDEgMCAwIDAgMSAwIDEgMTE2IDM2IDEgNyAtMTAwIDEwMCAwIDAgMCAwIDEgNTAgOTIgMTAwIDAgMCAwIDAgMSAxOSA5MCAxMDAgMCAwIDAgMCAxIDEzIDEwMCAxMDAgMCAwIDAgMCAxIDE5IDg3IDEwMCAwIDAgMCAwIDIgNyAxMDAgLTEwMCAzNjAgMTEwIDAgMCAxIDE5IDczIDEwMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAjNGY4ZWEyZGQgIzUwOGVhMmRkICM1MDhlYTJkZCAjNTA4ZWEyZGQgIzAwYWZlN2RkICM1MDhlYTJkZCAjNTA4ZWEyZGQg")
    end)

function nsss()
    local cl_sidespeed = cvar.cl_sidespeed
    local cl_forwardspeed = cvar.cl_forwardspeed
    local cl_backspeed = cvar.cl_backspeed
    local wan = cvar.weapon_accuracy_nospread 
    local wan1 = cvar.weapon_air_spread_scale
    local no_speed = 250 * slowwalk_slider:get_float( ) / 100
    if rage.ns:get_bool() then
        wan:set_int(0)
        wan1:set_int(0)
    else
    if rage.ns:get_bool() == false then
        wan:set_int(0)
        wan1:set_int(1)
    end
end
end

function nsss1()
    local cl_sidespeed = cvar.cl_sidespeed
    local cl_forwardspeed = cvar.cl_forwardspeed
    local cl_backspeed = cvar.cl_backspeed
    local wan = cvar.weapon_accuracy_nospread 
    local wan1 = cvar.weapon_air_spread_scale
    local no_speed = 250 * slowwalk_slider:get_float( ) / 100
    if rage.ns1:get_bool() then
        wan:set_int(0)
        wan1:set_int(10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
    else
    if rage.ns1:get_bool() == false then
        wan:set_int(0)
        wan1:set_int(1)
    end
end
end

