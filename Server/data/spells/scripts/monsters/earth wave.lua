local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_CRAPS)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -200, 0, -300)

local arr = {
{1, 1, 1, 1, 1, 1 ,1},
{1, 1, 1, 1, 1, 1 ,1},
{1, 1, 1, 1, 1, 1 ,1},
{0, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 3, 0, 0, 0},
}

local area = createCombatArea(arr)

setCombatArea(combat, area)

function onCastSpell(cid, var)
	doCombat(cid, combat, var)
end
