local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 15000)
condition:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 30)
combat:addCondition(condition)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_HASTEGA)
condition:setParameter(CONDITION_PARAM_TICKS, 15000)
combat2:addCondition(condition)

function onCastSpell(creature, variant)
if getPlayerStorageValue(creature, 15) > os.time() then
doPlayerSendCancel(creature, "Espere "..getPlayerStorageValue(creature, 15) - os.time().." segundos para usar a Infus�o Vers�til novamente.")
return false
end
setPlayerStorageValue(creature, 15, os.time() + 25)

	addEvent(function()
        doPlayerSendTextMessage(creature, MESSAGE_STATUS_WARNING, "CD Pronto: Infus�o Vers�til.")
    end, 25000)

doSendAnimatedText("Skill Up!", creature:getPosition(),TEXTCOLOR_LIGHTBLUE)


    if creature:getSlotItem(9) ~= nil and creature:getSlotItem(9):getId() == 15011 and getPlayerReset(creature) > 2 then
        combat2:execute(creature, variant)
        combat:execute(creature, variant)
        setPlayerStorageValue(creature, 123124, os.time() + 15)
        doSendAnimatedText("Hastega!", creature:getPosition(),EXTCOLOR_LIGHTBLUE)
        doSendAnimatedText("Vampirism!", creature:getPosition(),EXTCOLOR_LIGHTBLUE)
        elseif creature:getSlotItem(9) ~= nil and creature:getSlotItem(9):getId() == 15011 then
        combat2:execute(creature, variant)
        combat:execute(creature, variant)
        doSendAnimatedText("Hastega!", creature:getPosition(),EXTCOLOR_LIGHTBLUE)
        elseif getPlayerReset(creature) > 2 then
        combat:execute(creature, variant)
        doSendAnimatedText("Vampirism!", creature:getPosition(),EXTCOLOR_LIGHTBLUE)
        setPlayerStorageValue(creature, 123124, os.time() + 15)
        else
        combat:execute(creature, variant)
    end
    return true
end
