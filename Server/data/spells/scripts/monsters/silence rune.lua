local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 35)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.3, 0, -1.7, 0)

local paralyze = Condition(CONDITION_EXHAUST)
paralyze:setParameter(CONDITION_PARAM_TICKS, 4000)
paralyze:setFormula(-1, 80, -1, 80)
combat:addCondition(paralyze)

function onCastSpell(creature, variant, isHotkey)
local target = creature:getTarget()
doSendAnimatedText("Silence!", target:getPosition(),TEXTCOLOR_WHITE_EXP)
	return combat:execute(creature, variant)
end
