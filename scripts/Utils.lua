local UEHelpers = require("UEHelpers")

local function Log(message)
  print("[CustomLeyak] " .. message .. "\n")
end

return {
  Log = Log,
}
