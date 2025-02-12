local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 13)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, 1.7, -76, 1.7, -76)
addCombatCondition(combat, condition)

function onCastSpell(cid, var)
if isCreature(cid) == TRUE then
doSendAnimatedText(getCreaturePosition(cid), "Rage", TEXTCOLOR_LIGHTBLUE)
doCombat(cid, combat, var)
else
doCombat(cid, combat, var)
end
end