local Leyak = require("Leyak")
local UEHelpers = require("UEHelpers")
local Utils = require("Utils")

--
-- Register hooks
--
local function RegisterHooks()
  ExecuteInGameThread(function()
    -- Unregister previous hooks (if any)
    Leyak.UnregisterHooks()

    -- Unregister hooks
    Leyak.RegisterHooks()
  end)
end

-- Print loading success logs
RegisterHooks()

-- Print loading success logs
Utils.Log("Mod loaded successfuly!")
