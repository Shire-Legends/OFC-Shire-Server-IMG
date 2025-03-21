function onLogin(player)
	local serverName = configManager.getString(configKeys.SERVER_NAME)
	local loginStr = "Welcome to " .. serverName .. "!"

	if player:getStorageValue(117) == 1 then
		setCreatureMaxHealth(player, player:getStorageValue(116))
		player:setStorageValue(117,0)
	end

	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Your last visit in %s: %s.", serverName, os.date("%d %b %Y %X", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	-- -- Promotion
	-- local vocation = player:getVocation()
	-- local promotion = vocation:getPromotion()
	-- if player:isPremium() then
	-- 	local value = player:getStorageValue(PlayerStorageKeys.promotion)
	-- 	if value == 1 then
	-- 		player:setVocation(promotion)
	-- 	end
	-- elseif not promotion then
	-- 	player:setVocation(vocation:getDemotion())
	-- end

	-- Events
	player:registerEvent("PlayerDeath")
	player:registerEvent("criticalHitSystemHP")
	player:registerEvent("criticalHitSystemMP")
	player:registerEvent("DropLoot")
	player:registerEvent("AttackGuild")
	player:registerEvent("GameStore")
	return true
end
