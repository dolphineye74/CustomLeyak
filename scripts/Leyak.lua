local Config = require("Config")
local UEHelpers = require("UEHelpers")
local Utils = require("Utils")

--
-- Hooks
--
local OnAIControllerLeyak_ReceiveBeginPlay_Hook = nil
local OnAbioticAIDirector_ReceiveBeginPlay_Hook = nil
local OnAbioticAIDirector_SpawnLeyak_Hook = nil

--
-- AI_Controller_Leyak_C:ReceiveBeginPlay
--
local function OnAIControllerLeyak_ReceiveBeginPlay(Context)
  Utils.Log("AI_Controller_Leyak_C > ReceiveBeginPlay")

  if Config.LeyakHostile == false then
    local LeyakAIController = Context:get()
    LeyakAIController.LeyakAggroRange = 0.1
    LeyakAIController.MaxLeyakChaseDistance_Aggrod = 0.1
    LeyakAIController.Eyesight = 0.1
  end
end

--
-- Abiotic_AIDirector_C:ReceiveBeginPlay
--
local function OnAbioticAIDirector_ReceiveBeginPlay(Context)
  Utils.Log("Abiotic_AIDirector_C > ReceiveBeginPlay")

  local AbioticAIDirector = Context:get()
  AbioticAIDirector.LeyakCooldown = Config.LeyakRespawnTime
  AbioticAIDirector.LeyakTauntCooldownMultiplier = Config.LeyakGreyebRespawnTimeMultiplier
end

--
-- Abiotic_AIDirector_C:SpawnLeyak
--
local function OnAbioticAIDirector_SpawnLeyak(Context)
  Utils.Log("Abiotic_AIDirector_C > SpawnLeyak")
end

--
-- Unregister hooks
--
local function UnregisterHooks()
  if OnAIControllerLeyak_ReceiveBeginPlay_Hook then
    UnregisterHook("/Game/Blueprints/Characters/NPCs/AI_Controller_Leyak.AI_Controller_Leyak_C:ReceiveBeginPlay", OnAIControllerLeyak_ReceiveBeginPlay_Hook)
    OnAIControllerLeyak_ReceiveBeginPlay_Hook = nil
  end
  if OnAbioticAIDirector_ReceiveBeginPlay_Hook then
    UnregisterHook("/Game/Blueprints/Environment/Systems/Abiotic_AIDirector.Abiotic_AIDirector_C:ReceiveBeginPlay", OnAbioticAIDirector_ReceiveBeginPlay_Hook)
    OnAbioticAIDirector_ReceiveBeginPlay_Hook = nil
  end
  if OnAbioticAIDirector_SpawnLeyak_Hook then
    UnregisterHook("/Game/Blueprints/Environment/Systems/Abiotic_AIDirector.Abiotic_AIDirector_C:ReceiveBeginPlay", OnAbioticAIDirector_SpawnLeyak_Hook)
    OnAbioticAIDirector_SpawnLeyak_Hook = nil
  end
end

--
-- Register hooks
--
local function RegisterHooks()
  OnAIControllerLeyak_ReceiveBeginPlay_Hook = RegisterHook("/Game/Blueprints/Characters/NPCs/AI_Controller_Leyak.AI_Controller_Leyak_C:ReceiveBeginPlay", function(Context)
    OnAIControllerLeyak_ReceiveBeginPlay(Context)
  end)
  OnAbioticAIDirector_ReceiveBeginPlay_Hook = RegisterHook("/Game/Blueprints/Environment/Systems/Abiotic_AIDirector.Abiotic_AIDirector_C:ReceiveBeginPlay", function(Context)
    OnAbioticAIDirector_ReceiveBeginPlay(Context)
  end)
  OnAbioticAIDirector_SpawnLeyak_Hook = RegisterHook("/Game/Blueprints/Environment/Systems/Abiotic_AIDirector.Abiotic_AIDirector_C:SpawnLeyak", function(Context)
    OnAbioticAIDirector_SpawnLeyak(Context)
  end)
end

return {
  RegisterHooks = RegisterHooks,
  UnregisterHooks = UnregisterHooks,
}
