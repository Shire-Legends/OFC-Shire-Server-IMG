local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_INVISIBLE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)
addCombatCondition(combat, condition)

--local area = createCombatArea( { {1, 1, 1}, {1, 3, 1}, {1, 1, 1} } )
--setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
