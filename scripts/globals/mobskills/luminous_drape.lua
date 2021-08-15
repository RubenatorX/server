-----------------------------------
-- Luminous Drape
-- Family: Yovra
-- Description: A glowing curtain charms all nearby targets.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: AoE 10'
-- Notes:
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.CHARM_I
    local power = 0

    if (not target:isPC()) then
        skill:setMsg(xi.msg.basic.SKILL_MISS)
        return typeEffect
    end

    local msg = MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)
    if (msg == xi.msg.basic.SKILL_ENFEEB_IS) then
        mob:charm(target)
    end
    skill:setMsg(msg)

    return typeEffect
end

return mobskill_object