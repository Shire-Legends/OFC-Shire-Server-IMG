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
	creature:setStorageValue(116,getCreatureMaxHealth(creature))
	creature:setStorageValue(117,1)

    if getPlayerStorageValue(creature, 99) > os.time() then
        doPlayerSendCancel(creature, "Espere " .. getPlayerStorageValue(creature, 99) - os.time() .. " segundos para usar a Ess�ncia Vital novamente.")
        return false
    end

	addEvent(function()
        local sucesso, resultado = pcall(function()
		local tempoLoginSaved = creature:getLastLoginSaved()


		if(tempoLoginSaved <= 0)then
			return false
		else
			return true
		end

		end)

		if sucesso then
			if not resultado then
				return true
			end

        	doPlayerSendTextMessage(creature, MESSAGE_STATUS_WARNING, "CD Pronto: Ess�ncia Vital.")
    	end
	return true

	end, 25000)

    -- Define o tempo de cooldown
    setPlayerStorageValue(creature, 99, os.time() + 25)

    -- Aumenta o limite m�ximo de vida
    local aumento = getCreatureMaxHealth(creature) * 1.5
    setCreatureMaxHealth(creature, aumento)

    -- Fun��o para reverter o aumento do limite m�ximo de vida
    local function normallife(creatureId)
        if isCreature(creatureId) then
            setCreatureMaxHealth(creatureId, creature:getStorageValue(116))
        end
    end

    -- Timer para a dura��o da magia
	addEvent(function()
        local sucesso, resultado = pcall(function()
		local tempoLoginSaved = creature:getLastLoginSaved()


		if(tempoLoginSaved <= 0)then
			return false
		else
			return true
		end

		end)

		if sucesso then
			if not resultado then
				return true
			end

			if getCreatureHealth(creature) > 0 and getPlayerStorageValue(creature, 100) == 1 then
	            doSendAnimatedText("Magia Terminada!", creature:getPosition(), TEXTCOLOR_LIGHTGREEN)
				creature:setStorageValue(117,0)
	        else
	            normallife(creature:getId())
	            doSendAnimatedText("Life Down!", creature:getPosition(), TEXTCOLOR_RED)
				creature:setStorageValue(117,0)
	        end
		end
		return true

    end, 15000)

    doSendAnimatedText("Life Up!", creature:getPosition(), TEXTCOLOR_LIGHTGREEN)
    return combat:execute(creature, variant)
end
