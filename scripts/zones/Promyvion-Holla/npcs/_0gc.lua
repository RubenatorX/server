-----------------------------------
-- Area: Promyvion Holla
--  NPC: Memory Flux 4th floor
-----------------------------------
local ID = zones[xi.zone.PROMYVION_HOLLA]
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(xi.questLog.JEUNO, xi.quest.id.jeuno.SHADOWS_OF_THE_DEPARTED) == xi.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(xi.ki.PROMYVION_HOLLA_SLIVER)
    then
        npcUtil.giveKeyItem(player, xi.ki.PROMYVION_HOLLA_SLIVER)
    else
        player:messageSpecial(ID.text.BARRIER_WOVEN)
    end
end

entity.onTrade = function(player, npc, trade)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
