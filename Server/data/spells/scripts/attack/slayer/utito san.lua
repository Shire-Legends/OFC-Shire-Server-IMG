local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_ARMOR_UP)
condition:setParameter(CONDITION_PARAM_TICKS, 15000)
combat2:addCondition(condition)

function onCastSpell(creature, variant)
    if getPlayerStorageValue(creature, 99) > os.time() then
        doPlayerSendCancel(creature, "Espere " .. getPlayerStorageValue(creature, 99) - os.time() .. " segundos para usar a Ess�ncia Vital novamente.")
        return false
    end
	
	addEvent(function()
        doPlayerSendTextMessage(creature, MESSAGE_STATUS_WARNING, "CD Pronto: Ess�ncia Vital.")
    end, 25000)

    -- Define o tempo de cooldown
    setPlayerStorageValue(creature, 99, os.time() + 25)

    -- Aumenta o limite m�ximo de vida
    local aumento = getCreatureMaxHealth(creature) * 1.5
    setCreatureMaxHealth(creature, aumento)

    -- Fun��o para reverter o aumento do limite m�ximo de vida
    local function normallife(creatureId)
        if isCreature(creatureId) then
            setCreatureMaxHealth(creatureId, getCreatureMaxHealth(creatureId) / 1.5)
        end
    end

    -- Timer para a dura��o da magia
    addEvent(function()
        if isCreature(creature) then
            -- Checa se o jogador ainda est� vivo e logado
            if getCreatureHealth(creature) > 0 and getPlayerStorageValue(creature, 100) == 1 then
                -- A magia termina normalmente
                doSendAnimatedText("Magia Terminada!", creature:getPosition(), TEXTCOLOR_LIGHTGREEN)
            else
                -- O jogador morreu ou deslogou, reverte o aumento
                normallife(creature:getId())
                doSendAnimatedText("Life Down!", creature:getPosition(), TEXTCOLOR_RED)
            end
        end
    end, 15000, creature:getId())

    doSendAnimatedText("Life Up!", creature:getPosition(), TEXTCOLOR_LIGHTGREEN)

    if creature:getSlotItem(9) ~= nil and creature:getSlotItem(9):getId() == 15011 and getPlayerReset(creature) > 2 then
		combat2:execute(creature, variant)
        setPlayerStorageValue(creature, 421321, os.time() + 15)
		doSendAnimatedText("Armor Up!", creature:getPosition(),TEXTCOLOR_LIGHTGREEN)
        doSendAnimatedText("Vampirism!", creature:getPosition(),TEXTCOLOR_LIGHTGREEN)
		elseif creature:getSlotItem(9) ~= nil and creature:getSlotItem(9):getId() == 15011 then
		combat2:execute(creature, variant)
		doSendAnimatedText("Armor Up!", creature:getPosition(),TEXTCOLOR_LIGHTGREEN)
		elseif getPlayerReset(creature) > 2 then
		combat:execute(creature, variant)
        doSendAnimatedText("Vampirism!", creature:getPosition(),TEXTCOLOR_LIGHTGREEN)
        setPlayerStorageValue(creature, 421321, os.time() + 15)
		else
		combat:execute(creature, variant)
	end
    return true
end