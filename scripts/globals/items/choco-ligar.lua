-----------------------------------
-- ID: 5919
-- Item: Choco-ligar
-- Food Effect: 3 Min, All Races
-----------------------------------
-- Vitality 1
-- Speed 12.5%
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local result = 0
    if target:hasStatusEffect(xi.effect.FOOD) or target:hasStatusEffect(xi.effect.FIELD_SUPPORT_FOOD) then
        result = xi.msg.basic.IS_FULL
    end
    return result
end

item_object.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 180, 5919)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.VIT, 1)
    target:addMod(xi.mod.MOVE, 13)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.VIT, 1)
    target:delMod(xi.mod.MOVE, 13)
end

return item_object