local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -4.7, 0, -6.25, 0)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 48)
combat2:setFormula(COMBAT_FORMULA_LEVELMAGIC, -2.7, 0, -3.15, 0)
combat2:setArea(createCombatArea(AREA_CIRCLE2X2))

local condition = Condition(CONDITION_WEAKNESS)
condition:setParameter(CONDITION_PARAM_TICKS, 3000)
combat2:addCondition(condition)

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat3:setFormula(COMBAT_FORMULA_LEVELMAGIC, -4.7, 0, -6.25, 0)
combat3:setArea(createCombatArea(AREA_CIRCLE5X5))

local condition = Condition(CONDITION_CURSED)
condition:setParameter(CONDITION_PARAM_TICKS, 5000)
condition:addDamage(5, 2000, -5000)
combat3:addCondition(condition)


function onCastSpell(creature, variant)

	function combate(variant)
		return combat:execute(creature, variant)
	end

	function combate3(variant)
		doSendAnimatedText("Cursed!", creature:getPosition(),TEXTCOLOR_WHITE_EXP)
		return combat3:execute(creature, variant)
	end

    if getPlayerStorageValue(creature, 13) > os.time() then
        doPlayerSendCancel(creature, "Espere " .. getPlayerStorageValue(creature, 13) - os.time() .. " segundos para usar a Sussuro das Sombras novamente.")
        return false
    end
    setPlayerStorageValue(creature, 13, os.time() + 10)
	
	addEvent(function()
        doPlayerSendTextMessage(creature, MESSAGE_STATUS_WARNING, "CD Pronto: Sussuro das Sombras.")
    end, 10000)


	if creature:getSlotItem(9) ~= nil and creature:getSlotItem(9):getId() == 15011 and getPlayerReset(creature) > 2 then
		combat2:execute(creature, variant)
		addEvent(combate3, 1 * 300, variant)
		doSendAnimatedText("Weakness!", creature:getPosition(),TEXTCOLOR_WHITE_EXP)
		elseif creature:getSlotItem(9) ~= nil and creature:getSlotItem(9):getId() == 15011 then
		addEvent(combate, 1 * 300, variant)
		combat2:execute(creature, variant)
		doSendAnimatedText("Weakness!", creature:getPosition(),TEXTCOLOR_WHITE_EXP)
		elseif getPlayerReset(creature) > 2 then
		combat3:execute(creature, variant)
		else
		combat:execute(creature, variant)
	end
	return true
end