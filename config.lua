--================================--
--      FIRE SCRIPT v1.7.7        --
--  by GIMI (+ foregz, Albo1125)  --
--  make some function by Wick	  --
--      License: GNU GPL 3.0      --
--================================--

Config = {}

Config.Fire = {
    fireSpreadChance = 5, -- Out of 100 chances, how many lead to fire spreading? (not exactly percents)
    maximumSpreads = 5,
    spawner = { -- Requires the use of the built-in dispatch system
        enableOnStartup = true,
        interval = 1800000, -- Random fire spawn interval (set to nil or false if you don't want to spawn random fires) in ms
        chance = 50, -- Fire spawn chance (out of 100 chances, how many lead to spawning a fire?); Set to values between 1-100
        players = 3, -- Sets the minimum number of players subscribed to dispatch for the spawner to spawn fires.
        firefighterJobs = { -- If using ESX or QB (Config.Dispatch.JobName), you can specify which players will count as firefighters in Config.Fire.spawner.players above; If not using ESX or QB you can set this to nil
            ["ambulance"] = true -- QB is "ambulance" or ESX job is "fd"
        }
    }
}

Config.Dispatch = {
    enabled = true, -- Set this to false if you don't want to use the default dispatch system
    timeout = 15000, -- The amount of time in ms to delay the dispatch after the fire has been created
    storeLast = 5, -- The client will store the last five dispatch coordinates for use with /remindme <dispatchNumber>
    clearGpsRadius = 20.0, -- If you don't want to automatically clear the route upon arrival, leave this to false
    removeBlipTimeout = 400000, -- The amount of time in ms after which the dispatch call blip will be automatically removed
    Framework = "qb", -- * "qb" (qb-core) * "esx" (ESX) * "none" -- Set to a esx or qb job / jobs you want to be automatically subscribed to dispatch; Set to nil or false if you don't want to use this
    JobName = 'ambulance', -- Your Fire Job Name -- QB is "ambulance" or ESX job is "fd"
    playSound = "inferno", -- "inferno" or "none" -- play Stations sound
    playDispatch = "ps-dispatch", -- "chat" or "ps-dispatch" or "core_dispatch"
}

-- Config Stations
-- For stations sound, it need to be on enabled = true
Stations = {"els", "sls", "rh"}

-- Name = "pb", -- Paleto Bay
-- Name = "fz",  -- Fort Zancudo
-- Name = "ss", -- Sandy Shores
-- Name = "rh",  -- Rockford Hills
-- Name = "els",  -- East Los Santos
-- Name = "sls",  -- South Los Santos
-- Name = "dpb",  -- Del Perro Beach
-- Name = "lsia", -- LSIA

-- Config Tones
Tones = {"fire", "medical"}

-- "medical", "rescue", "fire", "other"

-- go to  \inferno-fire-ems-pager/client.lua for more


--[[
	-- add it in you qb-target
	
	["SetDuty1"] = { 
        name = "Pillboxduty",
        coords = vector3(307.56, -595.23, 43.28),
        length = 0.45,
        width = 0.35,
        heading = 248.38,
        debugPoly = false,
        minZ = 33.148,
        maxZ = 43.248,
        options = {
            {
              type = "client",
              event = "fire:ToggleDuty", -- or Toggle:LSFDDuty
              icon = "fas fa-sign-in-alt",
              label = "Sign In/Out",
              job = {
                ["ambulance"] = 0,
                }
            },
        },
        distance = 2.5
    },

--]]