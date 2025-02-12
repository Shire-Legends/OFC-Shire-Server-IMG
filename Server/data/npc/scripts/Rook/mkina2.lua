local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
    npcHandler:onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
    npcHandler:onCreatureDisappear(cid)
end

function onCreatureSay(cid, type, msg)
    npcHandler:onCreatureSay(cid, type, msg)
end

function onThink()
    npcHandler:onThink()
end

local function greetCallback(cid)
    -- count[cid], transfer[cid] = nil, nil
    return true
end

local topicList = {
    NONE = 0,
    MISSIONTEST= 1,
    MISSIONWORM = 2,
    MISSIONSTRAWBARRY = 3,

}



local questNumber = {
	QuestTreinamento = 30036
}

local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if msgcontains(msg, "test") and player:getStorageValue(questNumber.QuestTreinamento) < 10 then
        npcHandler:say("Vamos ver... Vejo que conseguiu desinfestar o nosso acampamento, deseja continuar sua jornada ?", cid)
        npcHandler.topic[cid] = topicList.MISSIONTEST
		return true
	elseif npcHandler.topic[cid] == topicList.MISSIONTEST then
		if msgcontains(msg,"yes") then
			doPlayerSendTextMessage(cid,19,"Voc� agora � um Knight!")
			player:setTown(Town(3))
			player:setVocation(4)
			player:addItem(container)
			player:setStorageValue(questNumber.QuestTreinamento, 10)
			doTeleportThing(cid, {x = 121, y = 311, z = 7})

			addEvent(function ()
				doResetLevel(player)
			end, 3*1000)

		end
		return true
	end
end

npcHandler:setMessage(MESSAGE_GREET, "Parab�ns |PLAYERNAME| , digite 'test' para finalizar sua miss�o.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
